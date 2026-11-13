extends Node2D
var dot1_pressed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dot1_pressed:
			$dot1/Line2D.set_point_position(1,$dot1/Line2D.to_local(get_global_mouse_position()))
		


func _on_dot_1_pressed() -> void:
	dot1_pressed = true
	$dot1/Line2D.add_point($dot1.position)
	$dot1/Line2D.add_point($dot1/Line2D.to_local(get_global_mouse_position()))
