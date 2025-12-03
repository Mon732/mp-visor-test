class_name EchoWave
extends Decal

@onready var animation_player : AnimationPlayer = $"AnimationPlayer"

func on_visor_changed(visor:int):
	if visor == Game.Visors.VISOR_ECHO:
		animation_player.play("echo_wave")
	else:
		animation_player.stop()
