class_name IceBlocks
extends Node2D

@export var ice_block_scene: PackedScene
var markers: Array = []

func _ready() -> void:
	assert(ice_block_scene, "Ice Block Scene not set!")

	# At the start, all children should be spawners
	# Filling the array this way ensures the proper order regardless of child order
	var children_size = get_children().size()
	markers.resize(children_size)
	for i in range(children_size):
		markers[i] = get_node("Spawner%d" % i)
	
	spawn_ice_block()


func spawn_ice_block() -> void:
	var index = randi_range(0, markers.size() - 1)
	
	var ice_block = ice_block_scene.instantiate()
	add_child(ice_block)
	ice_block.set_global_position(markers[index].global_position)
	(ice_block.get_node("InteractableComponent") as InteractableComponent).interacted.connect(_on_ice_block_interacted)

func _on_ice_block_interacted(node: Node) -> void:
	remove_child(node)
	PlayerInventory.add_item(node)
