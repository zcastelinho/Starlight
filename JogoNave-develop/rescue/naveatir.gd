extends KinematicBody2D

onready var alvo = get_node("/root/Main2/Player2")

var dpers = 1000
var speed = 125
var controledano = 0
var vida = 50

func _ready():
	pass

func _physics_process(delta):
	var dist = position.distance_to(alvo.position)
	if dist < dpers:
		var vel = (alvo.position - position).normalized()
		move_and_slide(vel*speed)
	if dist <= 57:
		$AnimatedSprite.animation = "default"
		$morte.start()
		if controledano == 0:
			alvo.tomadanoD()
			controledano=1

func tomar_dano_alien(): 
	vida -= 10
	if vida <= 0:
		morte()

func morte():
	queue_free()  
	
func _on_morte_timeout():
	morte()
