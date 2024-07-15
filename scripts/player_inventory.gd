extends Node

signal inventory_updated()

## An array of item nodes.
var items := []

func add_item(item_node: Node) -> void:
	assert(item_node.has_node("ItemComponent"), "Item node is missing an ItemComponent!")
	if items.size() < 10:
		items.push_back(item_node)
	inventory_updated.emit()

func remove_item(index: int) -> Node:
	var item_node = items.pop_at(index)
	inventory_updated.emit()
	return item_node
