extends Control

func _ready() -> void:
	AudioPlayer.play_music_menu()

func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/game.tscn")
	AudioPlayer.play_music_game()

func _on_button_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")

func _on_button_quit_pressed() -> void:
	get_tree().quit()
