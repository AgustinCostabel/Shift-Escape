extends AudioStreamPlayer

const music_menu = preload("res://Assets/Ninja Adventure - Asset Pack/Musics/4 - Village.ogg")
const music_game = preload("res://Assets/Ninja Adventure - Asset Pack/Musics/17 - Fight.ogg")

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
	
