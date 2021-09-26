extends Node

onready var animation = $AnimationPlayer
var opened : bool = false

func _ready():
	if !GAME.boat: 
		$UI/TopBar/Icons/PowerUp1.hide()
	if !GAME.dash:
		$UI/TopBar/Icons/PowerUp2.hide()
	if !GAME.laser:
		$UI/TopBar/Icons/PowerUp3.hide()
	if !GAME.patch:
		$UI/TopBar/Icons/PowerUp4.hide()
	if !GAME.bomb:
		$UI/TopBar/Icons/PowerUp5.hide()


func _on_OpenMenu_pressed():
	if not opened:
		animation.play("Open")
		
	if opened:
		animation.play("Close")
	
	opened = !opened
