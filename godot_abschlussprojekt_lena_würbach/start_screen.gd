extends Control

@onready var start_button = $StartButton
@onready var exit_button = $ExitButton
@onready var control_button = $ControlButton

func _ready():
	start_button.pressed.connect(_on_start_pressed)
	exit_button.pressed.connect(_on_exit_pressed)
	control_button.pressed.connect(_on_control_pressed)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Kuechenszene.tscn")
	
func _on_control_pressed():
	get_tree().change_scene_to_file("res://Steuerungsszene.tscn")

func _on_exit_pressed():
	get_tree().quit()
