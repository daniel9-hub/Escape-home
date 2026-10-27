extends StaticBody3D
@onready var book1 = get_tree().current_scene.get_node("book1")

var moving = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if book1.placed == true:
		while moving < 0:
			position += Vector3(0,0,-0.05)
			moving += 0.05
			await get_tree().create_timer(1.05).timeout
