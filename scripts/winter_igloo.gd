class_name Igloo
extends StaticBody2D

signal completed()

var build_progress := 0

var textures := [
	preload("res://assets/art/winter/WINTERigloo1.png"),
	preload("res://assets/art/winter/WINTERigloo2.png"),
	preload("res://assets/art/winter/WINTERigloo3.png"),
	preload("res://assets/art/winter/WINTERigloo4.png"),
]

@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	update_texture()

func add_build_progress():
	build_progress += 1
	update_texture()
	if build_progress >= 3:
		completed.emit()

func update_texture():
	sprite.set_texture(textures[build_progress])
