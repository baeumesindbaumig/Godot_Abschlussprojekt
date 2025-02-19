extends OmniLight3D  # Falls du ein SpotLight3D hast, ändere das entsprechend

var light_on = true

func _input(event):
	if event.is_action_pressed("toggle_light"):
		light_on = !light_on
		visible = light_on  # Licht an- oder ausschalten
