#extends Node3D

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

#--------------------------------------------------------------------------

#extends Node3D

#@export var rotation_speed: float = 1.5  # Geschwindigkeit der Drehung

#func _process(delta):
	#var input := 0.0
	#if Input.is_action_pressed("turn_left"):  # Pfeil links oder A
		#input -= 1
	#if Input.is_action_pressed("turn_right"):  # Pfeil rechts oder D
		#input += 1

	# Kamera um die Y-Achse drehen
	#rotate_y(input * rotation_speed * delta)
	
