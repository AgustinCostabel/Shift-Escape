extends OptionButton

@onready var con_selected

var controllers = { 
	"Keyboard/Mouse": String("K"),
	"Controller": String("C"),
}

func _ready() -> void:
	for c in controllers:
		add_item(c)

func _on_item_selected(index: int) -> void:
	var key = get_item_text(index)
	GameManager.change_type_controller(controllers[key])
