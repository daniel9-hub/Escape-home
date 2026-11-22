extends Node2D
var dot1_pressed = false
var dot1 = false
var dot2_pressed = false
var dot2 = false
var dot3_pressed = false
var dot3 = false
var dot33_pressed = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dot1_pressed:
		$dot1/Line2D.set_point_position(1,$dot1/Line2D.to_local(get_global_mouse_position()))
		if dot3_pressed == true:
			dot3_pressed = false
			dot3_pressed = false
	if dot2_pressed:
		$dot22/Line2D.set_point_position(1,$dot22/Line2D.to_local(get_global_mouse_position()))


func _on_dot_1_pressed() -> void:
	if dot1_pressed == false and dot1 == false:
		dot1_pressed = true
		$dot1/Line2D.add_point($dot1/Line2D.to_local(get_global_mouse_position()))


func _on_dot_2_pressed() -> void:
	if dot2_pressed == false and dot2 == false:
		if dot1_pressed == true:
			dot2_pressed = true
			dot1_pressed = false
			dot1 = true
			$dot22/Line2D.add_point($dot22/Line2D.to_local(get_global_mouse_position()))


func _on_dot_3_pressed() -> void:
	if dot3_pressed ==  false:
		if dot2_pressed == true:
			dot3_pressed = true
			dot2_pressed = false
			dot2 = true
