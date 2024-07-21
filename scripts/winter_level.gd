extends Node

@onready var ice_blocks: IceBlocks = $WorldObjects/IceBlocks
@onready var igloo: Igloo = $WorldObjects/Igloo

func _ready() -> void:
	(igloo.get_node("InteractableComponent") as InteractableComponent).interacted.connect(_on_igloo_interacted)
	
	PlayerInventory.clear()
	Dialogic.start("Winter Introduction")
	Dialogic.timeline_ended.connect(_on_winter_introduction_ended)
	
	($UILayer as UILayer).set_pause_menu_hint("Objective: Build a new house for Yuki!\n\nCheck the riverbank for ice blocks you can use as material.")
	
func _on_igloo_interacted(_node: Node) -> void:
	var items: Array = (PlayerInventory as Inventory).get_items()
	for index in items.size():
		var item = items[index]
		if (item.get_node("ItemComponent") as ItemComponent).get_item_id() != 3:
			continue
		PlayerInventory.remove_item_at(index)
		igloo.add_build_progress()
		ice_blocks.spawn_ice_block()

func _on_igloo_completed():
	$UILayer/AnimationPlayer.play("fade_out")
	Dialogic.start("Winter Complete")
	
func _on_winter_introduction_ended() -> void:
	var ended_signal = Dialogic.timeline_ended
	if ended_signal.is_connected(_on_winter_introduction_ended):
		ended_signal.disconnect(_on_winter_introduction_ended)
	ended_signal.connect(_on_winter_complete_ended)

func _on_winter_complete_ended() -> void:
	PlayerInventory.add_part("Winter")
	get_tree().change_scene_to_packed(preload("res://scenes/level_select.tscn"))

func _on_laika_pause_action_pressed():
	get_tree().set_pause(true)
	($UILayer as UILayer).show_pause_menu()
	
