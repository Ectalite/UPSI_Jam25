extends Node2D

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

# Function to handle keyboard input
func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_UP:
				change_label_colors("Up",Color(0, 1, 0)) # Validate
			KEY_LEFT:
				change_label_colors("Left",Color(0, 1, 0)) # Validate
			KEY_RIGHT:
				change_label_colors("Right",Color(0, 1, 0)) # Validate
			KEY_DOWN:
				change_label_colors("Down",Color(0, 1, 0)) # Validat
			KEY_W:
				change_label_colors("W",Color(0, 1, 0)) # Validate
			KEY_A:
				change_label_colors("A",Color(0, 1, 0)) # Validate
			KEY_S:
				change_label_colors("S",Color(0, 1, 0)) # Validate
			KEY_D:
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
