extends CharacterBody2D

var speed = 100
var direction = Vector2(0,0)
var pos = Vector2(0,0)

func _ready() -> void:
	
	## var rng_postion = RandomNumberGenerator.new()
	## pos = Vector2(rng_postion.randf_range(-130.0, 130.0),rng_postion.randf_range(-260.0, 260.0))
	position = pos
	
	var rng_direction = RandomNumberGenerator.new()
	direction = Vector2(rng_direction.randf_range(-1,1), rng_direction.randf_range(-1,1))
	
	var rng_speed = RandomNumberGenerator.new()
	speed = rng_speed.randf_range(500.0, 200.0)
	
func _physics_process(delta: float) -> void:
	
	velocity =  direction * speed

	move_and_slide()
