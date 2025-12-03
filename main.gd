class_name Main
extends Node3D

@onready var visor_layer : VisorLayer = $"VisorLayer"
@onready var world : World = $"World"
@onready var main_camera : MainCamera = $"MainCamera"

func _ready():
    visor_layer.visor_changed.connect(on_visor_changed)

func on_visor_changed(visor:int):
    world.on_visor_changed(visor)
    main_camera.on_visor_changed(visor)