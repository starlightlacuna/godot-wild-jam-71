extends Control

func _ready():
	var parts = PlayerInventory.get_parts()
	#var parts = { 
		#"Spring": true,
		#"Summer": false,
		#"Autumn": true,
		#"Winter": true,
	#}
	var complete = true
	for key in parts:
		if parts[key] == false:
			complete = false
	if complete:
		Dialogic.start("All Parts Collected")
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		$MarginContainer.set_visible(false)
	
	_get_button("SpringButton").set_disabled(parts["Spring"])
	_get_button("SummerButton").set_disabled(parts["Summer"])
	_get_button("AutumnButton").set_disabled(parts["Autumn"])
	_get_button("WinterButton").set_disabled(parts["Winter"])
	
	_get_button("SpringButton").grab_focus.call_deferred()

func _get_button(button_name: String) -> TextureButton:
	return $MarginContainer/GridContainer.get_node(button_name)

func _on_spring_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/spring/spring_level.tscn")

func _on_summer_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/summer/summer_level.tscn")

func _on_autumn_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/autumn/autumn_level.tscn")

func _on_winter_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/winter/winter_level.tscn")

func _on_timeline_ended() -> void:
	get_tree().change_scene_to_file("res://scenes/epilogue.tscn")
