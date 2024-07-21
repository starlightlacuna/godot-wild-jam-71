extends Control

func _ready() -> void:
	Dialogic.start("Awakening")
	Dialogic.timeline_ended.connect(_on_awakening_ended)

func _on_awakening_ended() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
