extends Area2D

@export var weapon_speed = 400
@export var enemy = load("res://Scenes/enemy.tscn")

var weapon_direction
 
func _ready():
	connect('body_entered', Callable(self, '_on_body_entered'))

func _process(delta):
	position -= weapon_direction * weapon_speed * delta
	rotation = weapon_direction.angle()
	rotation_degrees -= 90

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.queue_free()
		weapon_speed = 0
