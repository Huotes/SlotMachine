extends Control

signal handle_pulled

onready var tween  := $Tween
onready var handle := $Handle
onready var winner := $Winner

##funcao para puxar a alavanca e a magica acontecer

func _on_Handle_pressed():
	tween.interpolate_property(handle,"rect_rotation",0,-12,0.2,Tween.TRANS_BOUNCE,Tween.EASE_IN_OUT)
	tween.interpolate_property(handle,"rect_rotation",-12,0,0.5,Tween.TRANS_BOUNCE,Tween.EASE_OUT,0.65)
	tween.start()
	emit_signal("handle_pulled")
	winner.hide()
	handle.disabled = true
	GameController.reset_points()
	
func luck() -> void:
	if GameController.POINTS < 3:
		return

	handle.disabled = false
	
	if GameController.DIAMOND == 2:
		has_won(100)
	elif GameController.DIAMOND == 3:
		has_won(200)
	if GameController.CROW == 2:
		has_won(300)
	elif GameController.CROW == 3:
		has_won(400)
	if GameController.WATERMELON == 2:
		has_won(500)
	elif GameController.WATERMELON == 3:
		has_won(600)
	if GameController.BAR == 2:
		has_won(700)
	elif GameController.BAR == 3:
		has_won(800)
	if GameController.SEVEN == 2:
		has_won(1000)
	elif GameController.SEVEN == 3:
		has_won(1500)
	if GameController.CHERRY == 2:
		has_won(2000)
	elif GameController.CHERRY == 3:
		has_won(3000)
	if GameController.LEMON == 2:
		has_won(4000)
	elif GameController.LEMON == 3:
		has_won(5000)
	
func has_won(value: int) -> void:
	winner.show()
	winner.text = str("Você ganhou: ", value)
