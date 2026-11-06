extends StaticBody3D
var open = false
var moving = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if open == true:
		while moving < 500:
			position.y -= 0.005
			moving += 1
			#print(moving)
			await get_tree().create_timer(1.05).timeout
