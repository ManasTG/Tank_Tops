extends CharacterBody2D

@onready var base: ColorRect = $base



const max_speed: float = 100.0
const acceleration: float = 20.0
const friction: float = 8.0
const rotation_speed: float = 180.0

func _physics_process(delta: float) -> void:

	#Go forward and backwars
	var move_input := Input.get_action_strength("forward") - Input.get_action_strength("backward")
	
	#input right and left then convert it into rotiation form in rotation_degrees
	var turn_input := 0
	#if abs(move_input) > 0.1:
		#turn_input = Input.get_action_strength("right") - Input.get_action_strength("left")

	rotation_degrees += turn_input * rotation_speed * delta

	#direction in which the tank is facing.. which is for the start up but can be rotated with rotation variable using rotated function.
	var direction := Vector2.UP.rotated(rotation)
	
	#gets the direction and input so that the tank moves where the direction of the arrow(vector) is
	var target_velocity := direction * move_input * max_speed
	
	#acceleration and deacceleration(with friction) inshort wrt fps
	var lerp_weight = delta * (acceleration if move_input !=0 else friction)	#so that speed is same at any fps
	#smoothens the velocity of the actual tank with accelration implemented using lerp_weight
	velocity = velocity.lerp(target_velocity, lerp_weight)	#to measure weight and speed of 2 point
	
	move_and_slide()
