extends Area2D


func _ready():
	pass



func _on_killer_spot_body_entered(body):
	if body.is_in_group("enemy"):
		body.queue_free()
