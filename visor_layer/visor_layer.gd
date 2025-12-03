class_name VisorLayer
extends CanvasLayer

@onready var thermal : Control = $"Thermal"
@onready var echo : Control = $"Echo"

func on_visor_changed(visor:int):
	match visor:
		Game.Visors.VISOR_NONE:
			thermal.visible = false
			echo.visible = false
		Game.Visors.VISOR_THERMAL:
			thermal.visible = true
			echo.visible = false
		Game.Visors.VISOR_ECHO:
			thermal.visible = false
			echo.visible = true
