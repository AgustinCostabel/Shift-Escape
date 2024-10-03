extends Control

func _ready() -> void:
	AudioPlayer.play_music_menu()
	LevelManager.restart_game()
	Engine.time_scale = 1

func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/tutorial.tscn")
	GameManager.change_timer(15)
	AudioPlayer.play_music_game()

func _on_button_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")

func _on_button_quit_pressed() -> void:
	get_tree().quit()
