extends CharacterBody2D

@onready var player = get_parent().get_node("Player")
@onready var spawner = $Spawner
var position_1 = Vector2(240, -130)
var position_2 = Vector2(240, 130)
var position_3 = Vector2(0, 0)
var position_4 = Vector2(-240, -130)
var position_5 = Vector2(-240, 130)
var shield_destroyed = false

func _ready() -> void:
	$Shield/AnimatedSprite2D.play()
	$AnimationPlayer.play("idle")
	
func die():
	if shield_destroyed:
		var smoke_scene = preload("res://Scenes/smoke.tscn")
		var smoke_instance = smoke_scene.instantiate()
		get_parent().add_child(smoke_instance)
		smoke_instance.position = position
		smoke_instance.play("smoke")
		SoundPlayer.play_sound_hit()
		GameManager.kill_enemy()
		queue_free()

func set_positions(pos1, pos2, pos3, pos4, pos5: Vector2):
	position_1 = pos1
	position_2 = pos2
	position_3 = pos3
	position_4 = pos4
	position_5 = pos5
	
	
func change_position():
	if position == position_1:
		position = position_2
	elif position == position_2:
		position = position_3
	elif position == position_3:
		position = position_4
	elif position == position_4:
		position = position_5
	else: position = position_1

func destroy_shield():
	shield_destroyed = true
