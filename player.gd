extends CharacterBody2D
var jumpcnt=1
var health = Global.health
var isdamage = 0
@export var xpositon :int
@export var ypositon :int
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var jumpsound: AudioStreamPlayer2D = $jumpsound
@onready var fallingsound: AudioStreamPlayer = $fallingsound
@onready var labelcoin: Label = $"UI/score/score label/score numer label"
@onready var healthsprite: Sprite2D = $UI/health/healthsprite
@onready var dieing: CanvasLayer = $UI/dieing
@onready var backgrond: Panel = $UI/Dieing/backgrond
@onready var label: Label = $UI/Dieing/Label
@onready var button: Button = $UI/Dieing/Button
@onready var button_2: Button = $UI/Dieing/Button2
@onready var damage_sound: AudioStreamPlayer2D = $damage_sound
@onready var win: CanvasLayer = $UI/win
@onready var player: CharacterBody2D = $"."
var yellow_key = false
var blue_key = false
var jumper = 0
@onready var massagelabel: Label = $UI/massage/Label
@onready var massage: CanvasLayer = $UI/massage
func _ready() -> void:
	dieing.visible = false
	if Global.health <=3:
		health = Global.health
	else :
		health = 3 
func _physics_process(delta: float) -> void:
	Global.p_x = player.position.x
	Global.p_y = player.position.y
	if Global.level == 18:
		winn()
	Global.health = health
	match health:
		3:
			healthsprite.frame = 0
		2:
			healthsprite.frame = 1
		1:
			healthsprite.frame = 2
		0:
			healthsprite.frame = 3
			Global.health = 3
			health =3
			die()
	if health < 0:
		healthsprite.frame = 3
		Global.health = 3
		health =3
		die()
	if jumper == 1:
		print (jumper)
		velocity.y -= 1050
	move()
	move_and_slide()
func move(): 
	if Input.is_action_pressed("right") and isdamage == 0:
		
#		$Particles.emitting = true
		sprite.flip_h = false
		velocity.x = 300
		if is_on_floor():
			animation.play("move")
		pass    
	elif Input.is_action_pressed("left") and isdamage == 0 :
		#Golbal.p_x = sprite.position.x
		sprite.flip_h = true
#		$Particles.emitting = true
		velocity.x = -300
		if is_on_floor():
			animation.play("move")
		pass
	else :
		#$Particles.emitting = false
		if is_on_floor() and isdamage == 0:
			#Global.p_y = sprite.position.y
			animation.play("stand")
			velocity.x = 0
	if Input.is_action_just_pressed("jump") and jumpcnt<2 :
		#jumpsound.play()
		jumpcnt+=1
	#	$Particles.emitting = false
		velocity.y -= 500
		animation.play("jump")
		pass
	
	if not is_on_floor() :
		#Global.jump_height =-230
#		$Particles.emitting = true
		velocity.y +=12
		#animation.play("stand")
		pass
	else :
		jumpcnt = 1
		pass
		
func damage():
	
	isdamage = 1
	var dir
	animation.play("damage")
	#damage_sound.play()
	sprite.modulate = Color.RED
	velocity.y -= 200
	if sprite.flip_h == true :
		dir = -1
		pass
	else :
		dir = 1
	
	velocity.x = -200 * dir
	await get_tree().create_timer(0.25).timeout
	sprite.modulate = Color.WHITE
	
	health -= 1
	
	if health == 0 :
		pass
	isdamage = 0
	pass
func fall():
	#get_tree().reload_current_scene()
	health -= 1
	player.position.x = xpositon
	player.position.y = ypositon
	
	pass
func die():
	dieing.visible = true
	get_tree().paused = true
	
	
func _on_playagain_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://level_1.tscn")
	dieing.visible = false
	pass # Replace with function body.
func _on_button_2_pressed() -> void:
	get_tree().paused = false
	get_tree().quit()
	pass # Replace with function body.
func winn():
	win.visible = true
	get_tree().paused = true
