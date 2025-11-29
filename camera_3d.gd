extends Camera3D

@export var move_speed : float = 10.0
@export var sensitivity : float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("free_mouse")):
		if (Input.mouse_mode == Input.MOUSE_MODE_CAPTURED):
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	var direction : Vector3 = Vector3()
	if (Input.is_action_pressed("move_forward")):
		direction.z = -1;
	elif (Input.is_action_pressed("move_backward")):
		direction.z = 1;
	
	if (Input.is_action_pressed("move_left")):
		direction.x = -1;
	elif (Input.is_action_pressed("move_right")):
		direction.x = 1;
	
	if (Input.is_action_pressed("move_up")):
		direction.y = 1;
	elif (Input.is_action_pressed("move_down")):
		direction.y = -1;
	
	direction *= move_speed * delta
	translate(direction)


func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_object_local(Vector3(1.0, 0.0, 0.0), deg_to_rad(event.relative.y * sensitivity * -1))
		rotate_object_local(Vector3(0.0, 1.0, 0.0), deg_to_rad(event.relative.x * sensitivity * -1))
