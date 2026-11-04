extends StaticBody3D
var move = false
var movement = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if move == true:
		while movement <= 10:
			rotation.z -= deg_to_rad(1)
			movement += 1
			#print("backward")
			await get_tree().create_timer(1.05).timeout
		while movement > 10 and movement <= 20:
			rotation.z += deg_to_rad(1)
			movement += 1
			#print("forward")
			await get_tree().create_timer(1.05).timeout
		if movement >= 20:
			movement = 0
			move = false
	print(movement)
