extends Node2D

@export var transition_speed = 10

enum { IDLE = 2, WATERING = 4 }
var current_state = IDLE
var watering_blend_amount := 0.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var particles: GPUParticles2D = $GPUParticles2D


func _process(delta):
	if current_state == WATERING:
		watering_blend_amount = clampf(watering_blend_amount + transition_speed * delta, 0.0, 1.0)
	else:
		watering_blend_amount = clampf(watering_blend_amount - transition_speed * delta, 0.0, 1.0)
		
	if watering_blend_amount >= 0.5:
		particles.set_emitting(true)
	else:
		particles.set_emitting(false)
	
	animation_tree["parameters/Watering/blend_amount"] = watering_blend_amount

func start_watering():
	#animation_player.play("Watering Can/Water")
	current_state = WATERING
	
func stop_watering():
	#animation_player.play("Watering Can/Idle")
	current_state = IDLE
	
func start_particles():
	particles.set_emitting(true)

func stop_particles():
	particles.set_emitting(false)

func _on_start_watering_button_pressed():
	start_watering()

func _on_stop_watering_button_pressed():
	stop_watering()
