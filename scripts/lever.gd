class_name Lever
extends StaticBody2D

signal state_changed(state: bool)

@export var initial_state: bool = false

@onready var state := initial_state
@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	set_frame()

func toggle() -> void:
	state = !state
	set_frame()
	state_changed.emit(state)

func set_frame():
	if state:
		sprite.set_frame(1)
	else:
		sprite.set_frame(0)
