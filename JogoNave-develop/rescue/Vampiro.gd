extends KinematicBody2D

onready var alvo = get_node("/root/Main/Player")
onready var heart_scene = preload("res://Combustivel.tscn")

var dpers = 1000
var speed = 100
var controledano = 0
var vida = 20

func _ready():
	pass

func _physics_process(delta):
	var dist = position.distance_to(alvo.position)
	if dist < dpers:
		var vel = (alvo.position - position).normalized()
		move_and_slide(vel*speed)
	if dist <= 57:
		$Morcego.animation = "walk"
		$morte.start()
		if controledano == 0:
			alvo.tomadanoV()
			controledano=1

func tomar_dano_alien(): 
	vida -= 10
	if vida <= 0:
		morte()

func morte():
	$Morcego.animation = "walk"
	$morte.start()  
	queue_free()  
	spawn_heart()
	
	
func _on_morte_timeout():
	morte()

func spawn_heart():
	var heart_instance = heart_scene.instance()
	heart_instance.position = position  # Define a posição do coração na posição do vampiro
	get_parent().add_child(heart_instance)
