extends CharacterBody2D

@onready var player = get_parent().get_node("Player")
@export var speed = 100

func _physics_process(delta):
	var player_position = player.position
	var target_position = (player_position - position).normalized()
	velocity = target_position * speed
	move_and_slide()
