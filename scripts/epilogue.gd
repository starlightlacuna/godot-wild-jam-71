extends Control

@onready var laika_button: Button = $Team/VBoxContainer/GridBoxContainer/LaikaButton
@onready var team: MarginContainer = $Team
@onready var laika: MarginContainer = $Laika
@onready var software: MarginContainer = $Software
@onready var assets: MarginContainer = $Assets
@onready var laika_return_button: Button = $Laika/VBoxContainer/ReturnButton
@onready var assets_return_button: Button = $Assets/VBoxContainer/ReturnButton
@onready var software_return_button: Button = $Software/VBoxContainer/ReturnButton

func _ready() -> void:
	($Music as AudioStreamPlayer).play()
	Dialogic.start("Epilogue")
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	team.set_visible(false)
	laika.set_visible(false)
	software.set_visible(false)
	assets.set_visible(false)
	$Panel.set_visible(false)
	$Background.set_visible(false)

func _on_timeline_ended() -> void:
	$Team.set_visible(true)
	$Panel.set_visible(true)
	$Background.set_visible(true)
	laika_button.grab_focus.call_deferred()

func _on_laika_button_pressed():
	laika.set_visible(true)
	team.set_visible(false)
	software.set_visible(false)
	assets.set_visible(false)
	laika_return_button.grab_focus.call_deferred()

func _on_assets_button_pressed():
	assets.set_visible(true)
	laika.set_visible(false)
	team.set_visible(false)
	software.set_visible(false)
	assets_return_button.grab_focus.call_deferred()

func _on_software_button_pressed():
	software.set_visible(true)
	laika.set_visible(false)
	team.set_visible(false)
	assets.set_visible(false)
	software_return_button.grab_focus.call_deferred()

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_return_button_pressed():
	laika.set_visible(false)
	software.set_visible(false)
	assets.set_visible(false)
	team.set_visible(true)
	laika_button.grab_focus.call_deferred()
