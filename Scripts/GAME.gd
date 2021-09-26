#Code by: KeichiTS 09/2021
extends Node

signal finished

###status dos upgrades 
var boat = false
var dash = true
var laser = false
var patch = false
var bomb = false

###posições do spawn
var map1 = Vector2(675,550)
var map2 = Vector2(1150,845)
var map3 = Vector2(100,450)
var map4 = Vector2(825,150)
var map5 = Vector2(1320,300)
var map6 = Vector2(1030,550)
var map7 = Vector2(450,110)
var map8 = Vector2(1350,1700)
var map9 = Vector2(840,1100)
var map10 = Vector2(1350,370)
var map11 = Vector2(1050,1850)


###updates
var boat_update = false
var dash_update = false 
var laser_update = false 
var patch_update = false 
var bomb_update = false 

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

func reload():
	
	boat = false
	dash = false
	laser = false
	patch = false
	bomb = false
	yield(get_tree().create_timer(1.0), "timeout")
	
