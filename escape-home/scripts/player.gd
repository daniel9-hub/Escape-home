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
@onready var lever = get_tree().current_scene.get_node("lever/lever")
@onready var lever2 = get_tree().current_scene.get_node("lever2/lever")
@onready var lever3 = get_tree().current_scene.get_node("lever3/lever")
@onready var lever4 = get_tree().current_scene.get_node("lever4/lever")
@onready var torch1 = get_tree().current_scene.get_node("torch")
@onready var torch2 = get_tree().current_scene.get_node("torch2")
@onready var Secret_wall = get_tree().current_scene.get_node("Secret_wall")
@onready var torch3 = get_tree().current_scene.get_node("torch3")
@onready var bookstand1 = get_tree().current_scene.get_node("bookstand1")
@onready var key_picture_staticbody = get_tree().current_scene.get_node("bookshelf/key_picture/key_picture_staticbody")
@onready var key_picture = get_tree().current_scene.get_node("bookshelf/key_picture")
var l1 = false
var l2 = false
var l3 = false
var l4 = false
var torch_combination_correct = false
func _on_ready():
	$neck/Camera3D.make_current()
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
	if event is InputEventMouseButton and bookstand1.active == false:
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
			elif close_object == torch1:
				#print("torch1")
				if Input.is_action_just_pressed("interact"):
					torch1.rotation.z += deg_to_rad(45)
			elif close_object == torch2:
				#print("torch2")
				if Input.is_action_just_pressed("interact"):
					torch2.rotation.z += deg_to_rad(-45)
			elif close_object == torch3 and torch_combination_correct:
				if Input.is_action_just_pressed("interact"):
					torch3.move = true
					bookstand1.position = Vector3(0.159,-0.26,-9.632)
					key_picture.visible = true
			elif close_object == bookstand1:
				if Input.is_action_just_pressed("interact"):
					switch_camera()
					print("bookstand1")
			if close_object == key_picture_staticbody:
				if Input.is_action_just_pressed("interact"):
					key_picture.visible = false
					print("key_picture")
			#print(close_object)
	if $neck/RayCast3D.is_colliding():
		var raycast_close_object = $neck/RayCast3D.get_collider()
		if raycast_close_object == lever:
			if Input.is_action_just_pressed(("interact")):
				print("lever")
				lever.rotation.z += deg_to_rad(180)
				if l1 == false:
					l1 = true
				else:
					l1 = false
		elif raycast_close_object == lever2:
			if Input.is_action_just_pressed(("interact")):
				print("lever2")
				lever2.rotation.z += deg_to_rad(180)
				if l2 == false:
					l2 = true
				else:
					l2 = false
		if raycast_close_object == lever3:
			if Input.is_action_just_pressed(("interact")):
				print("lever3")
				lever3.rotation.z += deg_to_rad(180)
				if l3 == false:
					l3 = true
				else:
					l3 = false
		if raycast_close_object == lever4:
			if Input.is_action_just_pressed(("interact")):
				print("lever4")
				lever4.rotation.z += deg_to_rad(180)
				if l4 == false:
					l4 = true
				else:
					l4 = false
					
	else:
		couch_popup.visible = false
	if l1 == true:
		if l2 == false:
			if l3 == true:
				if l4 == false:
					#print("open")
					Secret_wall.open = true
	if round(rad_to_deg(torch1.rotation.z)) >= 360.0:
		torch1.rotation.z = 0
	if round(rad_to_deg(torch2.rotation.z)) <= -360.0:
		torch2.rotation.z = 0
	if round(rad_to_deg(torch1.rotation.z)) == 90.0:
		if round(rad_to_deg(torch2.rotation.z)) == -225.0:
			#print("torch_combination_correct")
			torch_combination_correct = true
	#print(round(rad_to_deg(torch1.rotation.z)))
	#print(round(rad_to_deg(torch2.rotation.z)))
	#print(couch.get_path())
	#print(couch.get_script())
func switch_camera():
	$"../bookstand1/Camera3D".make_current()
	bookstand1.active = true
