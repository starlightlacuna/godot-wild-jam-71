extends Node

var dictionary: Dictionary = {}

const BASE_PATH := "res://items"

func _ready():
	# https://docs.godotengine.org/en/stable/classes/class_diraccess.html
	var dir = DirAccess.open(BASE_PATH)
	if !dir:
		printerr("An error occurred when trying to access the path.")
		return
	
	dir.list_dir_begin()
	var file_name = dir.get_next()
	
	while file_name != "":
		var item = load(BASE_PATH + "/" + file_name) as Item
		if dictionary.has(item.item_id):
			printerr("Duplicate item ID found! (%d)" % item.item_id)
		dictionary[item.item_id] = item
		file_name = dir.get_next()

func get_item(id: int) -> Item:
	return dictionary[id]
