class_name Game
extends Node3D

enum VISORS {VISOR_NONE, VISOR_THERMAL, VISOR_ECHO}

@warning_ignore("UNUSED_SIGNAL")
signal visor_changed(visor:VISORS)
