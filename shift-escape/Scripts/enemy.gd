extends CharacterBody2D

@onready var player = get_parent().get_node("Player")
@export var speed = 100

func _physics_process(_delta):
	var player_position = player.position
	var target_position = (player_position - position).normalized()
	velocity = target_position * speed
	
	$AnimationTree.set("parameters/idle/blend_position", velocity)
	
	move_and_slide()

func die():
	var smoke_scene = preload("res://Scenes/smoke.tscn")
	var smoke_instance = smoke_scene.instantiate()
	get_parent().add_child(smoke_instance)
	smoke_instance.position = position
	smoke_instance.play("smoke")
	SoundPlayer.play_sound_hit()
	queue_free()
