extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pos = RandomNumberGenerator.new()
	position = Vector2(pos.randf_range(-260,260), pos.randf_range(-130,130))


func die():
	var smoke_scene = preload("res://Scenes/smoke.tscn")
	var smoke_instance = smoke_scene.instantiate()
	get_parent().add_child(smoke_instance)
	smoke_instance.position = position
	smoke_instance.play("smoke")
	SoundPlayer.play_sound_hit()
	
	var clone = (load(scene_file_path) as PackedScene).instantiate()
	get_parent().add_child(clone)
	
	queue_free()
