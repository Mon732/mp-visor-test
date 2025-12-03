class_name World
extends Node3D

@onready var grid_map : GridMap = $"GridMap"
@onready var light : DirectionalLight3D = $"DirectionalLight3D"

var tile_material = preload("res://stage/tile_material.tres")
var tile_material_echo = preload("res://stage/tile_material_echo.tres")

func _ready() -> void:
	if RenderingServer.get_current_rendering_method() == "gl_compatibility":
		# Use PCF13 shadow filtering to improve quality (Medium maps to PCF5 instead).
		RenderingServer.directional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_HIGH)

		# Darken the light's energy to compensate for sRGB blending (without affecting sky rendering).
		$DirectionalLight3D.sky_mode = DirectionalLight3D.SKY_MODE_SKY_ONLY
		var new_light: DirectionalLight3D = $DirectionalLight3D.duplicate()
		new_light.light_energy = 0.25
		new_light.sky_mode = DirectionalLight3D.SKY_MODE_LIGHT_ONLY
		add_child(new_light)

func on_visor_changed(visor:int):
	print(visor)
	var item_list : PackedInt32Array = grid_map.mesh_library.get_item_list()

	var new_material : Material
	if (visor == Game.Visors.VISOR_ECHO):
		new_material = tile_material_echo
		light.shadow_enabled = false
	else:
		new_material = tile_material
		light.shadow_enabled = true
	
	for item in item_list:
		grid_map.mesh_library.get_item_mesh(item).surface_set_material(0, new_material)
