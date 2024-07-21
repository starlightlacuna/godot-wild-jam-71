extends Control

func _ready():
	# TODO: Run the epilogue timeline
	get_tree().change_scene_to_file.call_deferred("res://scenes/main_menu.tscn")

