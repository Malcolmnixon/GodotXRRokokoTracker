class_name RokokoReader
extends Object


## Rokoko Reader Script
##
## This script implements a basic Rokoko packet reader. The listen method is
## used to start the UDP server. The poll method should be called to poll for
## incoming packets. Packets are decoded and dispatched through the
## on_rokoko_packet signal.


## Rokoko packet received signal
signal on_rokoko_packet(data : RokokoBody.BodyData)


# UDP Server
var _server : UDPServer = UDPServer.new()

# Current connection
var _connection : PacketPeerUDP

# Body data
var _data := RokokoBody.BodyData.new()


## Stop listening
func stop() -> void:
	_server.stop()
	_connection = null


## Start listening
func listen(p_port : int = 14043) -> void:
	stop()
	_server.listen(p_port)


## Poll for incoming packets
func poll() -> void:
	# Poll the server
	_server.poll()

	# Switch to any new connection
	if _server.is_connection_available():
		_connection = _server.take_connection()

	# Skip if no connection
	if not _connection:
		return

	# Loop processing the incoming packets
	while _connection.get_available_packet_count() > 0:
		# Get the packet as UTF8
		var packet := _connection.get_packet().get_string_from_utf8()

		# Decode the JSON packet
		var json := JSON.parse_string(packet)

		# Reject if not dictionary
		if typeof(json) != TYPE_DICTIONARY:
			continue

		# Process the data
		_process_json(json)


# Process received json data
func _process_json(json : Dictionary) -> void:
	# Get the actor
	var actor : Dictionary = json.scene.actors[0]

	# Process the metadata
	_data.has_torso = actor.meta.hasBody
	_data.has_fingers = actor.meta.hasGloves
	_data.has_face = actor.meta.hasFace

	# Process the body
	if _data.has_torso:
		_process_body(actor.body)

	if _data.has_face:
		_process_face(actor.face)

	# Report the packet
	on_rokoko_packet.emit(_data)


# Process received body
func _process_body(body : Dictionary) -> void:
	# Process all body entries
	for key in body:
		# Get the joint
		var joint : RokokoBody.Joint = RokokoBody.JOINT_NAMES.get(key, -1)
		if joint < 0:
			continue

		# Get the data
		var data : Dictionary = body[key]
		var pos : Dictionary = data.position
		var rot : Dictionary = data.rotation

		# Set the position and rotation
		_data.positions[joint] = Vector3(pos.x, pos.y, -pos.z)
		_data.rotations[joint] = Quaternion(rot.x, rot.y, -rot.z, -rot.w)


# Process received face
func _process_face(face : Dictionary) -> void:
	# Process all face entries
	for key in face:
		# Get the blend
		var blend : RokokoBody.FaceBlend = RokokoBody.FACE_BLEND_NAMES.get(key, -1)
		if blend < 0:
			continue

		# Set the face blend
		_data.face_blends[blend] = face[key] * 0.01
