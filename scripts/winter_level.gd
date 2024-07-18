extends Node

@onready var ice_blocks: IceBlocks = $WorldObjects/IceBlocks
@onready var igloo: Igloo = $WorldObjects/Igloo

func _ready() -> void:
	(igloo.get_node("InteractableComponent") as InteractableComponent).interacted.connect(_on_igloo_interacted)
	
func _on_igloo_interacted(_node: Node) -> void:
	var items: Array = (PlayerInventory as Inventory).get_items()
	for index in items.size():
		var item = items[index]
		if (item.get_node("ItemComponent") as ItemComponent).get_item_id() != 3:
			continue
		PlayerInventory.remove_item_at(index)
		igloo.add_build_progress()
		ice_blocks.spawn_ice_block()
