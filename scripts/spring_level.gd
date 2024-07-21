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
	
	PlayerInventory.clear()
	PlayerInventory.inventory_updated.connect(_check_win_condition)
	Dialogic.start("Spring Introduction")
	Dialogic.timeline_ended.connect(_on_spring_introduction_ended)
	
	($UILayer as UILayer).set_pause_menu_hint("Objective: Replace Hana's crushed plants with new seeds!\n\nYou can throw out your inventory by interacting with the garbage can.")
	
func _on_plant_plot_interacted(node: Node) -> void:
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
		_check_win_condition()
		return

func _on_seed_pile_interacted(_node: Node) -> void:
	PlayerInventory.add_item(seed_scene.instantiate())

func _on_garbage_can_interacted(_node: Node) -> void:
	PlayerInventory.clear()

func _check_win_condition() -> void:
	for node in plant_plots:
		if not (node as PlantPlot).is_seeded():
			return
	$UILayer/AnimationPlayer.play("fade_out")
	Dialogic.start("Spring Complete")

func _on_spring_introduction_ended() -> void:
	var ended_signal = Dialogic.timeline_ended
	if ended_signal.is_connected(_on_spring_introduction_ended):
		ended_signal.disconnect(_on_spring_introduction_ended)
	ended_signal.connect(_on_spring_complete_ended)

func _on_spring_complete_ended() -> void:
	PlayerInventory.add_part("Spring")
	get_tree().change_scene_to_packed(preload("res://scenes/level_select.tscn"))

func _on_laika_pause_action_pressed():
	get_tree().set_pause(true)
	($UILayer as UILayer).show_pause_menu()
