extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func die():
	var smoke_scene = preload("res://Scenes/smoke.tscn")
	var smoke_instance = smoke_scene.instantiate()
	get_parent().add_child(smoke_instance)
	smoke_instance.position = position
	smoke_instance.play("smoke")
	SoundPlayer.play_sound_hit()
	GameManager.kill_enemy()
	queue_free()
