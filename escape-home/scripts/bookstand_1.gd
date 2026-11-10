extends Node3D
@onready var player = get_tree().current_scene.get_node("player")
@onready var key_picture = get_tree().current_scene.get_node("bookshelf/key_picture")
var active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		if key_picture.picked_up == true:
			$key_picture_sprite.visible = true
