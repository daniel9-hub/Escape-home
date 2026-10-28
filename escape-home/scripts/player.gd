extends CharacterBody3D
@onready var couch = get_tree().current_scene.get_node("couch")
@onready var couch_popup = $"../CanvasLayer/Control"
@onready var neck :=$neck
@onready var camera :=$neck/Camera3D
@onready var player := $"."
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@onready var book1 = get_tree().current_scene.get_node("book1")
@onready var bookshelf = get_tree().current_scene.get_node("bookshelf")
@onready var bookshelf_book1 = get_tree().current_scene.get_node("bookshelf/bookshelf_book1")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	couch_popup.visible = false

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _input(event:InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			player.rotate_y(-event.relative.x*0.002)
			neck.rotate_x(-event.relative.y*0.002)
			if neck.rotation_degrees.x > 90:
				neck.rotation_degrees.x = 90
			elif neck.rotation_degrees.x < -90:
				neck.rotation_degrees.x = -90
				
func _process(_delta: float) -> void:
	if $neck/ShapeCast3D.is_colliding():
		for i in range($neck/ShapeCast3D.get_collision_count()):
			var close_object = $neck/ShapeCast3D.get_collider(i)
			#print(close_object)
			#print('touching')
			if close_object == couch:
				#print("couch")
				couch_popup.visible = true
				if Input.is_action_just_pressed("interact"):
					print("click")
					couch.moving = true
			elif close_object == book1:
				if Input.is_action_just_pressed("interact"):
					print("click")
					book1.picked_up = true
			elif close_object == bookshelf:
				if Input.is_action_just_pressed("interact") and book1.picked_up == true:
					bookshelf_book1.visible = true
					book1.placed = true 
	else:
		couch_popup.visible = false
		
	#print(couch.get_path())
	#print(couch.get_script())
