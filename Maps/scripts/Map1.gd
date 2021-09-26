# A code by: KeichiTS - 09.2021 
extends Node2D


func _ready():
	if self.name == "Map1":
		$Player.position = GAME.map1
	elif self.name == "Map2":
		$Player.position = GAME.map2
		GAME.map3 = Vector2(128,448)
		GAME.map5 = Vector2(1235,135) 
	elif self.name == "Map3":
		GAME.map2 = Vector2(1300,1750)
		GAME.map4 = Vector2(825,125)
		$Player.position = GAME.map3 
	elif self.name == "Map4":
		GAME.map5 = Vector2(1320,500)
		$Player.position = GAME.map4
	elif self.name == "Map5":
		$Player.position = GAME.map5 
		GAME.map2 = Vector2(650,3700)
	elif self.name == "Map6":
		$Player.position = GAME.map6 
		GAME.map2 = Vector2(-1000,450)
	elif self.name == "Map7":
		$Player.position = GAME.map7 
	elif self.name == "Map8":
		$Player.position = GAME.map8 
	elif self.name == "Map9":
		GAME.map10 = Vector2(150,525)
		$Player.position = GAME.map9 
	elif self.name == "Map10":
		$Player.position = GAME.map10 
		GAME.map6 = Vector2(-600,500)
	elif self.name == "Map11":
		$Player.position = GAME.map11
		
		
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
