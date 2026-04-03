extends Area2D
func _input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:

	if event is InputEventMouseButton:
		
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$"../UI/Shop_UI".visible = true
			$"../UI/Shop_UI/sellorbuy".visible = true
			$"../UI/Shop_UI/TileMap2".visible = false
			$"../UI/Shop_UI/TileMap4".visible = false
