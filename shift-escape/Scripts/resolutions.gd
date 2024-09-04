extends OptionButton

@onready var res_selected

var resolutions = { 
	"1152x648": Vector2i(1152,648),
	"3840x2160": Vector2i(3840,2160),
	"2560x1440": Vector2i(2560,1440),
	"1920x1080": Vector2i(1920,1080),
	"1366x768": Vector2i(1366,768),
	"1280x720": Vector2i(1280,720),
	"1440x900": Vector2i(1440,900),
	"1024x600": Vector2i(1024,600),
	"800x600": Vector2i(800,600),
}

func _ready() -> void:
	for r in resolutions:
		add_item(r)

func _on_item_selected(index: int) -> void:
	var key = get_item_text(index)
	get_window().set_size(resolutions[key])
	center_window()
	
func center_window():
	var screen_center = DisplayServer.screen_get_position() + DisplayServer.screen_get_size() / 2
	var window_size = get_window().get_size_with_decorations()
	get_window().set_position(screen_center - window_size / 2)
