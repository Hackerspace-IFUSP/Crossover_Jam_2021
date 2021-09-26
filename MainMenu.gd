extends ColorRect

func _ready():
	Music.get_node("AudioStreamPlayer").playing = false


func _on_TextureButton_pressed():
	Music.get_node("AudioStreamPlayer").playing = true
	get_tree().change_scene("res://Maps/Map1.tscn")

