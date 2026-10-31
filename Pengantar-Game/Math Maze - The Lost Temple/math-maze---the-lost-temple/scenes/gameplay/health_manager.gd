
extends HBoxContainer

@export var heart_full: Texture2D
@export var heart_empty: Texture2D

var nyawa: int = 3

@onready var hearts: Array[TextureRect] = [
	$Heart1,
	$Heart2,
	$Heart3
]

func _ready() -> void:
	update_hearts()

func kurangi_nyawa() -> void:
	if nyawa <= 0:
		return

	nyawa -= 1
	update_hearts()

	if nyawa == 0:
		print("GAME OVER")

func update_hearts() -> void:
	for i in range(hearts.size()):
		if i < nyawa:
			hearts[i].texture = heart_full
		else:
			hearts[i].texture = heart_empty
