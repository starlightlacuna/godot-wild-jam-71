extends Node

signal inventory_updated()

## An array of item nodes.
var items := []

func add_item(item_node: Node) -> void:
	if items.size() < 10:
		items.push_back(item_node)
	inventory_updated.emit()

func remove_item(index: int) -> Node:
	var item_node = items.pop_at(index)
	inventory_updated.emit()
	return item_node
