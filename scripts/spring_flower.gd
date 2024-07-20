extends StaticBody2D

func _ready() -> void:
	$Petals.set_rotation(randf() * PI)
