extends Node

var dictionary: Dictionary = {
	"0": {
		"item_id": 0,
		"item_name": "Crate",
		"texture_path": "res://assets/prototype/Crate.png",
	},
	"1": {
		"item_id": 1,
		"item_name": "Seashell",
		"texture_path": "res://assets/art/summer/SUMMERitem.png",
	},
	"2": {
		"item_id": 2,
		"item_name": "Berry",
		"texture_path": "res://assets/art/autumn/FALLitem.png",
	},
	"3": {
		"item_id": 3,
		"item_name": "Ice Block",
		"texture_path": "res://assets/art/winter/WINTERitem.png",
	},
	"4": {
		"item_id": 4,
		"item_name": "Seed",
		"texture_path": "res://assets/art/spring/SPRINGseed.png",
	},
	"5": {
		"item_id": 5,
		"item_name": "Crushed Flower",
		"texture_path": "res://assets/art/spring/SPRINGcrushed.png",
	},
}

#const BASE_PATH := "res://items"

#func _ready():
	## https://docs.godotengine.org/en/stable/classes/class_diraccess.html
	#var dir = DirAccess.open(BASE_PATH)
	#if !dir:
		#printerr("An error occurred when trying to access the path.")
		#return
	#
	#dir.list_dir_begin()
	#var file_name = dir.get_next()
	#
	#while file_name != "":
		#print(BASE_PATH + "/" + file_name)
		#var item = load(BASE_PATH + "/" + file_name) as Item
		#print(item.item_name)
		#if dictionary.has(item.item_id):
			#printerr("Duplicate item ID found! (%d)" % item.item_id)
		#dictionary[item.item_id] = item
		#file_name = dir.get_next()
	#
	#print(dictionary)

func get_item(id: int) -> Item:
	var value: Dictionary = dictionary[str(id)]
	var item = Item.new()
	item.item_id = value["item_id"]
	item.item_name = value["item_name"]
	item.texture_path = value["texture_path"]
	return item
