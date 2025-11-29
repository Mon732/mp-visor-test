extends CanvasLayer

@onready var fps_label : Label = $"FPS"

# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.max_fps = 300


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	fps_label.text = "FPS %d" % Engine.get_frames_per_second()
