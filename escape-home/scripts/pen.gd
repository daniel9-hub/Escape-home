extends Sprite3D
@onready var area = get_node("Area3D")

var picked_up_var = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#area.input_event.connect(_on_area_input_event)
	area.input_event.connect(_on_area_input_event)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#$"../CanvasLayer/Control/Line2D".hide()
	if picked_up_var == true:
		picked_up()
	#print(picked_up_var)
func _on_area_input_event(camera, event, event_position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if picked_up_var == false:
				print("Sprite clicked!")
				picked_up_var = true
			else:
				picked_up_var = false
				placed()
func picked_up():
	var mouse = get_viewport().get_mouse_position()
	var center = get_viewport().get_visible_rect().size / 2
	#print(get_node_or_null("CanvasLayer/Sprite2D"))
	$"../CanvasLayer/Control/Sprite2D".global_position = get_viewport().get_mouse_position()
	$"../Sprite3D".texture = load("res://2d_assets/pen_outline.png")
	$"../CanvasLayer/Control/Sprite2D".visible = true
	#print(mouse.y)
	#print(position.x)
func placed():
	$"../Sprite3D".texture = load("res://2d_assets/pen.png")
	$"../CanvasLayer/Control/Sprite2D".visible = false
