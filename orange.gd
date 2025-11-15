extends CharacterBody2D
var score
var d = -1
var speed = 100
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var score_numer_label: Label = $"UI/score label/score numer label"
func _ready() -> void:
	animation.play("move")
	pass
func _physics_process(delta):
	velocity.y = 0
	#animation.play("move") 
	# لو مفيش أرض تحت وعدينا فترة السماح -> لف الاتجاه
	if not $RayCast2D.is_colliding() :
		Global.dfruits *=-1
		$Sprite2D.flip_h = Global.dfruits > 0
	
	# حركة أفقية
	velocity.x = speed * Global.dfruits
	if not is_on_floor():
		velocity.y += 8000 * delta
	move_and_slide()
func _on_orange_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.fruits -= 1
		#Golbal.coins += 1
#		animation.play('taken')
		queue_free()
	if body.is_in_group("fruits"):
		Global.dfruits *= -1
		
	pass # Replace with function body.

	pass # Replace with function body.
