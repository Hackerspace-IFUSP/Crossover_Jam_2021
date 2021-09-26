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
		get_tree().paused = true
		
	if opened:
		animation.play("Close")
		yield( animation , "animation_finished" )
		get_tree().paused = false
	
	opened = !opened


func _on_Push_toggled(button_pressed):
	if $UI/ChangeMenu/Push.pressed:
		$AnimationPlayer.play("MenuOpen")
	if !$UI/ChangeMenu/Push.pressed:
		$AnimationPlayer.play("MenuClose")


func _on_Restart_pressed():
	get_tree().paused = false
	GAME.reload()
	yield(get_tree().create_timer(1.0), "timeout")
	##mandar pro primeiro mapa
	get_tree().change_scene("res://Maps/Map1.tscn")


func _on_Quit_pressed():
	get_tree().quit()
