extends CharacterBody2D

@export var player_index = 1
@export var speed = 150
@export var friction = 1
@export var weapon_scene = load("res://Scenes/teleport_weapon_2.tscn")
@export var power_time_cooldown = 5

@onready var icon_weapon = get_parent().get_node("IconWeapon")
@onready var icon_clock = get_parent().get_node("IconClock")
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var screen_shader: ColorRect = $"../Camera2D/CanvasLayer/ColorRect"

var can_throw = true
var can_stop_time = true
var time_stoped = false
var return_normal_timer = 0
# var cooldown_stop_time = 0
var direction
var tp_weapon_2
var is_fading_out

var controller: String
var right_analog_axis
		
func _ready() -> void:
	set_teleport_progress(0.0)
	controller = GameManager.type_controller
	
func get_input():
	var input = Vector2()
	if Input.is_action_pressed('move_right_2'):
		input.x += 1
	if Input.is_action_pressed('move_left_2'):
		input.x -= 1
	if Input.is_action_pressed('move_down_2'):
		input.y += 1
	if Input.is_action_pressed('move_up_2'):
		input.y -= 1
		
	if Input.is_action_just_pressed("throw"):
		if can_throw:
			throw()
		elif tp_weapon_2.weapon_speed <= 0:
			tp_weapon_2.queue_free()
			restore_weapon()
		
	if Input.is_action_just_pressed("teleport") && !can_throw:
		teleport()
		
	if Input.is_action_just_pressed("stop_time") && can_stop_time:
		stop_time()
		
	return input

func _process(delta):
	#cooldown_stop_time += delta
	#if cooldown_stop_time > power_time_cooldown:
	#	cooldown_stop_time = 0
	#	can_stop_time = true
	#	icon_clock.self_modulate = Color("white")
	right_analog_axis = Vector2(Input.get_joy_axis(player_index, JOY_AXIS_RIGHT_X), Input.get_joy_axis(player_index, JOY_AXIS_RIGHT_Y))
		
	if(right_analog_axis != Vector2(0,0)):
		if can_throw:
			throw()
		elif tp_weapon_2.weapon_speed <= 0:
			tp_weapon_2.queue_free()
			restore_weapon()
	
	if time_stoped:
		return_normal_timer += delta
		if return_normal_timer > 0.3:
			Engine.time_scale = 1
			return_normal_timer = 0
			time_stoped = false
			screen_shader.material.set("shader_parameter/alpha", 0)
			screen_shader.material.set("shader_parameter/gray", 0)
			screen_shader.material.set("shader_parameter/distortion", 0)
		

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
	if controller == "K":
		tp_weapon_2 = weapon_scene.instantiate()
		tp_weapon_2.global_position = position
		tp_weapon_2.weapon_direction = (position - get_global_mouse_position()).normalized()
		get_parent().add_child(tp_weapon_2)
		can_throw = false
		icon_weapon.self_modulate = Color("red")
	
	if controller == "C":
		tp_weapon_2 = weapon_scene.instantiate()
		tp_weapon_2.global_position = position
		tp_weapon_2.weapon_direction = (right_analog_axis * -1).normalized()
		get_parent().add_child(tp_weapon_2)
		can_throw = false
		icon_weapon.self_modulate = Color("red")
	
func teleport():
	teleport_animation()
	position = tp_weapon_2.position
	tp_weapon_2.queue_free()
	restore_weapon()

func stop_time():
	Engine.time_scale = 0.1
	time_stoped = true
	can_stop_time = false
	icon_clock.self_modulate = Color("red")
	screen_shader.material.set("shader_parameter/alpha", 1)
	screen_shader.material.set("shader_parameter/gray", 4)
	screen_shader.material.set("shader_parameter/distortion", 0.005)
	
func restore_weapon():
	can_throw = true
	icon_weapon.self_modulate = Color("white")
	
func die():
	print("die")	
	
func teleport_animation():
	var start_value = 0.0 if is_fading_out == true else 1.0
	var end_value = 1.0 if is_fading_out == false else 0.0
	var tween = get_tree().create_tween()
	tween.tween_method(set_teleport_progress, start_value, end_value, 0.75)

func set_teleport_progress(val: float):
	sprite.material.set("shader_parameter/teleport_progress", val)
