extends Area2D
var score
var d = -1
var speed = 70
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var score_numer_label: Label = $"UI/score label/score numer label"
func _ready() -> void:
	animation.play("move")
	pass
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.fruits -= 1
		#Golbal.coins += 1
#		animation.play('taken')
		queue_free()
	pass # Replace with function body.

	pass # Replace with function body.
