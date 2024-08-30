extends Area2D

@export var weapon_speed = 400
@export var enemy = load("res://Scenes/enemy.tscn")
var player

var weapon_direction
 
func _ready():
	connect('body_entered', Callable(self, '_on_body_entered'))
	player = get_tree().get_nodes_in_group("player")[0]

func _process(delta):
	position -= weapon_direction * weapon_speed * delta
	rotation = weapon_direction.angle()
	rotation_degrees -= 90
	
	if position.y > 142 or position.y < -142 or position.x > 270 or position.x < -270:
		self.queue_free()
		player.restore_weapon()
		

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy") && weapon_speed > 0:
		body.die()
		weapon_speed = 0
		GameManager.kill_enemy()
