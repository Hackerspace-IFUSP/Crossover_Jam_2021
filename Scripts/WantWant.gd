# Created on September 24th, 2021 by Ícaro Freire 
# https://github.com/ivfreire

# Mecânicas do WantWant

extends Enemy

onready var sight = get_node('Sight')

func _ready():
	pass

func _physics_process(delta):
	if self.state == State.IDLING: self.detect(self.player)
	if self.state == State.FLYING:
		self.acceleration = self.position.direction_to(self.player.global_position) * 1000 - 1 * self.velocity
	pass

func detect(object):
	var bodies = sight.get_overlapping_bodies()
	for body in bodies:
		if body == object:
			self.fly(self.player.global_position)
			$Timer.start()
			
	pass

func fly(to: Vector2):
	self.state = State.FLYING
	var radial = self.position.direction_to(to)
	self.velocity = Vector2(-radial.y ,radial.x) * speed
	pass


func _on_Timer_timeout():
	self.state = State.IDLING
	yield(get_tree().create_timer(1.0), "timeout")
