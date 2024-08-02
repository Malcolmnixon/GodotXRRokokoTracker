extends Node


## Rokoko Plugin Node
##
## This node provides a Rokoko tracker as a plugin autoload singleton.


# Tracker source
var _source : RokokoSource


# On entering the scene-tree, construct the tracker source and start listening
# for incoming packets.
func _enter_tree() -> void:
	# Get the face tracker name
	var face_tracker_name : String = ProjectSettings.get_setting(
		"rokoko_tracker/tracking/face_tracker_name",
		"/rokoko/face_tracker")

	# Get the body tracker name
	var body_tracker_name : String = ProjectSettings.get_setting(
		"rokoko_tracker/tracking/body_tracker_name",
		"/rokoko/body_tracker")

	# Get the position mode
	var position_mode = ProjectSettings.get_setting(
		"rokoko_tracker/tracking/position_mode",
		0)

	# Get the UDP port number
	var udp_listener_port : int = ProjectSettings.get_setting(
		"rokoko_tracker/network/udp_listener_port",
		14043)

	_source = RokokoSource.new(
		face_tracker_name,
		body_tracker_name,
		position_mode,
		udp_listener_port)


# On frame processing, poll the tracker source for updates.
func _process(_delta: float) -> void:
	_source.poll()
