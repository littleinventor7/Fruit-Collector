extends CharacterBody2D
var jumpcnt=1
var health = Global.health
var isdamage = 0
var ani = ""
var ani_move = ""
var ani_stand = ""
var ani_jump = ""
var ani_damage = ""
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
	if Global.green_selected == 1:
		ani_move = "move"
		ani_stand = "stand"
		ani_jump = "jump"
		ani_damage = "damage"
	elif Global.yellow_selected == 1:
		ani_move = "move_yellow"
		ani_stand = "stand_yellow"
		ani_jump = "jump_yellow"
		ani_damage = "damage_yellow"
	elif Global.pink_selected == 1:
		ani_move = "move_pink"
		ani_stand = "stand_pink"
		ani_jump = "jump_pink"
		ani_damage = "damage_pink"
	elif Global.purple_selected == 1:
		ani_move = "move_purple"
		ani_stand = "stand_purple"
		ani_jump = "jump_purple"
		ani_damage = "damage_purple"
	elif Global.brown_selected == 1:
		ani_move = "move_brown"
		ani_stand = "stand_brown"
		ani_jump = "jump_brown"
		ani_damage = "damage_brown"
	animation.play(ani_stand)
	dieing.visible = false
	if Global.health <=3:
		health = Global.health
	else :
		health = 3 
func _physics_process(delta: float) -> void:
	if Global.green_selected == 1:
		ani_move = "move"
		ani_stand = "stand"
		ani_jump = "jump"
		ani_damage = "damage"
	elif Global.yellow_selected == 1:
		ani_move = "move_yellow"
		ani_stand = "stand_yellow"
		ani_jump = "jump_yellow"
		ani_damage = "damage_yellow"
	elif Global.pink_selected == 1:
		ani_move = "move_pink"
		ani_stand = "stand_pink"
		ani_jump = "jump_pink"
		ani_damage = "damage_pink"
	elif Global.purple_selected == 1:
		ani_move = "move_purple"
		ani_stand = "stand_purple"
		ani_jump = "jump_purple"
		ani_damage = "damage_purple"
	elif Global.brown_selected == 1:
		ani_move = "move_brown"
		ani_stand = "stand_brown"
		ani_jump = "jump_brown"
		ani_damage = "damage_brown"
	if Input.is_action_just_pressed("magenting")and Global.num_magnets >0:
		if $UI/Shop_UI.visible == false and $UI/Basket_UI.visible == false:
			if $UI/win.visible == false and $UI/dieing.visible == false:
				if not Global.is_magenting:
					activate_magnet()
	if Input.is_action_just_pressed("sheild")and Global.num_sheild >0:
		if $UI/Shop_UI.visible == false and $UI/Basket_UI.visible == false:
			if $UI/win.visible == false and $UI/dieing.visible == false:
				if not Global.is_sheild :
					activate_shield()
	if Input.is_action_just_pressed("health")and Global.num_health >0:
		print("ppplkoo")
		if $UI/Shop_UI.visible == false and $UI/Basket_UI.visible == false:
			if $UI/win.visible == false and $UI/dieing.visible == false:
				print("ikhh")
				if Global.health < 3:
					print("bravo")
					Global.health +=1
					Global.num_health -= 1
	Global.p_x = player.position.x
	Global.p_y = player.position.y
	if Global.level == 18:
		winn()
	health = Global.health 
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
			animation.play(ani_move)
		pass    
	elif Input.is_action_pressed("left") and isdamage == 0 :
		#Golbal.p_x = sprite.position.x
		sprite.flip_h = true
#		$Particles.emitting = true
		velocity.x = -300
		if is_on_floor():
			animation.play(ani_move)
		pass
	else :
		#$Particles.emitting = false
		if is_on_floor() and isdamage == 0:
			#Global.p_y = sprite.position.y
			animation.play(ani_stand)
			velocity.x = 0
	if Input.is_action_just_pressed("jump") and jumpcnt<2 :
		#jumpsound.play()
		jumpcnt+=1
	#	$Particles.emitting = false
		velocity.y -= 500
		animation.play(ani_jump)
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
	if $Shield_Area.visible == false:
		isdamage = 1
		var dir
		animation.play(ani_damage)
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
	
		Global.health -= 1
	
		if health == 0 :
			pass
		isdamage = 0
	
	pass
func fall():
	#get_tree().reload_current_scene()
	Global.health -= 1
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

func _on_magnetic_area_area_entered(area: Area2D) -> void:
	#if area.is_in_group("fruits"):
	if "is_pulled" in area:
		area.is_pulled = true
		print(area.is_pulled)
	pass # Replace with function body.


func _on_shield_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy") :
		body.d *= -1
	elif body.is_in_group("enemy_attack") :
		body.queue_free()
	pass # Replace with function body.


func _on_shield_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy") :
		area.d *= -1
	elif "enemy_attack" in area and not area.is_in_group("redslim"):
		print(area)
		area.queue_free()
	pass # Replace with function body.


func _on_magnetic_area_area_exited(area: Area2D) -> void:
	if "is_pulled" in area:
		area.is_pulled = false
	pass # Replace with function body.

func activate_magnet():
	Global.is_magenting = true
	Global.num_magnets -= 1
	print("المغناطيس بدأ!")
	
	# انتظر 10 ثواني مرة واحدة فقط
	await get_tree().create_timer(10.0).timeout
	
	Global.is_magenting = false
	print("المغناطيس انتهى!")
func activate_shield():
	$Shield_Area.visible = true
	$Shield_Area/CollisionShape2D.disabled = false
	Global.num_sheild -= 1
	
	await get_tree().create_timer(40.0).timeout
	
	$Shield_Area.visible = false
	$Shield_Area/CollisionShape2D.disabled = true
