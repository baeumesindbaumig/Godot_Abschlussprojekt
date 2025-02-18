extends Camera3D

@export var rotation_speed: float = 1.0

func _process(delta):
	if Input.is_action_pressed("turn_left"):
		rotate_y(rotation_speed * delta)
	if Input.is_action_pressed("turn_right"):
		rotate_y(-rotation_speed * delta)
