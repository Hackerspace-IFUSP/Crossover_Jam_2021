extends StaticBody2D


func _ready():
	pass


func _on_hurtbox_area_entered(area):
	if area.is_in_group("bomb"):
		queue_free()
