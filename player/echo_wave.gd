class_name EchoWave
extends Decal

@onready var animation_player : AnimationPlayer = $"AnimationPlayer"

func enable_wave():
	animation_player.play("echo_wave")

func disable_wave():
	animation_player.stop()
