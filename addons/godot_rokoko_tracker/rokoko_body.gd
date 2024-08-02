class_name RokokoBody


## Constants for Rokoko Body
##
## This script contains the definition required to interpret the Rokoko body
## and translate it to XRBodyTracker and XRFaceTracker format.


## Enumeration of Rokoko joints
enum Joint {
	HIP,
	SPINE,
	CHEST,
	NECK,
	HEAD,
	LEFT_SHOULDER,
	LEFT_UPPER_ARM,
	LEFT_LOWER_ARM,
	LEFT_HAND,
	RIGHT_SHOULDER,
	RIGHT_UPPER_ARM,
	RIGHT_LOWER_ARM,
	RIGHT_HAND,
	LEFT_UP_LEG,
	LEFT_LEG,
	LEFT_FOOT,
	LEFT_TOE,
	RIGHT_UP_LEG,
	RIGHT_LEG,
	RIGHT_FOOT,
	RIGHT_TOE,
	LEFT_THUMB_PROXIMAL,
	LEFT_THUMB_MEDIAL,
	LEFT_THUMB_DISTAL,
	LEFT_THUMB_TIP,
	LEFT_INDEX_PROXIMAL,
	LEFT_INDEX_MEDIAL,
	LEFT_INDEX_DISTAL,
	LEFT_INDEX_TIP,
	LEFT_MIDDLE_PROXIMAL,
	LEFT_MIDDLE_MEDIAL,
	LEFT_MIDDLE_DISTAL,
	LEFT_MIDDLE_TIP,
	LEFT_RING_PROXIMAL,
	LEFT_RING_MEDIAL,
	LEFT_RING_DISTAL,
	LEFT_RING_TIP,
	LEFT_LITTLE_PROXIMAL,
	LEFT_LITTLE_MEDIAL,
	LEFT_LITTLE_DISTAL,
	LEFT_LITTLE_TIP,
	RIGHT_THUMB_PROXIMAL,
	RIGHT_THUMB_MEDIAL,
	RIGHT_THUMB_DISTAL,
	RIGHT_THUMB_TIP,
	RIGHT_INDEX_PROXIMAL,
	RIGHT_INDEX_MEDIAL,
	RIGHT_INDEX_DISTAL,
	RIGHT_INDEX_TIP,
	RIGHT_MIDDLE_PROXIMAL,
	RIGHT_MIDDLE_MEDIAL,
	RIGHT_MIDDLE_DISTAL,
	RIGHT_MIDDLE_TIP,
	RIGHT_RING_PROXIMAL,
	RIGHT_RING_MEDIAL,
	RIGHT_RING_DISTAL,
	RIGHT_RING_TIP,
	RIGHT_LITTLE_PROXIMAL,
	RIGHT_LITTLE_MEDIAL,
	RIGHT_LITTLE_DISTAL,
	RIGHT_LITTLE_TIP,
	COUNT
}

