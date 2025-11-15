extends CharacterBody2D
var speed = -200
@export var ypostion:int
@export var d :int
	
func _physics_process(delta):
	position.y  = ypostion
	velocity.y = 0
	#if is_on_wall() :
	#	d*=-1
	velocity.x = speed * d

	move_and_slide()

		 
func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"): 
		d*=-1
		pass
	pass # Replace with function body.
