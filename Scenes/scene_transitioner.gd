extends ColorRect

# Reference to the _AnimationPlayer_ node
@onready var _anim_player = $AnimationPlayer as AnimationPlayer

var _next_scene: String

func _ready() -> void:
	# Plays the animation backward to fade in
	#_anim_player.play("Transition")
	visible = false
	z_index = RenderingServer.CANVAS_ITEM_Z_MAX
	
func transition_to(next_scene: String) -> void:
	# Plays the Fade animation and wait until it finishes
	visible = true
	_anim_player.play("Transition")
	_next_scene = next_scene

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	visible = false
	# Changes the scene
	#get_tree().change_scene_to_file(_next_scene)
	
func change_scene_callback():
	get_tree().change_scene_to_file(_next_scene)
