extends Node2D

var shellScene = preload("res://scenes/shells/shell.tscn")
@onready var muzzle: Node2D = $muzzle

var shellVel = 20

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		spawn_shell()

func spawn_shell():
	var shell = shellScene.instantiate()


	shell.global_position = muzzle.global_position
	shell.global_rotation = global_rotation
	shell.dir = global_rotation

	get_tree().current_scene.add_child(shell)
