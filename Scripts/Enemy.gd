# Classe que contém variáveis e métodos comuns a todos os inimigos

extends KinematicBody2D
class_name Enemy

# Define os estados que os inimigos podem estar: parado, patrulha ou ataque
enum State { IDLING, PATROLLING, CATCHING }

export var speed: float = 100
export var moves = []					# array de Vector2 descrevendo o deslocamento da patrulha 

var velocity: Vector2 = Vector2(0, 0)
var state = State.PATROLLING			# estado
var patrol: = [ 0, 1, Vector2() ]		# ( pontoAtual, sentido, proximaPosicao )

func _ready():
	if self.state == State.PATROLLING: self.startPatrolling()
	pass

func _physics_process(delta):
	move(delta)
	pass

# Lógica de movimentação
func move(delta):
	if self.state == State.PATROLLING: patrolling(delta)
	move_and_slide(velocity, Vector2.UP)
	pass

# Prepara entidade para começar a patrulhar
func startPatrolling():
	patrol[2] = position + moves[0]
	self.state = State.PATROLLING
	pass

# Lógica de patrulhamentos		TODO: deixar mais eficiente
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
	
	velocity = position.direction_to(patrol[2]) * speed
	
	pass






