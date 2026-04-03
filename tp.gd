extends Area2D
@export var path:String
@export var level:int
@export var fruitsinlevel:int
func _ready() -> void:
	Global.fruits = fruitsinlevel
func _physics_process(delta: float) -> void:
	fruitsinlevel = Global.fruits
	$Control/number.text =  str(fruitsinlevel)
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and fruitsinlevel <= 0:
		$StaticBody2D.disable_mode = true
		$StaticBody2D/CollisionPolygon2D.disabled= true
		Global.level = level
		get_tree().change_scene_to_file(path)
	elif body.is_in_group("player") and fruitsinlevel > 0:
		$Control.visible = true
		await get_tree().create_timer(0.55).timeout
		$Control.visible = false
	pass # Replace with function body.
