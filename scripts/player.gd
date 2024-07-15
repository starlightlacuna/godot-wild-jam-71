extends CharacterBody2D

@export var speed = 300.0

var last_direction: Vector2 = Vector2.RIGHT

@onready var interaction_area: Area2D = $InteractionArea
#@onready var inventory_slots = $CanvasLayer/UI/MarginContainer/InventoryBar.get_children()

func _unhandled_input(event: InputEvent):
	if !event.is_action_pressed("action"):
		return
	
	var bodies = interaction_area.get_overlapping_areas()
	for node in bodies:
		var interactable_component = node.get_owner().get_node_or_null("InteractableComponent")
		if interactable_component == null:
			continue
		(interactable_component as InteractableComponent).interact()
		return

func _physics_process(delta):
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction != Vector2.ZERO:
		last_direction = direction
	
	var next_position: Vector2 = direction * speed * delta
	set_global_position(get_global_position() + next_position)
	
	var interaction_rotation = Vector2.RIGHT.angle_to(last_direction)
	interaction_area.set_rotation(interaction_rotation)
	
	move_and_slide()
