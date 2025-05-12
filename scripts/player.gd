extends CharacterBody2D

@onready var player_animation : AnimatedSprite2D = $PlayerAnimation

# Player movement settings
const SPEED = 100.0
const JUMP_VELOCITY = -225.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	
	# players x axis movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
		
	# flipping the player sprite depending on the direction its moving
	if direction > 0:
		player_animation.flip_h = false
	elif direction < 0:
		player_animation.flip_h = true
		
		
