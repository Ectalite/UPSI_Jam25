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
	if !BackgroundMusic.playing:
		BackgroundMusic.play()

func _process(_delta):
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

func _on_button_porte_hans_button_pressed() -> void:
	BackgroundMusic.volume_db = -10
	$AudioStreamPlayer.play()
	$DoorHans.unlock()

func _on_button_porte_emile_button_pressed() -> void:
	$DoorEmile.unlock()

func _on_audio_stream_player_finished() -> void:
	BackgroundMusic.volume_db = -7
