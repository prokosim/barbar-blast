extends Node3D

@export var projectile: PackedScene
@export var turret_range := 10.0
var enemy_path: Path3D
var target: PathFollow3D

@onready var turret_head: MeshInstance3D = $TurretBase/TurretTop/TurretHead
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var cannon_glb: Node3D = $TurretBase/TurretTop/TurretHead/CannonGLB
@onready var turret_base: MeshInstance3D = $TurretBase


func _physics_process(delta: float) -> void:
	target = find_best_target()
	if target:
		turret_base.look_at(target.global_position, Vector3.UP, true)
	

func _on_timer_timeout() -> void:
	if target:
		animation_player.play("Fire")
		var shot = projectile.instantiate()
		add_child(shot)
		shot.global_position = cannon_glb.global_position
		shot.direction = turret_base.global_transform.basis.z
	
func find_best_target() -> PathFollow3D:
	var best_target = null
	var best_progress := 0.0
	for enemy in enemy_path.get_children():
		if enemy is PathFollow3D:
			var distance = global_position.distance_to(enemy.global_position)
			if distance < turret_range:
				if enemy.progress > best_progress:
					best_target = enemy
					best_progress = enemy.progress
	return best_target
