extends Area2D
@onready var animation: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation.play("move")
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.health+= 1
		queue_free()
	pass # Replace with function body.
