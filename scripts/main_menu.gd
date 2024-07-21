extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$ControlsWindow.set_visible(false)
	$VBoxContainer/StartButton.grab_focus.call_deferred()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/introduction.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_options_button_pressed():
	$ControlsWindow.set_visible(true)
	$ControlsWindow/PanelContainer/VBoxContainer/BackButton.grab_focus.call_deferred()

func _on_back_button_pressed():
	$ControlsWindow.set_visible(false)
	$VBoxContainer/StartButton.grab_focus.call_deferred()
