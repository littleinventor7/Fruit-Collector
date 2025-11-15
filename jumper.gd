extends Area2D

@onready var animation: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.jumper = 1
		animation.play('jump')
		await get_tree().create_timer(0.45).timeout
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.jumper = 0    
		animation.play('jump_end')
	pass # Replace with function body.
