	#extends CharacterBody3D


	#const SPEED = 5.0
	#const JUMP_VELOCITY = 4.5


	#func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)

	#move_and_slide()

extends CharacterBody3D

@export var speed: float = 4.0
@export var sensitivity: float = 0.002

var gravity: float = -9.8
var velocity_y: float = 0.0

@onready var camera = $Camera3D

	# Funktion für Mausbewegung
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * sensitivity)
		#camera.rotate_x(-event.relative.y * sensitivity)
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x - event.relative.y * sensitivity, -90, 90)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))


func _process(delta):
	# Bewegung mit WASD
	var input_dir = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		input_dir -= transform.basis.z
	if Input.is_action_pressed("move_backward"):
		input_dir += transform.basis.z
	if Input.is_action_pressed("move_left"):
		input_dir -= transform.basis.x
	if Input.is_action_pressed("move_right"):
		input_dir += transform.basis.x
		
		# Debug: Zeige die Rihtung
	print("Input Direction: ", input_dir)

	# Normalisieren, damit diagonale Bewegung nicht schneller ist
	input_dir = input_dir.normalized() * speed

	# Einfache Schwerkraft (optional)
	velocity_y += gravity * delta

	# Update der Y-Komponente der Geschwindigkeit / Geschw. (velocity) in alle Richtungen (xyz) berechnen)
	velocity = Vector3(input_dir.x, velocity_y, input_dir.z)
	
	# Bewege den Character
	move_and_slide()

	# Funktion für die Initialisierung
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # Mauszeiger ausblenden & fixieren
	
