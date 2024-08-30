extends Node2D

var enemy_amount = 10
	
func _process(_delta: float) -> void:
	if enemy_amount <= 0:
		var change_level_scene = preload("res://Scenes/change_level.tscn")
		var change_level_instance = change_level_scene.instantiate()
		get_parent().add_child(change_level_instance)
		change_level_instance.position = position
		
func kill_enemy():
	print(enemy_amount)
	enemy_amount = enemy_amount - 1

func change_enemy_amount(em):
	enemy_amount = em

