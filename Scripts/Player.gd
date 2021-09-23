extends KinematicBody2D

var velocity = Vector2.ZERO

export var speed = 50
export var dash_multiplier = 50

var dash_status = false

var boat = false
var dash = false
var laser = false
var patch = false
var bomb = false

var changes = false 


func _ready():
	pass 
	
func _physics_process(delta):
	
	##Funções do body 
	move(delta)
	
	##Aplicar mudanças:
	if changes == true:
		upgrades()
	
	
	#Funções Dash
	dash()
	


	##Funções do laser
	$laser.look_at(get_global_mouse_position())
	laser()

	##Funções do granadeiro


	

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
		move_and_collide( velocity * dash_multiplier )
		dash_status = false
		$invincibility_timer.start()
		$dash_timer.start()


func laser():
	if Input.is_action_just_pressed("shoot"):
		$laser/anim.play("event")
	
	elif Input.is_action_just_released("shoot"):
		$laser/anim.play("event2")


func upgrades():
	if boat == true:
		set_collision_mask_bit( 3 , false )
		boat = false
		
	elif patch == true:
		set_collision_mask_bit( 4 , false )
		patch = false

	elif dash == true:
		dash_status = true ##faz ativar a função do dash pela primeira vez, não precis fazer mais nada 
		
	elif laser == true:
		pass
	
	elif bomb == true:
		pass


	changes = false


####Timers do dash

func _on_dash_timer_timeout():
	dash_status = true


func _on_invincibility_timer_timeout():
	set_collision_mask_bit( 1 , true )

###
