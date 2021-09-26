extends Node2D


func _ready():
	pass


func _on_button_body_entered(body):
	if body.name == "Player":
		if GAME.patch == true:
			$anim.play("event")
			yield($anim,"animation_finished")
			if has_node("laser"):
				$laser.queue_free()
