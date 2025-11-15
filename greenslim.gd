extends CharacterBody2D

var d = -1
var speed = 40
@onready var animation: AnimationPlayer = $AnimationPlayer
func _ready() -> void:
	animation.play("move")

func _physics_process(delta):
	#animation.play("move") 
	# لو مفيش أرض تحت وعدينا فترة السماح -> لف الاتجاه
	if is_on_wall() or not $RayCast2D.is_colliding() :
		d*=-1
		$Sprite2D.flip_h = d > 0  
	
	# حركة أفقية
	velocity.x = speed * d

	# جاذبية
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
