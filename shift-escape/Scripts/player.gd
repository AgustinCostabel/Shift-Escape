extends CharacterBody2D

@export var speed = 150
@export var friction = 1
@export var weapon_scene = load("res://Scenes/teleport_weapon.tscn")
@export var power_time_cooldown = 5

@onready var icon_weapon = get_parent().get_node("IconWeapon")
@onready var icon_clock = get_parent().get_node("IconClock")

var can_throw = true
var can_stop_time = true
var time_stoped = false
var return_normal_timer = 0
var cooldown_stop_time = 0
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
		
	if Input.is_action_just_pressed("throw"):
		if can_throw:
			throw()
			can_throw = false
			icon_weapon.self_modulate = Color("red")
		else:
			tp_weapon.queue_free()
			restore_weapon()
		
	if Input.is_action_just_pressed("teleport") && !can_throw:
		teleport()
		
	if Input.is_action_just_pressed("stop_time") && can_stop_time:
		stop_time()
		
	return input

func _process(delta):
	cooldown_stop_time += delta
	if cooldown_stop_time > power_time_cooldown:
		cooldown_stop_time = 0
		can_stop_time = true
		icon_clock.self_modulate = Color("white")
	
	if time_stoped:
		return_normal_timer += delta
		if return_normal_timer > 0.1:
			Engine.time_scale = 1
			return_normal_timer = 0
			time_stoped = false
		

func _physics_process(_delta):
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
	restore_weapon()

func stop_time():
	Engine.time_scale = 0.05
	time_stoped = true
	can_stop_time = false
	icon_clock.self_modulate = Color("red")
	
func restore_weapon():
	can_throw = true
	icon_weapon.self_modulate = Color("white")
	
func die():
	print("die")
