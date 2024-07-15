# class_name InventoryBar
extends HBoxContainer

@onready var slots: Array = get_children()

func _ready():
	PlayerInventory.inventory_updated.connect(update_bar)

func update_bar():
	# Clear all inventory slots first
	for slot in slots:
		(slot as InventorySlot).remove_item()
	
	# Then push all inventory items into the slots
	var index := 0
	for item in PlayerInventory.items:
		var item_component = item.get_node("ItemComponent") as ItemComponent
		
		(slots[index] as InventorySlot).set_item(item_component.get_item_id())
		index += 1
