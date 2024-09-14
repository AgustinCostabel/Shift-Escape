extends Label

var int_timer
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	int_timer = GameManager.get_timer()
	text = str(int_timer)
	
	if int_timer <= 5:
		set_modulate(Color.RED)
