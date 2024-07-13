extends Node

func _unhandled_input(event):
	pass

func _on_toggle_particles_button_pressed():
	$WateringCan/GPUParticles2D.set_emitting(!$WateringCan/GPUParticles2D.is_emitting())
