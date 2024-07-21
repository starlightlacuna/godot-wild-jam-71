class_name IceBlocks
extends Node2D

@export var ice_block_scene: PackedScene
@export var river_timer_wait_time: float = 2.0
@export var river_ice_block_speed: float = 100.0

var markers: Array = []
var last_ice_block_index: int = -1

@onready var river_markers: Array = $RiverMarkers.get_children()

func _ready() -> void:
	assert(ice_block_scene, "Ice Block Scene not set!")
	assert(river_markers, "River Markers not set!")

	# At the start, all children should be spawners
	# Filling the array this way ensures the proper order regardless of child order
	#var children_size = get_children().size()
	#markers.resize(children_size)
	#for i in range(children_size):
		#markers[i] = get_node("Spawner%d" % i)
		
	var children = get_children()
	for child in children:
		if not child is Marker2D:
			continue
		markers.push_back(child)
	
	# Start the ice block party
	spawn_ice_block()
	
	# Create a timer node and connect to its timeout signal
	var timer = Timer.new()
	timer.timeout.connect(_on_river_timer_timeout)
	timer.set_wait_time(river_timer_wait_time)
	timer.set_autostart(true)
	add_child(timer)


func spawn_ice_block() -> void:
	# This probably could be better, but I'm too burned out to optimize it
	var index = randi_range(0, markers.size() - 1)
	while index == last_ice_block_index:
		index = randi_range(0, markers.size() - 1)
	last_ice_block_index = index
	
	var ice_block = ice_block_scene.instantiate()
	add_child(ice_block)
	ice_block.set_global_position(markers[index].global_position)
	(ice_block.get_node("InteractableComponent") as InteractableComponent).interacted.connect(_on_ice_block_interacted)

func _on_ice_block_interacted(node: Node) -> void:
	remove_child(node)
	PlayerInventory.add_item(node)

func _on_river_timer_timeout():
	var index = randi_range(0, river_markers.size() - 1)
	var marker_position = river_markers[index].global_position as Vector2
	var target_position = Vector2(marker_position) + Vector2(2200, 0)
	var ice_block = ice_block_scene.instantiate() as StaticBody2D
	add_child(ice_block)
	ice_block.set_scale(Vector2.ONE * randf_range(0.6, 0.9))
	ice_block.set_global_position(marker_position)
	var tween = get_tree().create_tween()
	tween.tween_property(
		ice_block,
		"position",
		target_position,
		(target_position - marker_position).length() / river_ice_block_speed
	)
	tween.tween_callback(func():
		if ice_block:
			ice_block.queue_free()
	)
