class_name Main
extends Node3D

@onready var visor_layer : VisorLayer = $"VisorLayer"
@onready var world : World = $"World"
@onready var player : Player = $"Player"

func _ready():
	player.visor_changed.connect(on_visor_changed)

func on_visor_changed(visor:int):
	world.on_visor_changed(visor)
	visor_layer.on_visor_changed(visor)
