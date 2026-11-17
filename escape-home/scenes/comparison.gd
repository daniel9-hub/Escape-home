extends Node2D
@onready var drawing = $"../Line2D"
@onready var drawing_copy = $"../SubViewportContainer/SubViewport/Line2D"
var viewport_image: Image 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport_image = get_viewport_image()
	var pixel = viewport_image.get_pixel(100,100)
	print(pixel, "pixel")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	drawing_copy.points = drawing.points
	compare_images()

func get_viewport_image():
	return $"../SubViewportContainer/SubViewport".get_texture().get_image()

func compare_images():
	var image = get_viewport_image()
	var reference_pixels = 0
	var drawn_pixels = 0
	var pixel = null
	for x in range(image.get_width()):
		for y in range(image.get_height()):
			pixel = image.get_pixel(x, y)
	print(pixel)
