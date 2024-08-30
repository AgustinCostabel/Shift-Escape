extends Area2D

@export var weapon_speed = 400
@onready var player = get_parent().get_node("Player")

var target_position
var player_position
 
func _ready():
	connect('body_entered', Callable(self, '_on_body_entered'))
	player_position = player.position
	target_position = (player_position - position).normalized()
	rotation = target_position.angle()
	#weapon_direction = target_position - player_position

func _process(delta):
	position += target_position * weapon_speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && weapon_speed > 0:
		self.queue_free()
		weapon_speed = 0
