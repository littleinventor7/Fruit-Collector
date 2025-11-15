extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://level_1.tscn")
	pass


func _on_button_2_pressed() -> void:
	get_tree().quit()
	pass


func _on_button_3_pressed() -> void:      
	get_tree().change_scene_to_file("res://level_20.tscn")
	pass        


func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://level_20.tscn")
	pass
