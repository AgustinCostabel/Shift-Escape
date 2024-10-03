extends AudioStreamPlayer

const music_menu = preload("res://Assets/Ninja Adventure - Asset Pack/Musics/4 - Village.ogg")
const music_game = preload("res://Assets/Ninja Adventure - Asset Pack/Musics/17 - Fight.ogg")
const music_boss = preload("res://Assets/Ninja Adventure - Asset Pack/Musics/24 - Final Area.ogg")
const music_credits = preload("res://Assets/Ninja Adventure - Asset Pack/Musics/15 - Credit Theme.ogg")

func _play_music(music: AudioStream , volume = 0):	
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()

func play_music_menu():
	_play_music(music_menu)
	
func play_music_game():
	_play_music(music_game)
	
func play_music_boss():
	_play_music(music_game)
	_play_music(music_boss)

func play_music_credits():
	_play_music(music_credits)
	
func stop_music():
	stop()

	
	
