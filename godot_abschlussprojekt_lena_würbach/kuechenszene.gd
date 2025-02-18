extends Node

func _input(event):
	if event.is_action_pressed("ui_escape"):
		get_tree().change_scene_to_file("res://Startszene.tscn")
