# Created on September 22th, 2021 by Ícaro Freire 
# https://github.com/ivfreire

# Mecânicas do Miranha

extends Enemy

onready var sight = get_node('Sight')

export var friction: float = 2
export var jumpForce: float = 10

func _ready():
	pass

func _physics_process(delta):
	if self.state == State.IDLING: self.detect(self.player)
	if self.state == State.JUMPING:
		self.acceleration = -self.velocity * friction
		if move_and_collide(self.velocity * delta): self.catch()
	pass

func detect(object):
	var bodies = sight.get_overlapping_bodies()
	for body in bodies:
		if body == object:
			self.jump(player.global_position)
	pass

func jump(to: Vector2):
	self.state = State.JUMPING
	self.velocity = position.direction_to(to) * self.speed * jumpForce
	pass
