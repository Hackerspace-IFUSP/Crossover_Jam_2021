extends Area2D

var enemy = preload("res://Scenes/Ciclista.tscn")
var enemy2 = preload("res://Scenes/Capivara.tscn")
export(int, "up", "down") var enemy_orientation
export var enemy_velocity = Vector2(0,1000)
export var enemy_speed = -100
export(float) var spawn_time = 0 
export(int, "ciclista", "capivara") var choose_enemy
func _ready():
	$spawn_timer.wait_time = spawn_time


func _on_spawn_timer_timeout():
	var pull_enemy
	if choose_enemy == 0:
		pull_enemy = enemy.instance()
	elif choose_enemy == 1:
		pull_enemy = enemy2.instance()
	
	if enemy_velocity.y < 0:
		pull_enemy.scale.y *= -1
	
	pull_enemy.global_position = global_position
	pull_enemy.velocity = enemy_velocity
	pull_enemy.speed = enemy_speed
	get_parent().add_child(pull_enemy)
