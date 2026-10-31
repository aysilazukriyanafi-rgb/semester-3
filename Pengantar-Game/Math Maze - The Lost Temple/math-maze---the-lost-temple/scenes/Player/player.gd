
extends CharacterBody2D

@export var speed: float = 180.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var last_direction: String = "down"

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector(
		"ui_left", "ui_right", "ui_up", "ui_down"
	)

	velocity = direction * speed
	move_and_slide()

	# Periksa apakah karakter sedang bertabrakan
	if is_on_wall():
		print("Karakter menyentuh dinding")

	if direction != Vector2.ZERO:
		if abs(direction.x) > abs(direction.y):
			if direction.x < 0:
				last_direction = "left"
			else:
				last_direction = "right"
		else:
			if direction.y < 0:
				last_direction = "up"
			else:
				last_direction = "down"

		var animation_name: String

		match last_direction:
			"up":
				animation_name = "walk_up"
			"down":
				animation_name = "walk_down"
			"left":
				animation_name = "walk_left"
			"right":
				animation_name = "walk_right"

		if anim.sprite_frames.has_animation(animation_name):
			if anim.animation != animation_name or not anim.is_playing():
				anim.play(animation_name)
	else:
		anim.stop()
