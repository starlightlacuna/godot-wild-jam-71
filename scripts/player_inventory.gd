class_name Inventory
extends Node

signal inventory_updated()

## An array of item nodes.
var items := []

var parts := {
	"Spring": false,
	"Summer": false,
	"Autumn": false,
	"Winter": false,
}

func add_item(item_node: Node) -> void:
	assert(item_node.has_node("ItemComponent"), "Item node is missing an ItemComponent!")
	if items.size() < 10:
		items.push_back(item_node)
	inventory_updated.emit()

func get_items() -> Array:
	return items

## Returns the first instance of an item in the inventory.
## If none found, returns -1.
func get_item_id_index(item_id: int) -> int:
	for i in items.size():
		if (items[i].get_node("ItemComponent") as ItemComponent).get_item_id() == item_id:
			return i
	return -1

func remove_item_at(index: int) -> Node:
	var item_node = items.pop_at(index)
	inventory_updated.emit()
	return item_node

func clear() -> void:
	items.clear()
	inventory_updated.emit()

func get_parts() -> Dictionary:
	return parts
	
func add_part(key: String) -> void:
	parts[key] = true
