extends Node3D

@onready var raycast = $Camera3D/RayCast3D  # Pfad zum RayCast
@onready var fridge_door = $"../Kühlschrank/Kühlschrank_Tür"  # Tür-Node

var door_open = false  # Zustand der Tür
var open_rotation = deg_to_rad(100)  # wie weit sich die Tür öffnet
var closed_rotation = deg_to_rad(0)  # geschlossene Position

func _input(event):
	if event.is_action_pressed("interact") and raycast.is_colliding():
		var target = raycast.get_collider()  # Objekt, auf das der RayCast zeigt
		
		if target.name == "Tür":  # prüft, ob es die Kühlschranktür ist
			toggle_door()

func toggle_door():
	door_open = !door_open  # Tür-Zustand wechseln
	var target_rotation = open_rotation if door_open else closed_rotation
	
	# Tür mit einer kleinen Animation bewegen
	var tween = get_tree().create_tween()
	tween.tween_property(fridge_door, "rotation:y", target_rotation, 0.5)

	
