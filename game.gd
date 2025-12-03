extends Node

enum Visors {VISOR_NONE, VISOR_THERMAL, VISOR_ECHO}

func _ready():
    Engine.max_fps = 300