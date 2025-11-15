extends Node2D
@export var fireball_scene: PackedScene
@export var spawn_delay = 0
@onready var sprite_2d: Sprite2D = $"../Sprite2D"
@onready var spawn_timer = $SpawnTimer
@onready var fire_point: Marker2D = $"../FirePoint"
func _ready():
	randomize()
	spawn_timer.wait_time = spawn_delay
func _physics_process(delta: float) -> void:
	position.x = sprite_2d.position.x
func _on_spawn_timer_timeout():
	var fireball = fireball_scene.instantiate()
	fireball.position = fire_point.global_position
	if sprite_2d.flip_h:
		fireball.velocity.x = fireball.speed_x
		fireball.velocity.y = fireball.jump_force
	else:
		fireball.velocity.x = -fireball.speed_x
		fireball.velocity.y = fireball.jump_force
	get_tree().current_scene.add_child(fireball)
func _on_fire_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		spawn_timer.start()
	pass # Replace with function body.
func _on_fire_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		spawn_timer.stop()
	pass # Replace with function body.
