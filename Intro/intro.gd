extends Node2D

var activate = false
@onready var Emile = $CharacterBodyEMILE
@onready var Hans = $CharacterBodyHANS
var emilePlaced = false
var hansPlaced = false

# Function to change the color of all child labels
func change_label_colors(nameNode: String, new_color: Color):
	for child in get_children():
		for subchild in child.get_children():
			if subchild is Label and subchild.name == nameNode:
				subchild.label_settings.font_color = new_color
				
func change_alpha(new_alpha: Color):
	for child in get_children():
		if child.name == "TextGauche" or child.name == "TextDroit":
			for subchild in child.get_children():
				if subchild is Label:
					if subchild.label_settings.font_color != Color(0, 1, 0):
						subchild.label_settings.font_color = new_alpha
						
func createPerso(persoName: String):
	if persoName == "emile" and !emilePlaced:
		emilePlaced = true
		Emile.position = Vector2(1352, 680)
	elif persoName == "hans" and !hansPlaced:
		hansPlaced = true
		Hans.position = Vector2(352, 680)

# Function to handle keyboard input
func _input(event):
	if activate and event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_UP:
				createPerso("emile")
				change_label_colors("Up",Color(0, 1, 0)) # Validate
			KEY_LEFT:
				createPerso("emile")
				change_label_colors("Left",Color(0, 1, 0)) # Validate
			KEY_RIGHT:
				createPerso("emile")
				change_label_colors("Right",Color(0, 1, 0)) # Validate
			KEY_DOWN:
				createPerso("emile")
				change_label_colors("Down",Color(0, 1, 0)) # Validat
			KEY_W:
				createPerso("hans")
				change_label_colors("W",Color(0, 1, 0)) # Validate
			KEY_A:
				createPerso("hans")
				change_label_colors("A",Color(0, 1, 0)) # Validate
			KEY_S:
				createPerso("hans")
				change_label_colors("S",Color(0, 1, 0)) # Validate
			KEY_D:
				createPerso("hans")
				change_label_colors("D",Color(0, 1, 0)) # Validate

var alpha = 0
var increasing = true
const alpha_speed = 0.7

func _process(delta):
	if increasing:
		alpha += delta*alpha_speed
		if alpha > 1:
			increasing = false
	else:
		alpha -= delta*alpha_speed
		if alpha < 0.1:
			increasing = true
	change_alpha(Color(1,1,1,alpha))

# Optional: Connect the _input function to the input event
func _ready():
	set_process_input(true)

@warning_ignore("unused_parameter")
func _on_titre_animation_animation_finished(anim_name: StringName) -> void:
	activate = true
	
