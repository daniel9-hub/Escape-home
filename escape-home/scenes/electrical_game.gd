extends Node2D
var completed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if completed == false:
		if $group1.dot3_pressed == true:
			if $group2.dot3_pressed == true:
				if $group3.dot3_pressed == true:
					if $group4.dot3_pressed == true:
						$"../OmniLight3D".position -= Vector3(100,100,100)
						$".".visible = false
						$"..".visible = true
						completed = true
						$"../electrical_box".active = false
