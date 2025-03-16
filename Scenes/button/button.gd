extends Node2D

@onready var sprite = $Sprite2D

signal button_pressed
signal button_released

func _on_area_2d_body_entered(_body: Node2D) -> void:
	sprite.texture = load("res://Scenes/button/plaquebas.png")
	button_pressed.emit()

func _on_area_2d_body_exited(_body: Node2D) -> void:
	sprite.texture = load("res://Scenes/button/plaquehaut.png")
	button_released.emit()

func _ready() -> void:
	sprite.texture = load("res://Scenes/button/plaquehaut.png")
