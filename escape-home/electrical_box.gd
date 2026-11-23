extends StaticBody3D
var door_open = false
var active = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if door_open:
		$door.visible = false
		$door2.visible = true
		if active == true:
			$"../electrical_game".show()
			$"..".hide()
			$"..".process_mode = Node.PROCESS_MODE_ALWAYS
			$"../electrical_game".process_mode = Node.PROCESS_MODE_INHERIT
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			#entering = false
