class_name ItemComponent
extends Node

@export var reference: Item

func _ready() -> void:
	assert(reference, "Item reference not set!")

func get_item_id() -> int:
	return reference.item_id
