extends Control


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/intro_game.tscn")


func _on_how_to_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/tutorial_game.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()
