extends Control

@export var intro_scene: PackedScene

func _ready() -> void:
	$ControlsWindow.set_visible(false)
	$VBoxContainer/StartButton.grab_focus.call_deferred()

func _enter_tree():
	# Connect all the signals because instantiation doesn't seem to preserve the connections
	$VBoxContainer/StartButton.pressed.connect(_on_start_button_pressed)
	$VBoxContainer/ControlsButton.pressed.connect(_on_controls_button_pressed)
	$VBoxContainer/QuitButton.pressed.connect(_on_quit_button_pressed)
	$ControlsWindow/PanelContainer/VBoxContainer/BackButton.pressed.connect(_on_back_button_pressed)
	
func _exit_tree() -> void:
	$VBoxContainer/StartButton.pressed.disconnect(_on_start_button_pressed)
	$VBoxContainer/ControlsButton.pressed.disconnect(_on_controls_button_pressed)
	$VBoxContainer/QuitButton.pressed.disconnect(_on_quit_button_pressed)
	$ControlsWindow/PanelContainer/VBoxContainer/BackButton.pressed.disconnect(_on_back_button_pressed)

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/introduction.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_controls_button_pressed():
	$ControlsWindow.set_visible(true)
	$ControlsWindow/PanelContainer/VBoxContainer/BackButton.grab_focus.call_deferred()

func _on_back_button_pressed():
	$ControlsWindow.set_visible(false)
	$VBoxContainer/StartButton.grab_focus.call_deferred()
