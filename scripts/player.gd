class_name Player
extends CharacterBody2D

signal pause_action_pressed

@export var speed = 300.0

var last_direction: Vector2 = Vector2.RIGHT
var enable_movement: bool = true

@onready var interaction_area: Area2D = $InteractionArea
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	#Dialogic.start("Introduction")
	pass

#func _input(_event: InputEvent) -> void:
	## Check if a dialog is already running
	#if Dialogic.current_timeline != null:
		#return

func _unhandled_input(event: InputEvent) -> void:
	if Dialogic.current_timeline != null:
		return

	if event.is_action_pressed("open_menu"):
		pause_action_pressed.emit()
	
	if event.is_action_pressed("action"):
		var bodies = interaction_area.get_overlapping_areas()
		for node in bodies:
			var interactable_component = node.get_owner().get_node_or_null("InteractableComponent")
			if interactable_component == null:
				continue
			(interactable_component as InteractableComponent).interact()
		
func _process(_delta) -> void:
	if last_direction.x > 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

func _physics_process(delta) -> void:
	if Dialogic.current_timeline != null:
		move_and_slide()
		return
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction != Vector2.ZERO:
		last_direction = direction
	
	var next_position: Vector2 = direction * speed * delta
	set_global_position(get_global_position() + next_position)
	
	var interaction_rotation = Vector2.RIGHT.angle_to(last_direction)
	interaction_area.set_rotation(interaction_rotation)
	
	move_and_slide()
