extends Control

# Function to change the color of all child labels
func change_label_colors(name: String, new_color: Color):
	for child in get_children():
		if child is Label and child.name == name:
			child.label_settings.font_color = new_color

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

# Optional: Connect the _input function to the input event
func _ready():
	set_process_input(true)
