extends Node2D

var shellScene = preload("res://scenes/shells/shell.tscn")
@onready var muzzle: ColorRect = $muzzle

var shellVel = 20

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		spawn_shell()

func spawn_shell():
	var shell = shellScene.instantiate()
	add_child(shell)
	shell.position = muzzle.position
##	shell.velocity = shellVel
