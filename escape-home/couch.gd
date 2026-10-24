extends StaticBody3D
var moving = false
var movement =-1
#var 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(moving)
	if moving:
		while movement < 0:
			position += Vector3(-0.05,0,0)
			movement += 0.05
			await get_tree().create_timer(0.05).timeout
