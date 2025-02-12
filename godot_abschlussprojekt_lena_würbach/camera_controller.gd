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
	
	#--------------------------------------------------
extends Node3D

@onready var raycast = $Camera3D/RayCast3D  # Pfad zum RayCast
@onready var fridge_door = $"../Kühlschrank/Kühlschrank_Tür"  # Die Tür-Node

var door_open = false  # Zustand der Tür
var open_rotation = deg_to_rad(100)  # Wie weit sich die Tür öffnet
var closed_rotation = deg_to_rad(0)  # Geschlossene Position

func _input(event):
	if event.is_action_pressed("interact") and raycast.is_colliding():
		var target = raycast.get_collider()  # Das Objekt, auf das der RayCast zeigt
		
		if target.name == "Tür":  # Prüft, ob es die Kühlschranktür ist
			toggle_door()

func toggle_door():
	door_open = !door_open  # Tür-Zustand wechseln
	var target_rotation = open_rotation if door_open else closed_rotation
	
	# Die Tür mit einer kleinen Animation bewegen
	var tween = get_tree().create_tween()
	tween.tween_property(fridge_door, "rotation:y", target_rotation, 0.5)

	
