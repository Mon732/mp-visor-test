class_name Main
extends Node3D

@onready var visorLayer : VisorLayer = $"VisorLayer"
@onready var world : World = $"World"
@onready var mainCamera : MainCamera = $"MainCamera"

func _ready():
    visorLayer.visor_changed.connect(on_visor_changed)

func on_visor_changed(visor:int):
    world.on_visor_changed(visor)
    mainCamera.on_visor_changed(visor)