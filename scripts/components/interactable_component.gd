class_name InteractableComponent
extends Area2D

signal interacted(node: Node)

func interact():
	interacted.emit(owner)
