extends Node2D
var current_line: Line2D
var lines: Array[Line2D] = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and $"../../Sprite3D".picked_up_var:
		if event.pressed:
			current_line = Line2D.new()
			current_line.width = 10.0
			current_line.default_color = Color.YELLOW
			add_child(current_line)
			current_line.add_point(event.position)
			lines.append(current_line)
	elif event is InputEventMouseMotion and current_line:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			current_line.add_point(event.position)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and $"../../Sprite3D".picked_up_var and current_line != null:
		for current_line in lines:
			current_line.queue_free()
		lines.clear()
		current_line = null
