extends Node2D

func _ready():
	# Here we're connecting all the children's interacted signals to our handler
	for item_node in get_children():
		if !item_node.has_signal("interacted"):
			#printerr("Item node has no 'interacted' signal!")
			(item_node.get_node("InteractableComponent") as InteractableComponent).interacted.connect(_on_interacted)
			continue
		item_node.interacted.connect(_on_interacted)

func _on_interacted(node: Node):
	remove_child(node)
	PlayerInventory.add_item(node)
