extends CanvasLayer

@export var camera : Camera3D
@onready var thermal : Control = $"Thermal"

const BITMASK_THERMAL = 2

func _input(_event):
	if (Input.is_action_just_pressed("visor_1")):
		thermal.visible = false
		camera.cull_mask &= ~BITMASK_THERMAL
	elif (Input.is_action_just_pressed("visor_2")):
		thermal.visible = true
		camera.cull_mask |= BITMASK_THERMAL
