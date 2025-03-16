extends Node

var emileDoor = false
var hansDoor = false

var milieu1 = false
var milieu2 = false

func _on_emileDoor_triggered():
	emileDoor = true
func _on_hansDoor_triggered():
	hansDoor = true

func _ready():
	pass

func _process(delta):
	if milieu1 or milieu2:
		$Milieu.enabled = false
		$Milieu.visible = false
	else:
		$Milieu.enabled = true
		$Milieu.visible = true
			
	if hansDoor and emileDoor:
		#Change scene
		SceneTransitioner.transition_to("res://credits/Credits.tscn")
		
func _on_ouverture_milieu_button_pressed() -> void:
	milieu1 = true

func _on_ouverture_milieu_button_released() -> void:
	milieu1 = false

func _on_ouverture_milieu_2_button_pressed() -> void:
	milieu2 = true

func _on_ouverture_milieu_2_button_released() -> void:
	milieu2 = false
