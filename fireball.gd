extends Area2D

@export var speed_x = 350   
@export var jump_force = -350
@export var gravitغy = 600
var velocity =Vector2.ZERO
func _process(delta: float) -> void:
	velocity.y += gravitغy * delta
	position += velocity * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.damage()
		queue_free()
	elif not body.is_in_group("redslim") :
		queue_free()
	pass # Replace with function body.
