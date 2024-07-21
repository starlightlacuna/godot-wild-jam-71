class_name UILayer
extends CanvasLayer

func set_pause_menu_hint(text: String) -> void:
	($PauseMenu/PanelContainer/VBoxContainer/MarginContainer/Objective as Label).set_text(text)

func show_pause_menu() -> void:
	$PauseMenu.show()
	$PauseMenu/PanelContainer/VBoxContainer/HBoxContainer/ResumeButton.grab_focus.call_deferred()
	
func hide_pause_menu() -> void:
	$PauseMenu.hide()
