extends Area2D
		
func _input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# Check if the event is a mouse button click
	if event is InputEventMouseButton:
		# Check if it's the left button and if it was pressed
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed  :
			Global.purple_selected = 1
			Global.yellow_selected = 0
			Global.green_selected = 0
			Global.pink_selected = 0
			Global.brown_selected = 0
