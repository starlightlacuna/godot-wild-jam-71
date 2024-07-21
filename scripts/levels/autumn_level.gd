extends Node

func _ready():
	PlayerInventory.clear()
	PlayerInventory.inventory_updated.connect(_check_win_condition)
	Dialogic.start("Autumn Introduction")
	Dialogic.timeline_ended.connect(_on_autumn_introduction_ended)
	
func _check_win_condition():
	var count = 0
	for item in PlayerInventory.get_items():
		if ((item as Node).get_node("ItemComponent") as ItemComponent).get_item_id() == 2:
			count += 1
	if count == 8:
		$UILayer/AnimationPlayer.play("fade_out")
		Dialogic.start("Autumn Complete")
	
func _on_autumn_introduction_ended() -> void:
	var ended_signal = Dialogic.timeline_ended
	if ended_signal.is_connected(_on_autumn_introduction_ended):
		ended_signal.disconnect(_on_autumn_introduction_ended)
	ended_signal.connect(_on_autumn_complete_ended)

func _on_autumn_complete_ended() -> void:
	PlayerInventory.add_part("Autumn")
	get_tree().change_scene_to_packed(preload("res://scenes/level_select.tscn"))