## Enumeration of Rokoko face blends
enum FaceBlend {
	EYE_LOOK_OUT_RIGHT,
	EYE_LOOK_IN_RIGHT,
	EYE_LOOK_UP_RIGHT,
	EYE_LOOK_DOWN_RIGHT,
	EYE_LOOK_OUT_LEFT,
	EYE_LOOK_IN_LEFT,
	EYE_LOOK_UP_LEFT,
	EYE_LOOK_DOWN_LEFT,
	EYE_BLINK_RIGHT,
	EYE_BLINK_LEFT,
	EYE_SQUINT_RIGHT,
	EYE_SQUINT_LEFT,
	EYE_WIDE_RIGHT,
	EYE_WIDE_LEFT,
	BROW_DOWN_RIGHT,
	BROW_DOWN_LEFT,
	BROW_INNER_UP,
	BROW_OUTER_UP_RIGHT,
	BROW_OUTER_UP_LEFT,
	NOSE_SNEER_RIGHT,
	NOSE_SNEER_LEFT,
	CHEEK_SQUINT_RIGHT,
	CHEEK_SQUINT_LEFT,
	CHEEK_PUFF,
	JAW_OPEN,
	MOUTH_CLOSE,
	JAW_RIGHT,
	JAW_LEFT,
	JAW_FORWARD,
	MOUTH_FUNNEL,
	MOUTH_PUCKER,
	MOUTH_UPPER_UP_RIGHT,
	MOUTH_UPPER_UP_LEFT,
	MOUTH_LOWER_DOWN_RIGHT,
	MOUTH_LOWER_DOWN_LEFT,
	MOUTH_SMILE_RIGHT,
	MOUTH_SMILE_LEFT,
	MOUTH_FROWN_RIGHT,
	MOUTH_FROWN_LEFT,
	MOUTH_STRETCH_RIGHT,
	MOUTH_STRETCH_LEFT,
	MOUTH_DIMPLE_RIGHT,
	MOUTH_DIMPLE_LEFT,
	MOUTH_PRESS_RIGHT,
	MOUTH_PRESS_LEFT,
	MOUTH_SHRUG_UPPER,
	MOUTH_SHRUG_LOWER,
	TONGUE_OUT,
	MOUTH_ROLL_UPPER,
	MOUTH_ROLL_LOWER,
	MOUTH_RIGHT,
	MOUTH_LEFT,
	COUNT
}

## Dictionary of Rokoko Joint names to joints
const JOINT_NAMES := {
	&"hip" : Joint.HIP,
	&"spine" : Joint.SPINE,
	&"chest" : Joint.CHEST,
	&"neck" : Joint.NECK,
	&"head" : Joint.HEAD,
	&"leftShoulder" : Joint.LEFT_SHOULDER,
	&"leftUpperArm" : Joint.LEFT_UPPER_ARM,
	&"leftLowerArm" : Joint.LEFT_LOWER_ARM,
	&"leftHand" : Joint.LEFT_HAND,
	&"rightShoulder" : Joint.RIGHT_SHOULDER,
	&"rightUpperArm" : Joint.RIGHT_UPPER_ARM,
	&"rightLowerArm" : Joint.RIGHT_LOWER_ARM,
	&"rightHand" : Joint.RIGHT_HAND,
	&"leftUpLeg" : Joint.LEFT_UP_LEG,
	&"leftLeg" : Joint.LEFT_LEG,
	&"leftFoot" : Joint.LEFT_FOOT,
	&"leftToe" : Joint.LEFT_TOE,
	&"rightUpLeg" : Joint.RIGHT_UP_LEG,
	&"rightLeg" : Joint.RIGHT_LEG,
	&"rightFoot" : Joint.RIGHT_FOOT,
	&"rightToe" : Joint.RIGHT_TOE,
	&"leftThumbProximal" : Joint.LEFT_THUMB_PROXIMAL,
	&"leftThumbMedial" : Joint.LEFT_THUMB_MEDIAL,
	&"leftThumbDistal" : Joint.LEFT_THUMB_DISTAL,
	&"leftThumbTip" : Joint.LEFT_THUMB_TIP,
	&"leftIndexProximal" : Joint.LEFT_INDEX_PROXIMAL,
	&"leftIndexMedial" : Joint.LEFT_INDEX_MEDIAL,
	&"leftIndexDistal" : Joint.LEFT_INDEX_DISTAL,
	&"leftIndexTip" : Joint.LEFT_INDEX_TIP,
	&"leftMiddleProximal" : Joint.LEFT_MIDDLE_PROXIMAL,
	&"leftMiddleMedial" : Joint.LEFT_MIDDLE_MEDIAL,
	&"leftMiddleDistal" : Joint.LEFT_MIDDLE_DISTAL,
	&"leftMiddleTip" : Joint.LEFT_MIDDLE_TIP,
	&"leftRingProximal" : Joint.LEFT_RING_PROXIMAL,
	&"leftRingMedial" : Joint.LEFT_RING_MEDIAL,
	&"leftRingDistal" : Joint.LEFT_RING_DISTAL,
	&"leftRingTip" : Joint.LEFT_RING_TIP,
	&"leftLittleProximal" : Joint.LEFT_LITTLE_PROXIMAL,
	&"leftLittleMedial" : Joint.LEFT_LITTLE_MEDIAL,
	&"leftLittleDistal" : Joint.LEFT_LITTLE_DISTAL,
	&"leftLittleTip" : Joint.LEFT_LITTLE_TIP,
	&"rightThumbProximal" : Joint.RIGHT_THUMB_PROXIMAL,
	&"rightThumbMedial" : Joint.RIGHT_THUMB_MEDIAL,
	&"rightThumbDistal" : Joint.RIGHT_THUMB_DISTAL,
	&"rightThumbTip" : Joint.RIGHT_THUMB_TIP,
	&"rightIndexProximal" : Joint.RIGHT_INDEX_PROXIMAL,
	&"rightIndexMedial" : Joint.RIGHT_INDEX_MEDIAL,
	&"rightIndexDistal" : Joint.RIGHT_INDEX_DISTAL,
	&"rightIndexTip" : Joint.RIGHT_INDEX_TIP,
	&"rightMiddleProximal" : Joint.RIGHT_MIDDLE_PROXIMAL,
	&"rightMiddleMedial" : Joint.RIGHT_MIDDLE_MEDIAL,
	&"rightMiddleDistal" : Joint.RIGHT_MIDDLE_DISTAL,
	&"rightMiddleTip" : Joint.RIGHT_MIDDLE_TIP,
	&"rightRingProximal" : Joint.RIGHT_RING_PROXIMAL,
	&"rightRingMedial" : Joint.RIGHT_RING_MEDIAL,
	&"rightRingDistal" : Joint.RIGHT_RING_DISTAL,
	&"rightRingTip" : Joint.RIGHT_RING_TIP,
	&"rightLittleProximal" : Joint.RIGHT_LITTLE_PROXIMAL,
	&"rightLittleMedial" : Joint.RIGHT_LITTLE_MEDIAL,
	&"rightLittleDistal" : Joint.RIGHT_LITTLE_DISTAL,
	&"rightLittleTip" : Joint.RIGHT_LITTLE_TIP
}

