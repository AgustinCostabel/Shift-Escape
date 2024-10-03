extends Node2D

@export var animation_player : AnimationPlayer
@export var autoplay: bool = false
var end_anim = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next") and not animation_player.is_playing() and not end_anim:
		animation_player.play()

func pause():
	if autoplay == false:
		animation_player.pause()
		
func pause_music():
	AudioPlayer.stop_music()
	
func play_music_boss():
	AudioPlayer.play_music_boss()
	
func stop_timer():
	GameManager._stop_timer()
	
func start_timer():
	GameManager.change_timer(60)
	GameManager.restart_timer()
	
func voice_boss():
	SoundPlayer.play_voice()
	
func _end_anim():
	end_anim = true
	
