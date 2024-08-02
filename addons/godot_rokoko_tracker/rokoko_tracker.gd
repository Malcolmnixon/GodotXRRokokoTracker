class_name RokokoTracker
extends Node


## Rokoko Tracker Node
##
## This node provides a Rokoko tracker as a scene-tree node. It may also
## be instantiated as an autoload to provide for multiple trackers on different
## ports.


## Face tracker name
@export var face_tracker_name : String = "/rokoko/face_tracker"

## Body tracker name
@export var body_tracker_name : String = "/rokoko/body_tracker"

## Position mode
@export_enum("Free", "Calibrate", "Locked") var position_mode : int = 0

## UDP listener port
@export var udp_listener_port : int = 14043


# Tracker source
var _source : RokokoSource


# On entering the scene-tree, construct the tracker source and start listening
# for incoming packets.
func _enter_tree() -> void:
	_source = RokokoSource.new(
		face_tracker_name,
		body_tracker_name,
		position_mode,
		udp_listener_port)


# On frame processing, poll the tracker source for updates.
func _process(_delta: float) -> void:
	_source.poll()
