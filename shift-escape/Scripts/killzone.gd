extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		call_deferred("restart_level")

func restart_level():
	LevelManager.restart_level()
