extends Area2D
var score
var d = -1
var s= 0
var is_pulled = false

@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var score_numer_label: Label = $"UI/score label/score numer label"
func _ready() -> void:
	animation.play("move")
	pass

var target_nodeb = null
var target_nodem = null
var is_collecting = false
var speed = 5.0   

func _process(delta):
	target_nodem = get_tree().root.find_child("player", true, false)
	if is_collecting and target_nodeb:
		var screen_pos = target_nodeb.get_global_transform_with_canvas().origin
		var basket_world_pos = get_viewport().get_canvas_transform().affine_inverse() * screen_pos
		
		global_position = global_position.lerp(basket_world_pos, speed * delta)
		
		scale = scale.lerp(Vector2(0.1, 0.1), speed * delta)
		
		if global_position.distance_to(basket_world_pos) < 10:
			queue_free()
	elif Global.is_magenting and target_nodem:
		if is_pulled:
			magnett()
			var screen_pos = target_nodem.get_global_transform_with_canvas().origin
			var player_world_pos = get_viewport().get_canvas_transform().affine_inverse() * screen_pos
			print("jgjg")
			global_position = global_position.lerp(player_world_pos, speed * delta)
		
		#scale = scale.lerp(Vector2(0.1, 0.1), speed * delta)
			if global_position.distance_to(player_world_pos) < 10:
				start_collecting()

func _on_body_entered(body):
	if body.is_in_group("player") and not is_collecting:

		start_collecting()

func start_collecting():
	Global.fruits -= 1
	Global.num_banana +=1
	audio.play()
	is_collecting = true
	target_nodeb = get_tree().root.find_child("Basket", true, false)
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
func magnett():
	Global.is_magenting = true
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	
