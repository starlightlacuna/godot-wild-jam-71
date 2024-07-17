extends Camera2D

@export var player_node: Player

func _ready():
	assert(player_node, "Player Node not set!")

func _process(_delta):
	global_position = player_node.global_position
