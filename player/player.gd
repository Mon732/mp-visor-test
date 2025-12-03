class_name Player
extends Camera3D

@export var move_speed : float = 10.0
@export var sensitivity : float = 1.0

@onready var echo_wave : EchoWave = $"EchoWave"

signal visor_changed(visor:Game.Visors)

const BITMASK_THERMAL = 2
const BITMASK_ECHO = 4
const BITMASK_NORMAL = ~(BITMASK_THERMAL | BITMASK_ECHO)

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

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
	
	if (Input.is_action_just_pressed("visor_1")):
		cull_mask = BITMASK_NORMAL
		visor_changed.emit(Game.Visors.VISOR_NONE)
		echo_wave.disable_wave()
	elif (Input.is_action_just_pressed("visor_2")):
		cull_mask = BITMASK_NORMAL | BITMASK_THERMAL
		visor_changed.emit(Game.Visors.VISOR_THERMAL)
		echo_wave.disable_wave()
	elif (Input.is_action_just_pressed("visor_3")):
		cull_mask = BITMASK_NORMAL | BITMASK_ECHO
		visor_changed.emit(Game.Visors.VISOR_ECHO)
		echo_wave.enable_wave()
