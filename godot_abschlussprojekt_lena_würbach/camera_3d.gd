#extends Camera3D


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

#---------------------------------------------------------------------------

	
extends Camera3D

@export var rotation_speed: float = 1.0

func _process(delta):
	if Input.is_action_pressed("turn_left"):
		rotate_y(rotation_speed * delta)
	if Input.is_action_pressed("turn_right"):
		rotate_y(-rotation_speed * delta)
