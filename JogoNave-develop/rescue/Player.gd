extends KinematicBody2D


var speed = 200
var vel = Vector2()
var combustivel = 100

##momento 2
var balap = preload("res://Laser.tscn")
var lado = 1
##momento 2

signal morreu
onready var ui = get_node("/root/Main/HUD")

func _ready():
	$Nave.play()
	
# warning-ignore:unused_argument
func _physics_process(delta):
	vel.x = 0
	vel.y = 0
	
	if Input.is_action_pressed("up"):
		vel.y -= speed
	if Input.is_action_pressed("down"):
		vel.y += speed
	if Input.is_action_pressed("right"):
		vel.x += speed
		lado = 1
	if Input.is_action_pressed("left"):
		vel.x -= speed
		lado = -1
	if Input.is_action_pressed("recumecar"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("atira"):
		$atira.play()
		var novabala = balap.instance()
		novabala.position.x = position.x+4
		novabala.position.y = position.y+4
		novabala.z_index = -1
		novabala.setlado(lado)
		get_tree().current_scene.add_child(novabala)
		
	
	vel = move_and_slide(vel, Vector2.UP)
	
	if vel.x < 0:
		$Nave.flip_h = true
	elif vel.x > 0:
		$Nave.flip_h = false
		
		
func morre():
	emit_signal("morreu")
	
func tomadano():
	combustivel -= 10
	if combustivel < 0:
		morre()
		get_tree().change_scene("res://Morte.tscn")
	ui.alterarcombustivel(combustivel)

func salvar():
	ui.tomadano()
	
func tomadanoD():
	combustivel -= 40
	if combustivel < 0:
		morre()
		get_tree().change_scene("res://Morte.tscn")
	ui.alterarcombustivel(combustivel)

func salvarD():
	ui.tomadano()
	
func tomadanoV():
	combustivel -= 20
	if combustivel < 0:
		morre()
		get_tree().change_scene("res://Morte.tscn")
	ui.alterarcombustivel(combustivel)

func salvarV():
	ui.tomadano()

func carregar():
	combustivel += 20
	ui.alterarcombustivel(combustivel)

