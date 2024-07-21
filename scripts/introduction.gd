extends Control

var images := [
	preload("res://assets/art/backgrounds/PROLOGUE1.png"),
	preload("res://assets/art/backgrounds/PROLOGUE2.png"),
	preload("res://assets/art/backgrounds/PROLOGUE3.png"),
	preload("res://assets/art/backgrounds/PROLOGUE4.png"),
	preload("res://assets/art/backgrounds/PROLOGUE5.png"),
	preload("res://assets/art/backgrounds/PROLOGUE6.png"),
	preload("res://assets/art/backgrounds/PROLOGUE7.png"),
	preload("res://assets/art/backgrounds/PROLOGUE8.png"),
	preload("res://assets/art/backgrounds/PROLOGUE9.png"),
	preload("res://assets/art/backgrounds/PROLOGUE10.png"),
	preload("res://assets/art/backgrounds/PROLOGUE11.png"),
	preload("res://assets/art/backgrounds/PROLOGUE12.png"),
]
var music_streams := [
	preload("res://assets/music/1_PROLOGUE_Beyond the Mind _BoDleasons.mp3"),
	preload("res://assets/music/2_CRASH_The Precarious Bridge_William Frederick Davidson.mp3"),
]
var story_text := [
	"Once upon a time not so long ago...",
	"When humans only dreamt of going to the moon,",
	"They sent a little dog into space.",
	"Her name was Laika.",
	"A stray from the streets of Moscow, she was chosen for her hardiness.",
	"After all, the first Earthling to go beyond needed to be tough to handle spaceflight.",
	"As her ship exited Earth's atmosphere,",
	"she took in the boundless universe beyond the sky.",
	"It was beautiful.",
	"And then the moment ended.",
	"Her home shrank in the viewport as her ship began to drift",
	"far",
	"far away"
]

var image_index := -1
var music_index := -1
var text_index := -1

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var background: TextureRect = $Background
@onready var background2: TextureRect = $Background2
@onready var music: AudioStreamPlayer = $Music
@onready var text: Label = $TextBox/Text

func _ready() -> void:
	animation_player.play("prologue")

func play_music(index: int) -> void:
	music.set_stream(music_streams[index])
	if not music.is_playing():
		music.play()

func set_text(index: int) -> void:
	text.set_text(story_text[index])

func set_background(index: int) -> void:
	background.set_texture(images[index])

func set_background2(index: int) -> void:
	background2.set_texture(images[index])

func _on_animation_player_animation_finished(anim_name):
	pass
	# Move to the next scene
