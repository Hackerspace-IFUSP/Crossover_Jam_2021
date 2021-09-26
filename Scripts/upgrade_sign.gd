extends StaticBody2D

export(int, "boat", "dash", "patch", "laser", "bomb") var icon

func _ready():
	if icon == 0:
		$boat.show()
	elif icon == 1:
		$dash.show()
	elif icon == 2:
		$patch.show()
	elif icon == 3:
		$laser.show()
	elif icon == 4:
		$bomb.show()
