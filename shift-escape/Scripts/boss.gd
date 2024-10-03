extends CharacterBody2D

@onready var player = get_parent().get_node("Player")
@onready var spawner = $Spawner
@export var boss_clone: PackedScene
var position_1 = Vector2(0, -130)
var position_2 = Vector2(-240, 0)
var position_3 = Vector2(240, 0)
var position_4 = Vector2(240, -130)
var position_5 = Vector2(0, 0)
var immune = true
var shield_destroyed = false

func _ready() -> void:
	$Spawner.stop()

func die():
	if !immune and shield_destroyed:
		var smoke_scene = preload("res://Scenes/smoke.tscn")
		var smoke_instance = smoke_scene.instantiate()
		get_parent().add_child(smoke_instance)
		smoke_instance.position = position
		smoke_instance.play("smoke")
		SoundPlayer.play_sound_hit()
		clone()
		clone_2()
		GameManager.kill_enemy()
		queue_free()
	
func clone():
	var clone_scene = boss_clone
	var clone_instance = clone_scene.instantiate()
	get_parent().add_child(clone_instance)
	clone_instance.position = position_4
	GameManager.add_enemy()
	
func clone_2():
	var clone_scene_2 = boss_clone
	var clone_instance_2 = clone_scene_2.instantiate()
	get_parent().add_child(clone_instance_2)
	clone_instance_2.position = position_5
	clone_instance_2.set_positions(Vector2(0, -130),Vector2(0, 130),Vector2(-240, 0),Vector2(240, 0),Vector2(0, -130))
	GameManager.add_enemy()
	
func change_position():
	if position == position_1:
		position = position_2
	elif position == position_2:
		position = position_3
	else: position = position_1

func destroy_shield():
	shield_destroyed = true
	
func play_move_down():
	$AnimationPlayer.play("move_down")
	
func play_idle():
	$AnimationPlayer.play("RESET")
	
func start_boss():
	immune = false
	$Shield/AnimatedSprite2D.play()
	$AnimationPlayer.play("idle")
	$Spawner.start()
