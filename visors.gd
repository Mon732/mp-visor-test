extends CanvasLayer

@export var camera : Camera3D

@onready var thermal : Control = $"Thermal"
@onready var echo : Control = $"Echo"

const BITMASK_THERMAL = 2
const BITMASK_ECHO = 4
const BITMASK_NORMAL = ~(BITMASK_THERMAL | BITMASK_ECHO)

func _input(_event):
	if (Input.is_action_just_pressed("visor_1")):
		thermal.visible = false
		echo.visible = false
		camera.cull_mask = BITMASK_NORMAL
	elif (Input.is_action_just_pressed("visor_2")):
		thermal.visible = true
		echo.visible = false
		camera.cull_mask = BITMASK_NORMAL
		camera.cull_mask |= BITMASK_THERMAL
	elif (Input.is_action_just_pressed("visor_3")):
		thermal.visible = false
		echo.visible = true
		camera.cull_mask = BITMASK_NORMAL
		camera.cull_mask |= BITMASK_ECHO
