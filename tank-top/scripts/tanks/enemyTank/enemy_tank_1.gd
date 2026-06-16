extends CharacterBody2D

var health = 100

func take_damage(damage_op):
	health -= damage_op
	
	print(health)
	
	if health <= 0:
		queue_free()

##func _physics_process(delta: float) -> void:
	 
