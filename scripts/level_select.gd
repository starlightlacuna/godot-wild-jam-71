extends Control

func _ready():
	var grid = $MarginContainer/GridContainer
	var parts = PlayerInventory.get_parts()
	_get_button("SpringButton").set_disabled(parts["Spring"])
	_get_button("SummerButton").set_disabled(parts["Summer"])
	_get_button("AutumnButton").set_disabled(parts["Autumn"])
	_get_button("WinterButton").set_disabled(parts["Winter"])
	
	# TODO: If all parts have been collected, play the ending dialogue!

func _get_button(name: String) -> TextureButton:
	return $MarginContainer/GridContainer.get_node(name)

func _on_spring_button_pressed():
	get_tree().change_scene_to_packed(preload("res://scenes/spring/spring_level.tscn"))

func _on_summer_button_pressed():
	get_tree().change_scene_to_packed(preload("res://scenes/summer/summer_level.tscn"))

func _on_autumn_button_pressed():
	get_tree().change_scene_to_packed(preload("res://scenes/autumn/autumn_level.tscn"))

func _on_winter_button_pressed():
	get_tree().change_scene_to_packed(preload("res://scenes/winter/winter_level.tscn"))
