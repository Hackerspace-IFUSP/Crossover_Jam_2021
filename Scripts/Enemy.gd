# Created on September 22th, 2021 by Ícaro Freire 
# https://github.com/ivfreire

# Classe que contém variáveis e métodos comuns a todos os inimigos

extends KinematicBody2D
class_name Enemy


# Define os estados que os inimigos podem estar: parado, patrulha, perseguição ou correndo, pulando
enum State { IDLING, PATROLLING, CATCHING, SPRINTING, JUMPING, FLYING }

export var speed: float = 100
export var moves = []						# array de Vector2 descrevendo o deslocamento da patrulha 


var acceleration: Vector2 = Vector2(0, 0)
export var velocity: Vector2 = Vector2(0, 0)

export var state = State.SPRINTING			# estado
var patrol: = [ 0, 1, Vector2() ]			# ( pontoAtual, sentido, proximaPosicao )

onready var player = get_parent().get_node('Player')


func _ready():
	if self.state == State.PATROLLING: self.patrol()
	pass

func _physics_process(delta):
	self.move(delta)
	pass

# Lógica de movimentação
func move(delta):
	if self.state == State.PATROLLING: self.patrolling(delta)
	if self.state == State.CATCHING: self.catching(delta)
	
	self.velocity += self.acceleration * delta
	
	var collision = move_and_collide(self.velocity * delta)
	if collision:
		self.velocity = velocity.slide(collision.normal)
		
	if self.state != State.IDLING:
		self.look_at(self.position + self.velocity)
	
	pass

# Prepara entidade para começar a patrulhar
func patrol():
	patrol[2] = position + moves[0]
	self.state = State.PATROLLING
	pass

# Lógica de patrulha		TODO: deixar mais eficiente
func patrolling(delta):
	if position.distance_to(patrol[2]) < delta * speed:
		var next = patrol[0] + patrol[1]
		if next == moves.size():
			next -= 1
			patrol[1] = -1
		if next < 0:
			next = 0
			patrol[1] = 1
		patrol[0] = next
		patrol[2] = position + moves[next] * patrol[1]
	self.velocity = position.direction_to(patrol[2]) * speed
	pass

# Lógica de perseguição
func catching(delta):
	self.velocity = self.position.direction_to(self.player.global_position) * speed
	pass

func catch():
	self.state = State.CATCHING
	pass

# Faz o inimigo correr
func sprint(velocity: Vector2):
	self.velocity = velocity
	self.state = State.SPRINTING
	pass
