extends Node

func _ready():
	PlayerInventory.inventory_updated.connect(check_win_condition)
	Dialogic.start("Summer Introduction")
	Dialogic.timeline_ended.connect(_on_summer_introduction_ended)
	
func check_win_condition():
	var count = 0
	for item in PlayerInventory.get_items():
		if ((item as Node).get_node("ItemComponent") as ItemComponent).get_item_id() == 1:
			count += 1
	if count == 10:
		$UILayer/AnimationPlayer.play("fade_out")
		Dialogic.start("Summer Complete")
	
func _on_summer_introduction_ended() -> void:
	var ended_signal = Dialogic.timeline_ended
	if ended_signal.is_connected(_on_summer_introduction_ended):
		ended_signal.disconnect(_on_summer_introduction_ended)
	ended_signal.connect(_on_summer_complete_ended)

func _on_summer_complete_ended() -> void:
	print("Level Done!")
	# TODO: Transition to Level Select
