#A code by: KeichiTS - 09/2021

extends Area2D

enum {boat,dash,update,laser,bomb}
export(int, "boat","dash","patch","laser","bomb") var Updates 

func _ready():
	if Updates == 0:
		$Sprite.show()
		$Sprite2.hide()
		$Sprite3.hide()
		$Sprite4.hide()
		$Sprite5.hide()
	if Updates == 1:
		$Sprite.hide()
		$Sprite2.show()
		$Sprite3.hide()
		$Sprite4.hide()
		$Sprite5.hide()
	if Updates == 2:
		$Sprite.hide()
		$Sprite2.hide()
		$Sprite3.show()
		$Sprite4.hide()
		$Sprite5.hide()
	if Updates == 3:
		$Sprite.hide()
		$Sprite2.hide()
		$Sprite3.hide()
		$Sprite4.show()
		$Sprite5.hide()
	if Updates == 4:
		$Sprite.hide()
		$Sprite2.hide()
		$Sprite3.hide()
		$Sprite4.hide()
		$Sprite5.show()
		
	if Updates == 0 and GAME.boat == true:
		queue_free()
	if Updates == 1 and GAME.dash == true:
		queue_free()
	if Updates == 2 and GAME.patch == true:
		queue_free()
	if Updates == 3 and GAME.laser == true:
		queue_free()
	if Updates == 4 and GAME.bomb == true:
		queue_free()

func _on_powerups_body_entered(body):
	if body.name == "Player":
		if Updates == 0:
			body.boat = true
		if Updates == 1:
			body.dash = true 
		if Updates == 2:
			body.patch = true 
		if Updates == 3:
			body.laser = true
		if Updates == 4:
			body.bomb = true 
				
	
		queue_free()
		
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
