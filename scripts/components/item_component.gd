class_name ItemComponent
extends Node

#@export var reference: Item
@export var item_id: int

func _ready() -> void:
	#assert(reference, "Item reference not set!")
	assert(item_id, "Item ID not set!")

func get_item_id() -> int:
	#return reference.item_id
	return item_id
