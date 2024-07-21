class_name PlantPlot
extends StaticBody2D

signal seeded

enum State { CRUSHED, EMPTY, SEEDED }

var current_state: State = State.CRUSHED

@onready var crushed_plant: Sprite2D = $CrushedPlant
@onready var seed_node: StaticBody2D = $Seed
@onready var seed_collision_shape: CollisionShape2D = $Seed/CollisionShape2D

func _ready():
	crushed_plant.set_rotation(randf() * TAU)
	_update_children()

func get_interacted_signal() -> Signal:
	return ($InteractableComponent as InteractableComponent).interacted

func is_crushed() -> bool:
	return current_state == State.CRUSHED

func is_empty() -> bool:
	return current_state == State.EMPTY

func is_seeded() -> bool:
	return current_state == State.SEEDED

func plant_seed() -> void:
	current_state = State.SEEDED
	_update_children()

func remove_crushed_plant() -> void:
	current_state = State.EMPTY
	_update_children()

func _update_children() -> void:
	match current_state:
		State.CRUSHED:
			crushed_plant.set_visible(true)
			seed_node.set_visible(false)
			seed_collision_shape.set_disabled(true)
		State.EMPTY:
			crushed_plant.set_visible(false)
			seed_node.set_visible(false)
			seed_collision_shape.set_disabled(true)
		State.SEEDED:
			crushed_plant.set_visible(false)
			seed_node.set_visible(true)
			seed_collision_shape.set_disabled(false)
