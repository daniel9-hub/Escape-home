extends Sprite3D
@onready var area = get_node("Area3D")
@onready var player = get_tree().current_scene.get_node("CharacterBody3D")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area.input_event.connect(_on_area_input_event)
	#print("Current scene: ", get_tree().current_scene)
	#print("My path: ", get_path())
	#print("Scene children: ", get_tree().current_scene.get_children())
	
func _on_area_input_event(camera, event, event_position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			player.switch_camera()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
