extends CharacterBody2D

var d = -1
var speed = 40
@onready var animation: AnimationPlayer = $AnimationPlayer
@export var fireball_scene: PackedScene
@onready var fire_position = $FirePoint   # Node2D مكان خروج الكرة
@onready var timer = $Timer
#@onready var main = get_tree().get_root().get_node("redslim")
func _ready() -> void:
	animation.play("move")
#	timer.timeout.connect(_shoot_fireball)
	#shoot()
#func _shoot_fireball():
#	var fireball = fireball_scene.instantiate()
#	fireball.position = fire_position.global_position
#	get_tree().current_scene.add_child(fireball)


func _physics_process(delta):
	#animation.play("move") 
	if is_on_wall() or not $RayCast2D.is_colliding() :
		d*=-1
	$Sprite2D.flip_h = d > 0  
	
	velocity.x = speed * d

	
	if not is_on_floor():
		velocity.y += 800 * delta
	
	move_and_slide()


func _on_kill_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		velocity.x = 0
		velocity.y = 0
		body.damage()
		pass
	pass # Replace with function body.


func _on_die_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		animation.play("die")
		speed = 0
		velocity.y = 0
	pass # Replace with function body.


func _on_fireright_2_body_entered(body: Node2D) -> void:
	d = -1 
	
	pass # Replace with function body.


func _on_fireright_body_entered(body: Node2D) -> void:
	d = 1
	pass # Replace with function body.
