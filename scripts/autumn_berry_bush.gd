class_name AutumnBerryBush
extends StaticBody2D

@onready var berries: Node2D = $Berries

func has_berries() -> bool:
	return $Berries.is_visible()

func hide_berries() -> void:
	$Berries.set_visible(false)
