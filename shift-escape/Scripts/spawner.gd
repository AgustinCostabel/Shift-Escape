extends Node2D

@export var spawn_item_scene: PackedScene
@export var timer: float

func _ready() -> void:
	$Timer.wait_time = timer

func _on_timer_timeout() -> void:
	var spawn_item = spawn_item_scene.instantiate()
	get_parent().get_parent().add_child(spawn_item)
	spawn_item.position = get_parent().position
	
func stop():
	$Timer.stop()
	
func start():
	$Timer.start()
	
