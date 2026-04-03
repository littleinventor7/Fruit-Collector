extends Area2D
var d =  1
var attack = 0
var attacked = 0
@export var y = 0
@onready var animation: AnimationPlayer = $AnimationPlayer
func _ready() -> void:
	animation.play("move")
func _physics_process(delta: float) -> void:
	position.x = position.x + d 
	position.y = position.y + attack
	if attack == -1 :
		if position.y <= y :
			attacked = 0
			attack = 0
	$Sprite2D.flip_h = d>0
	pass

func _on_rightray_body_exited(body: Node2D) -> void:
	if body.is_in_group("world"):
		d *= -1
		print("zingy")
	pass # Replace with function body.
func _on_leftray_body_exited(body: Node2D) -> void:
	if body.is_in_group("world"):
		d *= -1
		print("zingy")
	pass # Replace with function body.
func _on_leftray_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("world"):
		#d *= -1
		pass # Replace with function body.
	if body.is_in_group("player") and attacked == 0:
		d = 1
		attack = 1
		attacked = 1
	pass # Replace with function body.
func _on_rightray_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("world"):
		#d *= -1
		pass
	pass # Replace with function body.
	if body.is_in_group("player") and attacked == 0:
		d = -1
		attack = 1
		attacked = 1
	pass # Replace with function body.


func _on_rightray_2_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		attack = -1
	pass # Replace with function body.


func _on_leftray_2_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		attack = -1
	pass # Replace with function body.

func _on_attakplayer_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.damage()
	elif body.is_in_group("world"):
		d*=-1
	pass # Replace with function body.

func _on_die_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		animation.play("die")
		position.x = 0
	pass # Replace with function body.
