# Crate
extends InteractableComponent

func interact():
	(owner as Crate).handle_interaction()
