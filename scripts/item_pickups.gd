extends Node

func _ready():
	for item_node in get_children():
		(item_node as Crate).interacted.connect(_on_interacted)

func _on_interacted(node: Node):
	remove_child(node)
	PlayerInventory.add_item(node)
