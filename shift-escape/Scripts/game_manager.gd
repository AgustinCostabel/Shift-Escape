extends Node2D

var enemy_amount = 1
var spawned = false
var timer = 15
var timer_max = 15
var stop_timer = true
	
func _process(_delta: float) -> void:
	
	if !stop_timer:	
		timer -= _delta
	
	if enemy_amount == 0 && !spawned:
		var change_level_scene = preload("res://Scenes/change_level.tscn")
		var change_level_instance = change_level_scene.instantiate()
		get_parent().add_child(change_level_instance)
		change_level_instance.position = position
		spawned = true
		stop_timer = true
	
	if timer <= 0:
		LevelManager.restart_level()	
		
func kill_enemy():
	print(enemy_amount)
	enemy_amount = enemy_amount - 1

func change_enemy_amount(em):
	enemy_amount = em

func change_spawned():
	spawned = false
	
func get_timer() -> int:
	return timer
	
func restart_timer():
	timer = timer_max
	stop_timer = false
