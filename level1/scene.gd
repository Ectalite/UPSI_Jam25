extends Node

var emileDoor = false
var hansDoor = false

func _on_emileDoor_triggered():
	emileDoor = true
func _on_hansDoor_triggered():
	hansDoor = true

var waterfallTriggered = false
@onready var waterfall = $Waterfall as TileMapLayer

func _ready():
	waterfall.visible = false
	waterfall.set_process(false)

func _process(delta):
	if hansDoor and emileDoor:
		#Change scene
		SceneTransitioner.transition_to("res://level1/scene.tscn")

func _on_waterfall_body_entered(body: Node2D) -> void:
	if !waterfallTriggered:
		waterfallTriggered = true
		var sound = $Waterfall/WaterfallSound as AudioStreamPlayer
		sound.play()

func _on_button_waterfall_button_pressed() -> void:
	waterfall.visible = true
	waterfall.set_process(true)
	
func _on_button_waterfall_button_released() -> void:
	waterfall.visible = false
	waterfall.set_process(false)

func _on_waterfall_sound_finished() -> void:
	#Unlock doors
	var doorEmile = $DoorEmile as Node2D
	var doorHans = $DoorHans as Node2D
