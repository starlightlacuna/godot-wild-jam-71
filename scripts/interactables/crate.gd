class_name Crate
extends StaticBody2D

#signal interacted(node: Node)
#
#@export var item_id: int = 0
#
#func handle_interaction() -> void:
	#interacted.emit(self)
#
#func get_item_id() -> int:
	#return item_id
