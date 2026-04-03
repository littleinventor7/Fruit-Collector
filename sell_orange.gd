extends Area2D
func _input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# Check if the event is a mouse button click
	if event is InputEventMouseButton:
		# Check if it's the left button and if it was pressed
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed  :
			if Global.num_orange >=1:
				Global.num_orange -= 1
				Global.coins += 3
func _process(delta: float) -> void:
	$"../tt".text = str(Global.num_orange)
	pass
