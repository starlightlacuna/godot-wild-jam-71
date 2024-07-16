extends Node

func _ready():
	PlayerInventory.inventory_updated.connect(check_win_condition)
	
func check_win_condition():
	var count = 0
	for item in PlayerInventory.get_items():
		if ((item as Node).get_node("ItemComponent") as ItemComponent).get_item_id() == 1:
			count += 1
	if count == 10:
		print("Level Complete!")
		# TODO: Run Summer End timeline
	
	
