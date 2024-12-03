extends Node

var levels = [
	"res://Scenes/Levels/tutorial.tscn",
	"res://Scenes/Levels/game.tscn",
	"res://Scenes/Levels/level_1.tscn",
	"res://Scenes/Levels/level_2.tscn",
	"res://Scenes/Levels/level_3.tscn",
	"res://Scenes/Levels/level_4.tscn",
	"res://Scenes/Levels/level_5.tscn",
	"res://Scenes/Levels/credits.tscn",
]

var current_level_index = 0

func load_level(index):
	if index >= 0 and index < levels.size():
		current_level_index = index
		get_tree().change_scene_to_file(levels[index])
		
	GameManager.restart_timer()

func load_next_level():
	load_level(current_level_index + 1)

func restart_level():
	load_level(current_level_index)
	
func restart_game():
	current_level_index = 0
