extends MarginContainer

@export var main_menu_scene: PackedScene

func _ready():
	assert(main_menu_scene, "Main Menu Scene not set!")
	$PanelContainer/VBoxContainer/HBoxContainer/ResumeButton.grab_focus.call_deferred()

func _on_resume_button_pressed():
	get_tree().set_pause(false)
	hide()

func _on_main_menu_button_pressed():
	get_tree().set_pause(false)
	get_tree().change_scene_to_packed(main_menu_scene)
