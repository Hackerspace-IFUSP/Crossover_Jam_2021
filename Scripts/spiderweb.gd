extends StaticBody2D


func _ready():
	pass


func _on_hitbox_area_entered(area):
	if area.is_in_group("laser"):
		print("pelo amor de deus")
		queue_free()

