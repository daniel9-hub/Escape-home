extends Node2D
var dot1_pressed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dot1_pressed:
		


func _on_dot_1_pressed() -> void:
	dot1_pressed = true
