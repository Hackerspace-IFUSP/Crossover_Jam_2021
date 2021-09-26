#A Code by: KeichiTS - 09.2021

extends KinematicBody2D

var velocity = Vector2.ZERO

export var speed = 50
export var dash_multiplier = 50

var dash_status = false

var boat = GAME.boat
var dash = GAME.dash
var laser = GAME.laser
var patch = GAME.patch
var bomb = GAME.bomb 

#var changes = false 

var laser_count = true
var bomb_count = true 

var pull_bomb = preload("res://map_objects/bomb.tscn")

var bomb_status = true

func _ready():
	pass

func _physics_process(delta):
	
	##Funções do body 
	move(delta)
	
	##Aplicar mudanças:
#	if changes == true:
	upgrades()
	
	
	#Funções Dash
	dash()
	


	##Funções do laser
	$laser.look_at(get_global_mouse_position())
	laser()

	##Funções do granadeiro
	bomb()

	

func move(val):

#### Faz o bixo andar

	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
		
	if input_vector != Vector2.ZERO:
		velocity += input_vector
		velocity = velocity * val * speed

	else:
		velocity = Vector2.ZERO  
		
	move_and_collide(velocity)
	
####

#### Faz o bixo olhar

	if input_vector.x > 0 and input_vector.y == 0:
		rotation = 0
		
	elif input_vector.x < 0 and input_vector.y == 0:
		rotation = PI
			
	elif input_vector.x == 0 and input_vector.y > 0:
		rotation = PI/2
			
	elif input_vector.x == 0 and input_vector.y < 0:
		rotation = -PI/2
			
	elif input_vector.x > 0 and input_vector.y > 0:
		rotation = PI/4
		
	elif input_vector.x > 0 and input_vector.y < 0:
		rotation = -PI/4

	elif input_vector.x < 0 and input_vector.y > 0:
		rotation = 3 * PI / 4
			
	elif input_vector.x < 0  and input_vector.y < 0:
		rotation = 4 * PI / 3

####


func dash():
	if Input.is_action_just_pressed("dash") and dash_status == true:
		set_collision_mask_bit( 1 , false )
		set_collision_mask_bit( 6, false )
		$dash_sfx.play()
		$hurtbox.set_collision_mask_bit( 1 , false)
		move_and_collide( velocity * dash_multiplier )
		dash_status = false
		modulate.a = .5
		$invincibility_timer.start()
		$dash_timer.start()


func laser():
	if Input.is_action_just_pressed("shoot") and laser == true:
		$laser_sfx.play()
		$laser/anim.play("event")
	
	elif Input.is_action_just_released("shoot") and laser == true: 
		$laser/anim.play("event2")

func bomb():
	if Input.is_action_just_pressed("set_bomb") and bomb_status == true and bomb == true:
		var pull = pull_bomb.instance()
		pull.global_position = $bomb_position.global_position
		get_parent().add_child(pull)
		bomb_status = false 
		$pull_bomb_sfx.play()
		$bomb_timer.start()

func upgrades():
	if boat == true:
		$upgrade_sfx.play()
		set_collision_mask_bit( 3 , false )
		GAME.boat = true
		$boat/boat.show()
		boat = false
		
	elif patch == true:
		$upgrade_sfx.play()
		set_collision_mask_bit( 4 , false )
		GAME.patch = true
		$patch/patch.show()
		patch = false

	elif dash == true:
		$upgrade_sfx.play()
		GAME.dash = true
		dash_status = true ##faz ativar a função do dash pela primeira vez, não precis fazer mais nada 
		$dash/dash.show()
		dash = false
		
	elif laser == true and laser_count == true:
		#$upgrade_sfx.play()
		$light.show()
		GAME.laser = true 
		$laser/Laser.show()
		laser_count = false

	elif bomb == true and bomb_status == true:
		#$upgrade_sfx.play()
		GAME.bomb = true
		bomb_status = true
		$bomb/bomb.show()
		bomb_count = false 
		
		
#	changes = false


####Timers do dash

func _on_dash_timer_timeout():
	dash_status = true


func _on_invincibility_timer_timeout():
	set_collision_mask_bit( 1 , true )
	set_collision_mask_bit( 6, true )
	$hurtbox.set_collision_mask_bit( 1 , true)
	modulate.a = 1


func _on_bomb_timer_timeout():
	bomb_status = true 



func _on_hurtbox_area_entered(area):
	if area.is_in_group("enemy"):
		modulate.a = 0 
		$shape.queue_free()
		$hurtbox/shape.queue_free()
		if get_parent().has_node("transition"):
			get_parent().get_node("transition").play("event")
			
		$died_sfx.play()
		yield($died_sfx,"finished")
		
		get_tree().reload_current_scene()


func _on_hurtbox_body_entered(body):
	if body.is_in_group("enemy"):

		modulate.a = 0 
		$shape.queue_free()
		$hurtbox/shape.queue_free()
		if get_parent().has_node("transition"):
			get_parent().get_node("transition").play("event")
		
		$died_sfx.play()
		yield($died_sfx,"finished")
		get_tree().reload_current_scene()


###

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



