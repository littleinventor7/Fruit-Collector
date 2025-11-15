extends Area2D
@onready var animation: AnimationPlayer = $AnimationPlayer
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and Global.yellow_key == true :
		animation.play('opened')
		await get_tree().create_timer(0.3).timeout
		Global.yellow_key = false
		queue_free()
	elif body.is_in_group("player") and Global.yellow_key == false :
		animation.play('without key')
	pass 