## Dictionary of Rokoko Blend names to face blends
const FACE_BLEND_NAMES := {
	&"eyeLookOutRight" : FaceBlend.EYE_LOOK_OUT_RIGHT,
	&"eyeLookInRight" : FaceBlend.EYE_LOOK_IN_RIGHT,
	&"eyeLookUpRight" : FaceBlend.EYE_LOOK_UP_RIGHT,
	&"eyeLookDownRight" : FaceBlend.EYE_LOOK_DOWN_RIGHT,
	&"eyeLookOutLeft" : FaceBlend.EYE_LOOK_OUT_LEFT,
	&"eyeLookInLeft" : FaceBlend.EYE_LOOK_IN_LEFT,
	&"eyeLookUpLeft" : FaceBlend.EYE_LOOK_UP_LEFT,
	&"eyeLookDownLeft" : FaceBlend.EYE_LOOK_DOWN_LEFT,
	&"eyeBlinkRight" : FaceBlend.EYE_BLINK_RIGHT,
	&"eyeBlinkLeft" : FaceBlend.EYE_BLINK_LEFT,
	&"eyeSquintRight" : FaceBlend.EYE_SQUINT_RIGHT,
	&"eyeSquintLeft" : FaceBlend.EYE_SQUINT_LEFT,
	&"eyeWideRight" : FaceBlend.EYE_WIDE_RIGHT,
	&"eyeWideLeft" : FaceBlend.EYE_WIDE_LEFT,
	&"browDownRight" : FaceBlend.BROW_DOWN_RIGHT,
	&"browDownLeft" : FaceBlend.BROW_DOWN_LEFT,
	&"browInnerUp" : FaceBlend.BROW_INNER_UP,
	&"browOuterUpRight" : FaceBlend.BROW_OUTER_UP_RIGHT,
	&"browOuterUpLeft" : FaceBlend.BROW_OUTER_UP_LEFT,
	&"noseSneerRight" : FaceBlend.NOSE_SNEER_RIGHT,
	&"noseSneerLeft" : FaceBlend.NOSE_SNEER_LEFT,
	&"cheekSquintRight" : FaceBlend.CHEEK_SQUINT_RIGHT,
	&"cheekSquintLeft" : FaceBlend.CHEEK_SQUINT_LEFT,
	&"cheekPuff" : FaceBlend.CHEEK_PUFF,
	&"jawOpen" : FaceBlend.JAW_OPEN,
	&"mouthClose" : FaceBlend.MOUTH_CLOSE,
	&"jawRight" : FaceBlend.JAW_RIGHT,
	&"jawLeft" : FaceBlend.JAW_LEFT,
	&"jawForward" : FaceBlend.JAW_FORWARD,
	&"mouthFunnel" : FaceBlend.MOUTH_FUNNEL,
	&"mouthPucker" : FaceBlend.MOUTH_PUCKER,
	&"mouthUpperUpRight" : FaceBlend.MOUTH_UPPER_UP_RIGHT,
	&"mouthUpperUpLeft" : FaceBlend.MOUTH_UPPER_UP_LEFT,
	&"mouthLowerDownRight" : FaceBlend.MOUTH_LOWER_DOWN_RIGHT,
	&"mouthLowerDownLeft" : FaceBlend.MOUTH_LOWER_DOWN_LEFT,
	&"mouthSmileRight" : FaceBlend.MOUTH_SMILE_RIGHT,
	&"mouthSmileLeft" : FaceBlend.MOUTH_SMILE_LEFT,
	&"mouthFrownRight" : FaceBlend.MOUTH_FROWN_RIGHT,
	&"mouthFrownLeft" : FaceBlend.MOUTH_FROWN_LEFT,
	&"mouthStretchRight" : FaceBlend.MOUTH_STRETCH_RIGHT,
	&"mouthStretchLeft" : FaceBlend.MOUTH_STRETCH_LEFT,
	&"mouthDimpleRight" : FaceBlend.MOUTH_DIMPLE_RIGHT,
	&"mouthDimpleLeft" : FaceBlend.MOUTH_DIMPLE_LEFT,
	&"mouthPressRight" : FaceBlend.MOUTH_PRESS_RIGHT,
	&"mouthPressLeft" : FaceBlend.MOUTH_PRESS_LEFT,
	&"mouthShrugUpper" : FaceBlend.MOUTH_SHRUG_UPPER,
	&"mouthShrugLower" : FaceBlend.MOUTH_SHRUG_LOWER,
	&"tongueOut" : FaceBlend.TONGUE_OUT,
	&"mouthRollUpper" : FaceBlend.MOUTH_ROLL_UPPER,
	&"mouthRollLower" : FaceBlend.MOUTH_ROLL_LOWER,
	&"mouthRight" : FaceBlend.MOUTH_RIGHT,
	&"mouthLeft" : FaceBlend.MOUTH_LEFT
}

