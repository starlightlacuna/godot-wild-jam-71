extends MarginContainer

func _ready():
	$PanelContainer/VBoxContainer/HBoxContainer/ResumeButton.grab_focus.call_deferred()

func _on_resume_button_pressed():
	get_tree().set_pause(false)
	hide()

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
