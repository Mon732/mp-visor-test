extends CanvasLayer

@export var camera : Camera3D

@onready var thermal : Control = $"Thermal"
@onready var echo : Control = $"Echo"
@onready var game : Game = get_parent()

const BITMASK_THERMAL = 2
const BITMASK_ECHO = 4
const BITMASK_NORMAL = ~(BITMASK_THERMAL | BITMASK_ECHO)

func _input(_event):
	if (Input.is_action_just_pressed("visor_1")):
		thermal.visible = false
		echo.visible = false
		camera.cull_mask = BITMASK_NORMAL
		game.visor_changed.emit(Game.VISORS.VISOR_NONE)
	elif (Input.is_action_just_pressed("visor_2")):
		thermal.visible = true
		echo.visible = false
		camera.cull_mask = BITMASK_NORMAL | BITMASK_THERMAL
		game.visor_changed.emit(Game.VISORS.VISOR_THERMAL)
	elif (Input.is_action_just_pressed("visor_3")):
		thermal.visible = false
		echo.visible = true
		camera.cull_mask = BITMASK_NORMAL | BITMASK_ECHO
		game.visor_changed.emit(Game.VISORS.VISOR_ECHO)
