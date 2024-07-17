extends Node2D

func _ready():
	# Here we're connecting all the children's interacted signals to our handler
	for item_node in get_children():
		register_signal(item_node)

func _on_interacted(node: Node):
	remove_child(node)
	PlayerInventory.add_item(node)

## Adds an item node as a child and registers a listener to its `interacted` signal.
func add_item(node: Node2D):
	add_child(node)
	register_signal(node)

func register_signal(node: Node2D):
	if !node.has_signal("interacted"):
		(node.get_node("InteractableComponent") as InteractableComponent).interacted.connect(_on_interacted)
	else:
		node.interacted.connect(_on_interacted)
