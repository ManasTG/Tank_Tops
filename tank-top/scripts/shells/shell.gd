extends CharacterBody2D

var pos:Vector2
var rota:float
var dir:float
var speed = 200
var lifetime  = 2.0


func _ready() -> void:
	await get_tree().create_timer(lifetime).timeout
	queue_free()


func _physics_process(delta: float) -> void:
	velocity = Vector2(0,-speed).rotated(dir)
	var collision = move_and_collide(velocity * delta)
	if collision:
		queue_free()
	#move_and_slide()
	
