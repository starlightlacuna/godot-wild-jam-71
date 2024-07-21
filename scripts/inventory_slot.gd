class_name InventorySlot
extends TextureRect

var item_id := -1

@onready var item_icon: TextureRect = $ItemIcon

func _ready():
	update_item_texture()

func has_item() -> bool:
	return item_id != -1

func remove_item():
	set_item(-1)

func set_item(p_item_id: int) :
	item_id = p_item_id
	update_item_texture()

func update_item_texture():
	if !has_item():
		item_icon.set_texture(null)
	else:
		var item = ItemDatabase.get_item(item_id) as Item
		var item_texture = load(item.texture_path) as Texture2D
		item_icon.set_texture(item_texture)
