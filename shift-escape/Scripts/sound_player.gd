extends AudioStreamPlayer2D

const sound_hit = preload("res://Assets/Ninja Adventure - Asset Pack/Sounds/Game/Hit.wav")
const shield_hit = preload("res://Assets/Ninja Adventure - Asset Pack/Sounds/Game/Hit4.wav")
const voice = preload("res://Assets/Ninja Adventure - Asset Pack/Sounds/Game/Voice1.wav")

func _play_sound(sound: AudioStream , volume = 0):			
	stream = sound
	volume_db = volume
	play()

func play_sound_hit():
	_play_sound(sound_hit)
	
func play_shield_hit():
	_play_sound(shield_hit)

func play_voice():
	_play_sound(voice)
