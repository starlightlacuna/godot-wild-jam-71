# Lever
extends InteractableComponent

func interact():
	(owner as Lever).toggle()
