extends StaticBody3D
var move = false
var movement = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if move == true:
		if movement < 10:
			rotation.z -= deg_to_rad(1)
			movement += 1
		elif movement >= 10 and movement < 20:
			rotation.z += deg_to_rad(1)
			movement += 1
		elif movement == 20:
			movement = 0
			move = false
	print(movement)
