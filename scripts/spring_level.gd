extends Node

@export var seed_scene: PackedScene
@export var crushed_plant_scene: PackedScene

@onready var plant_plots: Array = $WorldObjects/PlantPlots.get_children()
@onready var seed_pile: StaticBody2D = $WorldObjects/SeedPile
@onready var garbage_can: StaticBody2D = $WorldObjects/GarbageCan

func _ready() -> void:
	assert(seed_scene, "Seed Scene not set!")
	assert(seed_scene, "Crushed Plant Scene not set!")
	# Connect all signals
	for plant_plot in plant_plots:
		(plant_plot as PlantPlot).get_interacted_signal().connect(_on_plant_plot_interacted)
	(seed_pile.get_node("InteractableComponent") as InteractableComponent).interacted.connect(_on_seed_pile_interacted)
	(garbage_can.get_node("InteractableComponent") as InteractableComponent).interacted.connect(_on_garbage_can_interacted)
	
func _on_plant_plot_interacted(node: Node) -> void:
	print("Mmm... dirt.")
	var plant_plot = node as PlantPlot
	if plant_plot.is_crushed():
		plant_plot.remove_crushed_plant()
		PlayerInventory.add_item(crushed_plant_scene.instantiate())
		return
	if plant_plot.is_empty():
		var seed_index = PlayerInventory.get_item_id_index(4)
		if seed_index == -1:
			return
		PlayerInventory.remove_item_at(seed_index)
		plant_plot.plant_seed()
		__check_objective()
		return

func _on_seed_pile_interacted(node: Node) -> void:
	print("The evil seed of what you've done germinates within you.")
	PlayerInventory.add_item(seed_scene.instantiate())

func _on_garbage_can_interacted(node: Node) -> void:
	print("I'm the Trash Man!")
	PlayerInventory.clear()

func __check_objective() -> void:
	for node in plant_plots:
		if not (node as PlantPlot).is_seeded():
			return
	print("Level complete!")
