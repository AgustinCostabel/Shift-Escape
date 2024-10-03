extends Area2D

@export var weapon_speed = 400
@onready var player = get_parent().get_node("Player")

var direction
var player_position
 
func _ready():
	connect('body_entered', Callable(self, '_on_body_entered'))
	player_position = player.position
	direction = (player_position - position).normalized()
	rotation = direction.angle()

func _process(delta):
	position += direction * weapon_speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		self.queue_free()
