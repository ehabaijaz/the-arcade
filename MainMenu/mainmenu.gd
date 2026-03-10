extends Control


func _on_pong_pressed() -> void:
	get_tree().change_scene_to_file("res://Pong/level.tscn")


func _on_brick_pressed() -> void:
	get_tree().change_scene_to_file("res://BrickScenes/brick_level.tscn")
