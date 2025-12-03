extends Decal

@onready var game : Game = get_parent().get_parent()
@onready var animationPlayer : AnimationPlayer = $"AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	game.visor_changed.connect(on_visor_changed)

func on_visor_changed(visor:int):
	if visor == Game.VISORS.VISOR_ECHO:
		animationPlayer.play("echo_wave")
	else:
		animationPlayer.stop()
