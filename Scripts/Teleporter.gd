#A code by: KeichiTS - 2021

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
export(int) var map 
export var spawn_position = Vector2()

func _ready():
	pass



func _on_Teleporter_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.name == "Player":
		if map == 0:
			GAME.map1 = spawn_position
		
		elif map == 1:
			GAME.map2 = spawn_position
			
		elif map == 2:
			GAME.map3 = spawn_position
			
		elif map == 3:
			GAME.map4 = spawn_position
			
		elif map == 4:
			GAME.map5 = spawn_position

		elif map == 5:
			GAME.map6 = spawn_position

		elif map == 6:
			GAME.map7 = spawn_position
			
		elif map == 7:
			GAME.map8 = spawn_position

		elif map == 8:
			GAME.map9 = spawn_position
			
		elif map == 9:
			GAME.map10 = spawn_position
			
		elif map == 10:
			GAME.map11 = spawn_position
			
			
		get_tree().change_scene(maps[choose_map])
		


###################################################
#     ~ It ain't much, but it's honest work ~     #
###################################################
##        #####################################   #
##          #############################         #
####            ######################            #
#####            #####           #                #
#######                                         ###
#########  #                                   ####
###########                              ## #######
#########      ###               ###       ########
#########     # ###             #####       #######
########      #####             ####         ######
########       ##                ##          ######
#######               ##                    #######
#######  ##           ####            ##      #####
####### #####        ########       #######    ####
########               #####                    ###
#########                                       ###
##########                                       ##
#########                                         #
###################################################
#               ~ KeichiTS - 2021 ~               #
###################################################
