extends StaticBody2D

@onready var player = get_parent().get_node("Player")
@export var arrow = load("res://Scenes/arrow.tscn")
@export var speed_attack = 0.5 # 500ms

var time = 0

func _process(delta):
	time += delta
	if time > speed_attack:
		fire()
		time = 0

func fire():
	var arr = arrow.instantiate()
	arr.global_position = global_position
	arr.rotation = global_rotation
	get_parent().add_child(arr)
	
func die():
	var smoke_scene = preload("res://Scenes/smoke.tscn")
	var smoke_instance = smoke_scene.instantiate()
	get_parent().add_child(smoke_instance)
	smoke_instance.position = position
	smoke_instance.play("smoke")
	SoundPlayer.play_sound_hit()
	GameManager.kill_enemy()
	queue_free()
