extends Node3D

@export var projectile: PackedScene
@onready var turret_head: MeshInstance3D = $TurretBase/TurretTop/TurretHead


func _on_timer_timeout() -> void:
	var shot = projectile.instantiate()
	add_child(shot)
	shot.global_position = turret_head.global_position
