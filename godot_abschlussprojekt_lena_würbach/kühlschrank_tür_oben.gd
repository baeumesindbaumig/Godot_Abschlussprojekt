extends MeshInstance3D

@export var open_rotation = deg_to_rad(100)  # Wie weit sich die Tür öffnet
@export var closed_rotation = deg_to_rad(0)  # Winkel der geschlossenen Tür

var door_open = false  # Tür-Zustand

func _input(event):
	print("E wurde gedrückt!")
	if event.is_action_pressed("interact"):  # "E" drücken
		toggle_door()

func toggle_door():
	door_open = !door_open  # Zustand wechseln
	var target_rotation = open_rotation if door_open else closed_rotation
	
	# Animierte Rotation
	var tween = get_tree().create_tween()
	tween.tween_property(self, "rotation:y", target_rotation, 0.5)
