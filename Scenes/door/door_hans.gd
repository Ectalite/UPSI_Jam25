extends Node

signal area_triggered

@onready var sprite = $Sprite2D as Sprite2D

var active = false

func _ready():
	set_process(false)

func _on_exit_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Hans") and active:
		area_triggered.emit()
		
func unlock():
	set_process(true)
	active = true
	sprite.texture = load("res://Images/Portes/portehansouverte.png")
	
func lock():
	set_process(false)
	active = false
	sprite.texture = load("res://Images/Portes/portehansfermee.png")
