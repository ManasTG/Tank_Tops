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
		var body = collision.get_collider()
		print(body.name)
		if body.is_in_group("enemy_tank"):
			body.take_damage(60)
		queue_free()
	#move_and_slide()
	
