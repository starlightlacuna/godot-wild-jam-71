extends Node2D

@export var berry_scene: PackedScene

func _ready() -> void:
	assert(berry_scene, "Berry Scene not set!")
	for berry_bush in get_children():
		var interactable_component = berry_bush.get_node_or_null("InteractableComponent")
		if !interactable_component:
			continue
		(interactable_component as InteractableComponent).interacted.connect(on_berry_bush_interacted)
		
func on_berry_bush_interacted(node: Node) -> void:
	var autumn_berry_bush := node as AutumnBerryBush
	if !autumn_berry_bush.has_berries():
		return
	
	autumn_berry_bush.hide_berries()
	# Spawn a new berry and connect interacted signal
	var berry = berry_scene.instantiate()
	(berry as Node2D).set_global_position(autumn_berry_bush.get_global_position())
	add_child(berry)
	var interacted_signal = (berry.get_node("InteractableComponent") as InteractableComponent).interacted
	interacted_signal.connect(on_berry_interacted)
	print(interacted_signal.is_connected(on_berry_interacted))
	

func on_berry_interacted(node: Node):
	remove_child(node)
	PlayerInventory.add_item(node)
