extends Node

@onready var player: CharacterBody2D = $Laika
@onready var camera: Camera2D = $Camera2D

func _process(_delta):
	camera.global_position = player.global_position

func _on_lever_state_changed(state):
	print("Lever set to %s" % state)
