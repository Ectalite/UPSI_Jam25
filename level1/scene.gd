extends Node

var emileDoor = false
var hansDoor = false

func _on_emileDoor_triggered():
	emileDoor = true
func _on_hansDoor_triggered():
	hansDoor = true

func _process(delta):
	if hansDoor and emileDoor:
		#Change scene
		SceneTransitioner.transition_to("res://level1/scene.tscn")

func _on_waterfall_body_entered(body: Node2D) -> void:
	print("Hello World waterfall")
	var waterfall = $Layer1 as TileMapLayer
	waterfall.visible = 0
	waterfall.set_process(false)
	
