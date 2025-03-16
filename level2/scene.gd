extends Node

var emileDoor = false
var hansDoor = false

func _on_emileDoor_triggered():
	emileDoor = true
func _on_hansDoor_triggered():
	hansDoor = true

func _ready():
	pass

func _process(delta):
	if hansDoor and emileDoor:
		#Change scene
		SceneTransitioner.transition_to("res://credits/Credits.tscn")
