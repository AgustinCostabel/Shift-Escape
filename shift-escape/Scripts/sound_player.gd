extends AudioStreamPlayer2D

const sound_hit = preload("res://Assets/Ninja Adventure - Asset Pack/Sounds/Game/Hit.wav")

func _play_sound(sound: AudioStream , volume = 0):			
	stream = sound
	volume_db = volume
	play()

func play_sound_hit():
	_play_sound(sound_hit)

