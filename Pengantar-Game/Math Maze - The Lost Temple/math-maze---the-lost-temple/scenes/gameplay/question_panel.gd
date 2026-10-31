
extends Control

@onready var answer_a: Button = $AnswerA
@onready var answer_b: Button = $AnswerB
@onready var answer_c: Button = $AnswerC
@onready var answer_d: Button = $AnswerD
@onready var feedback_label: Label = $FeedbackLabel

var health_container: Node = null

func _ready() -> void:
	answer_a.pressed.connect(_on_answer_a_pressed)
	answer_b.pressed.connect(_on_answer_b_pressed)
	answer_c.pressed.connect(_on_answer_c_pressed)
	answer_d.pressed.connect(_on_answer_d_pressed)

	health_container = get_tree().current_scene.find_child(
		"HealthContainer", true, false
	)

	if health_container == null:
		push_error("HealthContainer tidak ditemukan!")
	elif not health_container.has_method("kurangi_nyawa"):
		push_error("HealthContainer tidak memiliki fungsi kurangi_nyawa()!")

	feedback_label.text = ""

func _on_answer_a_pressed() -> void:
	check_answer("A")

func _on_answer_b_pressed() -> void:
	check_answer("B")

func _on_answer_c_pressed() -> void:
	check_answer("C")

func _on_answer_d_pressed() -> void:
	check_answer("D")

func check_answer(answer: String) -> void:
	if answer == "B":
		feedback_label.text = "Jawaban benar!"
		feedback_label.modulate = Color.GREEN
		print("Jawaban benar!")
		hide()
	else:
		feedback_label.text = "Jawaban salah! Nyawa berkurang."
		feedback_label.modulate = Color.RED
		print("Jawaban salah!")

		if health_container != null and health_container.has_method("kurangi_nyawa"):
			health_container.kurangi_nyawa()
