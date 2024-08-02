class_name RokokoSource
extends Object


## Rokoko Tracker Script
##
## This script processes Rokoko packets into XRFaceTracker and XRBodyTracker
## data for driving avatars.


## Enumeration of position modes
enum PositionMode {
	FREE,			## Free movement
	CALIBRATE,		## Calibrate horizontal position on the first frame
	LOCKED			## Lock horizontal position
}


## Body tracking flags
const BODY_TRACKING := \
	XRBodyTracker.BODY_FLAG_UPPER_BODY_SUPPORTED | \
	XRBodyTracker.BODY_FLAG_LOWER_BODY_SUPPORTED

## Hand tracking flags
const HAND_TRACKING := \
	XRBodyTracker.BODY_FLAG_HANDS_SUPPORTED

## Joint tracking flags
const JOINT_TRACKING := \
	XRBodyTracker.JOINT_FLAG_ORIENTATION_TRACKED | \
	XRBodyTracker.JOINT_FLAG_ORIENTATION_VALID | \
	XRBodyTracker.JOINT_FLAG_POSITION_TRACKED | \
	XRBodyTracker.JOINT_FLAG_POSITION_VALID


# Rokoko reader instance
var _rokoko_reader : RokokoReader = RokokoReader.new()

# Face tracker instance to publish tracking data
var _face_tracker : XRFaceTracker = XRFaceTracker.new()

# Body tracker instance to publish tracking data
var _body_tracker : XRBodyTracker = XRBodyTracker.new()

# Position mode
var _position_mode : PositionMode = PositionMode.FREE

# Position calibration
var _position_calibration : Vector3 = Vector3.ZERO

# Calibrated flag
var _position_calibrated : bool = false


# On initialization, construct and register the face and body trackers and
# start listening for incoming packets.
func _init(
	face_tracker_name : String,
	body_tracker_name : String,
	position_mode : int,
	udp_listener_port : int) -> void:

	# Register the face tracker
	_face_tracker.name = face_tracker_name
	XRServer.add_tracker(_face_tracker)

	# Register the body tracker
	_body_tracker.name = body_tracker_name
	XRServer.add_tracker(_body_tracker)

	# Save the position mode
	_position_mode = position_mode

	# Start listening for VMC packets
	_rokoko_reader.on_rokoko_packet.connect(_on_rokoko_packet)
	_rokoko_reader.listen(udp_listener_port)


# Poll for incoming packets
func poll() -> void:
	_rokoko_reader.poll()


# Handle received Rokoko packet data
func _on_rokoko_packet(data : RokokoBody.BodyData) -> void:

	# Process the body
	if data.has_torso:
		_on_rokoko_body(data)

	# Process the face
	if data.has_face:
		_on_rokoko_face(data)


# Handle body data
func _on_rokoko_body(data : RokokoBody.BodyData) -> void:
	# Skip if no torso
	if not data.has_torso:
		_body_tracker.body_flags = 0
		_body_tracker.has_tracking_data = false
		return

	# Apply to the XRBodyTracker
	for joint in RokokoBody.JOINT_MAPPING:
		var body : XRBodyTracker.Joint = joint.body
		var native : RokokoBody.Joint = joint.native
		var roll : Quaternion = joint.roll
		var pos := data.positions[native]
		var rot := data.rotations[native]

		# Skip fingers if no finger-tracking
		if not data.has_fingers and native >= RokokoBody.Joint.LEFT_THUMB_PROXIMAL:
			_body_tracker.set_joint_flags(body, 0)
			continue

		# Special handing for hip
		if native == RokokoBody.Joint.HIP:
			# Apply position-mode controls
			match _position_mode:
				PositionMode.CALIBRATE:
					# Calibrate on first position
					if not _position_calibrated:
						_position_calibrated = true
						_position_calibration = pos.slide(Vector3.UP)

				PositionMode.LOCKED:
					# Calibrate on every frame
					_position_calibration = pos.slide(Vector3.UP)

		# Apply calibration
		pos -= _position_calibration

		# Set the joint transform
		_body_tracker.set_joint_transform(
			body,
			Transform3D(
				Basis(rot * roll),
				pos))

		# Set the joint flags
		_body_tracker.set_joint_flags(body, JOINT_TRACKING)

	# Get the hips transform
	var hips := _body_tracker.get_joint_transform(XRBodyTracker.JOINT_HIPS)

	# Construct the root under the hips pointing forwards
	var root_y = Vector3.UP
	var root_z = -hips.basis.x.cross(root_y)
	var root_x = root_y.cross(root_z)
	var root_o := hips.origin.slide(Vector3.UP)
	var root := Transform3D(root_x, root_y, root_z, root_o).orthonormalized()
	_body_tracker.set_joint_transform(XRBodyTracker.JOINT_ROOT, root)
	_body_tracker.set_joint_flags(XRBodyTracker.JOINT_ROOT, JOINT_TRACKING)
	_body_tracker.set_pose(
		"default",
		root,
		Vector3.ZERO,
		Vector3.ZERO,
		XRPose.XR_TRACKING_CONFIDENCE_HIGH)

	# Indicate we are tracking the body
	_body_tracker.has_tracking_data = true
	if data.has_fingers:
		_body_tracker.body_flags = BODY_TRACKING | HAND_TRACKING
	else:
		_body_tracker.body_flags = BODY_TRACKING


# Handle face data
func _on_rokoko_face(data : RokokoBody.BodyData) -> void:
	# Apply to the XRFaceTracker
	for blend in RokokoBody.FACE_BLEND_MAPPING:
		var face : Array = blend.face
		var native : Array = blend.native

		var weight := 0.0
		for v in native:
			weight += data.face_blends[v]
		weight /= native.size()

		# Set the face blend weight
		for f in face:
			_face_tracker.set_blend_shape(f, weight)
