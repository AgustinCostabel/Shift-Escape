extends StaticBody2D

@export var label: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pos = RandomNumberGenerator.new()
	position = Vector2(pos.randf_range(-260,260), pos.randf_range(-130,130))
	$Label.text = label

func die():
	var smoke_scene = preload("res://Scenes/smoke.tscn")
	var smoke_instance = smoke_scene.instantiate()
	get_parent().add_child(smoke_instance)
	smoke_instance.position = position
	smoke_instance.play("smoke")
	SoundPlayer.play_sound_hit()
	var pos = RandomNumberGenerator.new()
	position = Vector2(pos.randf_range(-260,260), pos.randf_range(-130,130))
