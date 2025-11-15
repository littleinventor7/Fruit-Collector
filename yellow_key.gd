extends Area2D

@onready var animation: AnimationPlayer = $AnimationPlayer
func _ready() -> void:
	animation.play('move')
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.yellow_key = true
		animation.play('taken')
	pass # Replace with function body.
