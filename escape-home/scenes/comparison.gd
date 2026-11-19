extends Node2D
@onready var drawing = $"../Line2D"
@onready var drawing_copy = $"../SubViewportContainer/SubViewport/Line2D"
@onready var drawing_script = $".."
var viewport_image: Image 
var copied_lines: Array[Line2D] = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport_image = get_viewport_image()
	var pixel = viewport_image.get_pixel(100,100)
	print(pixel, "pixel")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	drawing.visible = false

	for i in range(drawing_script.lines.size()):
		if copied_lines.size() <= i:
			var new_line = Line2D.new()
			new_line.width = 50.0
			new_line.default_color = Color.YELLOW
			new_line.position = Vector2(-335, -350)

			$"../SubViewportContainer/SubViewport".add_child(new_line)
			copied_lines.append(new_line)

		copied_lines[i].points = drawing_script.lines[i].points

	compare_images()

func get_viewport_image():
	return $"../SubViewportContainer/SubViewport".get_texture().get_image()
func get_viewport2_image():
	return $"../SubViewportContainer/SubViewport2".get_texture().get_image()

func compare_images():
	var image = get_viewport_image()
	var image2 = get_viewport2_image()
	var reference_pixels = 0
	var drawn_pixels = 0
	var pixel = null
	var pixel2 = null
	for x in range(image.get_width()):
		for y in range(image.get_height()):
			pixel = image.get_pixel(x, y)
			pixel2 = image2.get_pixel(x,y)
			if pixel == Color(1.0, 1.0, 0.0, 1.0) and pixel2 == Color(1.0, 0.0, 0.0, 1.0):
				drawn_pixels += 1
			elif pixel2 == Color(1.0, 0.0, 0.0, 1.0):
				reference_pixels += 1
	#print(pixel)
	print("reference_pixels:", reference_pixels)
	print("drawn_pixels:", drawn_pixels)
