extends Node2D

@export var enemy_amount = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.change_enemy_amount(enemy_amount)
	GameManager.change_spawned()

