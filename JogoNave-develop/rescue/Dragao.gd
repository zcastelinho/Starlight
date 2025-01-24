extends KinematicBody2D

onready var alvo = get_node("/root/Main/Player")
onready var poder = preload("res://explosao.tscn")

var dpers = 1000
var speed = 100
var controledano = 0
var vida = 40

func _ready():
	pass

func _physics_process(delta):
	var dist = position.distance_to(alvo.position)
	if dist < dpers:
		var vel = (alvo.position - position).normalized()
		move_and_slide(vel*speed)
	if dist <= 57:
		$dragon.animation = "walk"
		$morte.start()
		if controledano == 0:
			alvo.tomadanoD()
			controledano=1

func tomar_dano_alien(): 
	vida -= 10
	if vida <= 0:
		morte()


func morte():
	$dragon.animation = "walk"
	$morte.start()  
	queue_free()  
	chamasmo()
	
func _on_morte_timeout():
	morte()

func chamasmo():
	var chamasmospa = poder.instance()
	chamasmospa.position = position  # Define a posição do coração na posição do vampiro
	get_parent().add_child(chamasmospa)