## Table of mappings from Rokoko joints to XRBodyTracker
const JOINT_MAPPING : Array[Dictionary] = [
	# Torso Joints
	{
		body = XRBodyTracker.JOINT_HIPS,
		native = Joint.HIP,
		roll = Quaternion(0.0, 1.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_SPINE,
		native = Joint.SPINE,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_CHEST,
		native = Joint.CHEST,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_UPPER_CHEST,
		native = Joint.CHEST,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_NECK,
		native = Joint.NECK,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_HEAD,
		native = Joint.HEAD,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_SHOULDER,
		native = Joint.LEFT_SHOULDER,
		roll = Quaternion(-0.7071068, 0.0, 0.7071068, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_UPPER_ARM,
		native = Joint.LEFT_UPPER_ARM,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_LOWER_ARM,
		native = Joint.LEFT_LOWER_ARM,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_HAND,
		native = Joint.LEFT_HAND,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PALM,
		native = Joint.LEFT_HAND,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_SHOULDER,
		native = Joint.RIGHT_SHOULDER,
		roll = Quaternion(0.7071068, 0.0, 0.7071068, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_UPPER_ARM,
		native = Joint.RIGHT_UPPER_ARM,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_LOWER_ARM,
		native = Joint.RIGHT_LOWER_ARM,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_HAND,
		native = Joint.RIGHT_HAND,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PALM,
		native = Joint.RIGHT_HAND,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_UPPER_LEG,
		native = Joint.LEFT_UP_LEG,
		roll = Quaternion(0.7071068, 0.0, -0.7071068, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_LOWER_LEG,
		native = Joint.LEFT_LEG,
		roll = Quaternion(0.7071068, 0.0, 0.7071068, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_FOOT,
		native = Joint.LEFT_FOOT,
		roll = Quaternion(0.0, 0.0, 1.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_TOES,
		native = Joint.LEFT_TOE,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_UPPER_LEG,
		native = Joint.RIGHT_UP_LEG,
		roll = Quaternion(0.7071068, 0, 0.7071068, 0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_LOWER_LEG,
		native = Joint.RIGHT_LEG,
		roll = Quaternion(0.7071068, 0, -0.7071068, 0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_FOOT,
		native = Joint.RIGHT_FOOT,
		roll = Quaternion(0.0, 0.0, 1.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_TOES,
		native = Joint.RIGHT_TOE,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},

	# Hand Joints
	{
		body = XRBodyTracker.JOINT_LEFT_THUMB_METACARPAL,
		native = Joint.LEFT_THUMB_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_THUMB_PHALANX_PROXIMAL,
		native = Joint.LEFT_THUMB_MEDIAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_THUMB_PHALANX_DISTAL,
		native = Joint.LEFT_THUMB_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_THUMB_TIP,
		native = Joint.LEFT_THUMB_TIP,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_INDEX_FINGER_PHALANX_PROXIMAL,
		native = Joint.LEFT_INDEX_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_INDEX_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.LEFT_INDEX_MEDIAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_INDEX_FINGER_PHALANX_DISTAL,
		native = Joint.LEFT_INDEX_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_INDEX_FINGER_TIP,
		native = Joint.LEFT_INDEX_TIP,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_MIDDLE_FINGER_PHALANX_PROXIMAL,
		native = Joint.LEFT_MIDDLE_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_MIDDLE_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.LEFT_MIDDLE_MEDIAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_MIDDLE_FINGER_PHALANX_DISTAL,
		native = Joint.LEFT_MIDDLE_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_MIDDLE_FINGER_TIP,
		native = Joint.LEFT_MIDDLE_TIP,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_RING_FINGER_PHALANX_PROXIMAL,
		native = Joint.LEFT_RING_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_RING_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.LEFT_RING_MEDIAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_RING_FINGER_PHALANX_DISTAL,
		native = Joint.LEFT_RING_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_RING_FINGER_TIP,
		native = Joint.LEFT_RING_TIP,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PINKY_FINGER_PHALANX_PROXIMAL,
		native = Joint.LEFT_LITTLE_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PINKY_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.LEFT_LITTLE_MEDIAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PINKY_FINGER_PHALANX_DISTAL,
		native = Joint.LEFT_LITTLE_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_LEFT_PINKY_FINGER_TIP,
		native = Joint.LEFT_LITTLE_TIP,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_THUMB_METACARPAL,
		native = Joint.RIGHT_THUMB_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_THUMB_PHALANX_PROXIMAL,
		native = Joint.RIGHT_THUMB_MEDIAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_THUMB_PHALANX_DISTAL,
		native = Joint.RIGHT_THUMB_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_THUMB_TIP,
		native = Joint.RIGHT_THUMB_TIP,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_INDEX_FINGER_PHALANX_PROXIMAL,
		native = Joint.RIGHT_INDEX_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_INDEX_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.RIGHT_INDEX_MEDIAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_INDEX_FINGER_PHALANX_DISTAL,
		native = Joint.RIGHT_INDEX_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_INDEX_FINGER_TIP,
		native = Joint.RIGHT_INDEX_TIP,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_MIDDLE_FINGER_PHALANX_PROXIMAL,
		native = Joint.RIGHT_MIDDLE_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_MIDDLE_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.RIGHT_MIDDLE_MEDIAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_MIDDLE_FINGER_PHALANX_DISTAL,
		native = Joint.RIGHT_MIDDLE_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_MIDDLE_FINGER_TIP,
		native = Joint.RIGHT_MIDDLE_TIP,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_RING_FINGER_PHALANX_PROXIMAL,
		native = Joint.RIGHT_RING_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_RING_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.RIGHT_RING_MEDIAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_RING_FINGER_PHALANX_DISTAL,
		native = Joint.RIGHT_RING_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_RING_FINGER_TIP,
		native = Joint.RIGHT_RING_TIP,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PINKY_FINGER_PHALANX_PROXIMAL,
		native = Joint.RIGHT_LITTLE_PROXIMAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PINKY_FINGER_PHALANX_INTERMEDIATE,
		native = Joint.RIGHT_LITTLE_MEDIAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PINKY_FINGER_PHALANX_DISTAL,
		native = Joint.RIGHT_LITTLE_DISTAL,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	},
	{
		body = XRBodyTracker.JOINT_RIGHT_PINKY_FINGER_TIP,
		native = Joint.RIGHT_LITTLE_TIP,
		roll = Quaternion(1.0, 0.0, 0.0, 0.0)
	}
]

## Mapping of XRFaceTracker blends to Rokoko face blends
const FACE_BLEND_MAPPING : Array[Dictionary] = [
	# Upper Body Joints
	{
		face = [ XRFaceTracker.FT_EYE_LOOK_OUT_RIGHT ],
		native = [ FaceBlend.EYE_LOOK_OUT_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_LOOK_IN_RIGHT ],
		native = [ FaceBlend.EYE_LOOK_IN_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_LOOK_UP_RIGHT ],
		native = [ FaceBlend.EYE_LOOK_UP_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_LOOK_DOWN_RIGHT ],
		native = [ FaceBlend.EYE_LOOK_DOWN_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_LOOK_OUT_LEFT ],
		native = [ FaceBlend.EYE_LOOK_OUT_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_LOOK_IN_LEFT ],
		native = [ FaceBlend.EYE_LOOK_IN_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_LOOK_UP_LEFT ],
		native = [ FaceBlend.EYE_LOOK_UP_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_LOOK_DOWN_LEFT ],
		native = [ FaceBlend.EYE_LOOK_DOWN_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_CLOSED_RIGHT ],
		native = [ FaceBlend.EYE_BLINK_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_CLOSED_LEFT ],
		native = [ FaceBlend.EYE_BLINK_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_CLOSED ],
		native = [ FaceBlend.EYE_BLINK_RIGHT,
				FaceBlend.EYE_BLINK_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_SQUINT_RIGHT ],
		native = [ FaceBlend.EYE_SQUINT_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_SQUINT_LEFT ],
		native = [ FaceBlend.EYE_SQUINT_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_SQUINT ],
		native = [ FaceBlend.EYE_SQUINT_RIGHT,
				FaceBlend.EYE_SQUINT_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_WIDE_RIGHT ],
		native = [ FaceBlend.EYE_WIDE_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_WIDE_LEFT ],
		native = [ FaceBlend.EYE_WIDE_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_EYE_WIDE ],
		native = [ FaceBlend.EYE_WIDE_RIGHT,
				FaceBlend.EYE_WIDE_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_BROW_DOWN_RIGHT ],
		native = [ FaceBlend.BROW_DOWN_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_BROW_DOWN_LEFT ],
		native = [ FaceBlend.BROW_DOWN_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_BROW_DOWN ],
		native = [ FaceBlend.BROW_DOWN_RIGHT,
				FaceBlend.BROW_DOWN_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_BROW_INNER_UP_LEFT,
				XRFaceTracker.FT_BROW_INNER_UP_RIGHT ],
		native = [ FaceBlend.BROW_INNER_UP ],
	},
	{
		face = [ XRFaceTracker.FT_BROW_OUTER_UP_RIGHT ],
		native = [ FaceBlend.BROW_OUTER_UP_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_BROW_OUTER_UP_LEFT ],
		native = [ FaceBlend.BROW_OUTER_UP_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_NOSE_SNEER_RIGHT ],
		native = [ FaceBlend.NOSE_SNEER_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_NOSE_SNEER_LEFT ],
		native = [ FaceBlend.NOSE_SNEER_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_NOSE_SNEER ],
		native = [ FaceBlend.NOSE_SNEER_RIGHT,
				FaceBlend.NOSE_SNEER_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_CHEEK_SQUINT_RIGHT ],
		native = [ FaceBlend.CHEEK_SQUINT_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_CHEEK_SQUINT_LEFT ],
		native = [ FaceBlend.CHEEK_SQUINT_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_CHEEK_SQUINT ],
		native = [ FaceBlend.CHEEK_SQUINT_RIGHT,
				FaceBlend.CHEEK_SQUINT_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_CHEEK_PUFF,
				XRFaceTracker.FT_CHEEK_PUFF_RIGHT,
				XRFaceTracker.FT_CHEEK_PUFF_LEFT ],
		native = [ FaceBlend.CHEEK_PUFF ],
	},
	{
		face = [ XRFaceTracker.FT_JAW_OPEN ],
		native = [ FaceBlend.JAW_OPEN ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_CLOSED ],
		native = [ FaceBlend.MOUTH_CLOSE ],
	},
	{
		face = [ XRFaceTracker.FT_JAW_RIGHT ],
		native = [ FaceBlend.JAW_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_JAW_LEFT ],
		native = [ FaceBlend.JAW_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_JAW_FORWARD ],
		native = [ FaceBlend.JAW_FORWARD ],
	},
	{
		face = [ XRFaceTracker.FT_LIP_FUNNEL,
				XRFaceTracker.FT_LIP_FUNNEL_UPPER,
				XRFaceTracker.FT_LIP_FUNNEL_LOWER ],
		native = [ FaceBlend.MOUTH_FUNNEL ],
	},
	{
		face = [ XRFaceTracker.FT_LIP_PUCKER,
				XRFaceTracker.FT_LIP_PUCKER_UPPER,
				XRFaceTracker.FT_LIP_PUCKER_LOWER ],
		native = [ FaceBlend.MOUTH_PUCKER ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_UPPER_UP_RIGHT ],
		native = [ FaceBlend.MOUTH_UPPER_UP_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_UPPER_UP_LEFT ],
		native = [ FaceBlend.MOUTH_UPPER_UP_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_UPPER_UP ],
		native = [ FaceBlend.MOUTH_UPPER_UP_RIGHT,
				FaceBlend.MOUTH_UPPER_UP_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_LOWER_DOWN_RIGHT ],
		native = [ FaceBlend.MOUTH_LOWER_DOWN_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_LOWER_DOWN_LEFT ],
		native = [ FaceBlend.MOUTH_LOWER_DOWN_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_LOWER_DOWN ],
		native = [ FaceBlend.MOUTH_LOWER_DOWN_RIGHT,
				FaceBlend.MOUTH_LOWER_DOWN_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_SMILE_RIGHT ],
		native = [ FaceBlend.MOUTH_SMILE_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_SMILE_LEFT ],
		native = [ FaceBlend.MOUTH_SMILE_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_SMILE ],
		native = [ FaceBlend.MOUTH_SMILE_RIGHT,
				FaceBlend.MOUTH_SMILE_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_FROWN_RIGHT ],
		native = [ FaceBlend.MOUTH_FROWN_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_FROWN_LEFT ],
		native = [ FaceBlend.MOUTH_FROWN_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_STRETCH_RIGHT ],
		native = [ FaceBlend.MOUTH_STRETCH_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_STRETCH_LEFT ],
		native = [ FaceBlend.MOUTH_STRETCH_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_STRETCH ],
		native = [ FaceBlend.MOUTH_STRETCH_RIGHT,
				FaceBlend.MOUTH_STRETCH_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_DIMPLE_RIGHT ],
		native = [ FaceBlend.MOUTH_DIMPLE_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_DIMPLE_LEFT ],
		native = [ FaceBlend.MOUTH_DIMPLE_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_DIMPLE ],
		native = [ FaceBlend.MOUTH_DIMPLE_RIGHT,
				FaceBlend.MOUTH_DIMPLE_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_PRESS_RIGHT ],
		native = [ FaceBlend.MOUTH_PRESS_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_PRESS_LEFT ],
		native = [ FaceBlend.MOUTH_PRESS_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_PRESS ],
		native = [ FaceBlend.MOUTH_PRESS_RIGHT,
				FaceBlend.MOUTH_PRESS_LEFT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_RAISER_UPPER ],
		native = [ FaceBlend.MOUTH_SHRUG_UPPER ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_RAISER_LOWER ],
		native = [ FaceBlend.MOUTH_SHRUG_LOWER ],
	},
	{
		face = [ XRFaceTracker.FT_TONGUE_OUT ],
		native = [ FaceBlend.TONGUE_OUT ],
	},
	{
		face = [ XRFaceTracker.FT_LIP_SUCK_UPPER,
				XRFaceTracker.FT_LIP_SUCK_UPPER_LEFT,
				XRFaceTracker.FT_LIP_SUCK_UPPER_RIGHT ],
		native = [ FaceBlend.MOUTH_ROLL_UPPER ],
	},
	{
		face = [ XRFaceTracker.FT_LIP_SUCK_LOWER,
				XRFaceTracker.FT_LIP_SUCK_LOWER_LEFT,
				XRFaceTracker.FT_LIP_SUCK_LOWER_RIGHT ],
		native = [ FaceBlend.MOUTH_ROLL_LOWER ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_RIGHT ],
		native = [ FaceBlend.MOUTH_RIGHT ],
	},
	{
		face = [ XRFaceTracker.FT_MOUTH_LEFT ],
		native = [ FaceBlend.MOUTH_LEFT ],
	}
]


## Body Data class
class BodyData:
	## Joint positions
	var positions : Array[Vector3]

	## Joint rotations
	var rotations : Array[Quaternion]

	## Facial blend-shapes
	var face_blends : Array[float]

	## Has torso flag
	var has_torso : bool

	## Has fingers flag
	var has_fingers : bool

	## Has face flag
	var has_face

	# Initialize the Body Data class
	func _init():
		# Initialize the positions array
		positions = []
		positions.resize(Joint.COUNT)
		positions.fill(Vector3.ZERO)

		# Initialize the rotations array
		rotations = []
		rotations.resize(Joint.COUNT)
		rotations.fill(Vector3.ZERO)

		# Initialize the face-blend array
		face_blends = []
		face_blends.resize(FaceBlend.COUNT)
		face_blends.fill(0.0)
