extends CharacterBody2D

@onready var player = get_node("../Player")
@export var time_max: int
var speed = 150
var time = 0

var color: Color
var player_position
var direction

func _ready() -> void:
	color = Color.WHITE
	
func _physics_process(delta: float) -> void:
	time += delta
	if time > time_max:
		queue_free()
		
	color = lerp(color, Color.RED, 0.3 * delta)
	modulate = color
	
	if time < time_max / 2:
		player_position = player.position
		direction = (player_position - global_position).normalized()
		
	rotation = direction.angle()
	velocity =  direction * speed

	move_and_slide()

