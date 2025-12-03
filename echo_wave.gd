class_name EchoWave
extends Decal

@onready var animationPlayer : AnimationPlayer = $"AnimationPlayer"

func on_visor_changed(visor:int):
	if visor == Game.VISORS.VISOR_ECHO:
		animationPlayer.play("echo_wave")
	else:
		animationPlayer.stop()
