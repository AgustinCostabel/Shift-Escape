extends CharacterBody2D

@export var speed = 150
@export var friction = 1
@export var weapon_scene = load("res://Scenes/teleport_weapon.tscn")

var can_throw = true
var direction
var tp_weapon

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('move_right'):
		input.x += 1
	if Input.is_action_pressed('move_left'):
		input.x -= 1
	if Input.is_action_pressed('move_down'):
		input.y += 1
	if Input.is_action_pressed('move_up'):
		input.y -= 1
		
	if Input.is_action_pressed("throw") && can_throw:
		throw()
		can_throw = false
		
	if Input.is_action_just_pressed("teleport") && !can_throw:
		teleport()
		
	return input

func _physics_process(delta):
	direction = get_input()
	if direction.length() > 0:
		velocity = direction.normalized()
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
		
	$AnimationTree.set("parameters/idle/blend_position", velocity)
	
	velocity = velocity * speed
		
	move_and_slide()
	
func throw():
	tp_weapon = weapon_scene.instantiate()
	tp_weapon.global_position = position
	tp_weapon.weapon_direction = (position - get_global_mouse_position()).normalized()
	get_parent().add_child(tp_weapon)
	
func teleport():
	position = tp_weapon.position
	tp_weapon.queue_free()
	can_throw = true
