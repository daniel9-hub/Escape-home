extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_event.connect(_on_area_input_event)

func _on_area_input_event(camera, event, event_position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and visible == true:
			visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
