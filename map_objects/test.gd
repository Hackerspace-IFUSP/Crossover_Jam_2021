extends Node2D


func _ready():
	$AnimationPlayer.play("event")
	
	
func hello():
	print("world hello")


func _on_ColorRect_mouse_entered():
	$AnimationPlayer.play("event2")



func _on_ColorRect_mouse_exited():
	$AnimationPlayer.play("event")
