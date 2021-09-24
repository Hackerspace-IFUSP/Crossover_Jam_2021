extends Area2D

var maps = [
	"res://Maps/Map1.tscn",
	"res://Maps/Map2.tscn",
	"res://Maps/Map3.tscn",
	"res://Maps/Map4.tscn",
	"res://Maps/Map5.tscn",
	"res://Maps/Map6.tscn",
	"res://Maps/Map7.tscn",
	"res://Maps/Map8.tscn",
	"res://Maps/Map9.tscn",
	"res://Maps/Map10.tscn",
	"res://Maps/Map11.tscn"
]

enum { MAP1 , MAP2 , MAP3 , MAP4 , MAP5 , MAP6 , MAP7 , MAP8 , MAP9 , MAP10 , MAP11 , MAP12 }
export var choose_map = MAP1

func _ready():
	pass



func _on_Teleporter_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.name == "Player":
		get_tree().change_scene(maps[choose_map])
