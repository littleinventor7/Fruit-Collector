extends Area2D
var b= 1
func _input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# Check if the event is a mouse button click
	if event is InputEventMouseButton:
		# Check if it's the left button and if it was pressed
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if b == 1:
				scale = Vector2(1.5,1.5)
				position = Vector2(381,-168.0)
				b = b*-1
			else :
				scale = Vector2(1,1)
				position = Vector2(0,0)
				b = b*-1
			
		  
