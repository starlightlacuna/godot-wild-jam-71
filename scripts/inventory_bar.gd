# class_name InventoryBar
extends HBoxContainer

@onready var slots: Array = get_children()

func _ready():
	PlayerInventory.inventory_updated.connect(update_bar)

func add_item(item_id: int):
	# Get first empty slot
	for slot in slots:
		var inventory_slot = slot as InventorySlot
		if inventory_slot.has_item():
			continue
		inventory_slot.set_item(item_id)

func update_bar():
	# Clear all inventory slots first
	for slot in slots:
		(slot as InventorySlot).remove_item()
	
	# Then push all inventory items into the slots
	var index := 0
	for item in PlayerInventory.items:
		(slots[index] as InventorySlot).set_item(item.get_item_id())
		index += 1
