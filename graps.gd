extends CharacterBody2D
var score
var d = -1
var speed = 100
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
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
		audio.play()
		start_collecting()
		Global.num_grapes += 1
#		animation.play('taken')
		#queue_free()
	if body.is_in_group("fruits"):
		Global.dfruits *= -1
		
	pass # Replace with function body.
var target_node = null
var is_collecting = false
var sped = 5.0   

func _process(delta):
	if is_collecting and target_node:
		var screen_pos = target_node.get_global_transform_with_canvas().origin
		var basket_world_pos = get_viewport().get_canvas_transform().affine_inverse() * screen_pos
		
		global_position = global_position.lerp(basket_world_pos, speed * delta)
		
		scale = scale.lerp(Vector2(0.1, 0.1), sped * delta)
		
		if global_position.distance_to(basket_world_pos) < 10:
			queue_free()



func start_collecting():
	is_collecting = true
	target_node = get_tree().root.find_child("Basket", true, false)
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)

	
