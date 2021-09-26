extends ViewportContainer

func _ready():
	var world = get_viewport().find_world_2d()
	$Viewport.world_2d = world
