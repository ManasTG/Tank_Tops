extends CharacterBody2D

const max_speed: int = 100
const acceleration: int = 20
const friction: int = 8

func _physics_process(delta: float) -> void:
	var input = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("backward") - Input.get_action_strength("forward")
	).normalized()
	
	var lerp_weight = delta * (acceleration if input else friction)	#so that speed is same at any fps
	velocity = lerp(velocity, input * max_speed, lerp_weight)	#to measure weight and speed of 2 point
	
	move_and_slide()
