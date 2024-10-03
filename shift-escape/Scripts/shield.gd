extends Area2D

var color: Color
var player
@export var max_hits: int
@export var color_modulate: float
@export var increase_anim_speed: float
var hits

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	color = Color.WHITE
	hits = max_hits
	$AnimatedSprite2D.speed_scale = 1

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("weapon"):
		if area.get_hit() == false:
			area.change_hit()
			area.reduce_speed()
			area.reverse_direction()
			color = lerp(color, Color.RED, color_modulate)
			modulate = color
			hit()
			$"..".change_position()
			$AnimatedSprite2D.speed_scale += increase_anim_speed
			
func hit():
	SoundPlayer.play_shield_hit()
	hits = hits - 1
	if hits == 0:
		destroy()
		get_parent().destroy_shield()
	
func destroy():
	queue_free()
