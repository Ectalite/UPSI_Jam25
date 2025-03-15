extends CharacterBody2D


const SPEED = 350.0
const JUMP_VELOCITY = -800.0
@onready var sprite_emile_2d: AnimatedSprite2D = $SpriteEMILE2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if (velocity.x > 1 || velocity.x < -1):
		sprite_emile_2d.animation = "running"
	else:
		sprite_emile_2d.animation = "default"
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("emile_saut") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite_emile_2d.animation = "jumping"

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("emile_gauche", "emile_droite")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 15)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_emile_2d.flip_h = isLeft 
