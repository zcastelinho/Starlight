extends Node2D

func _ready():
	pass
	

func _on_gerac_timeout():
	$gerac.start()
	var alienapar = preload("res://alien.tscn").instance()
	alienapar.position.y = rand_range(2,1100)
	alienapar.position.x = 2
	add_child(alienapar)
	
	var alienapal = preload("res://alien.tscn").instance()
	alienapal.position.y = rand_range(2,1100)
	alienapal.position.x = 1100
	add_child(alienapal)

func _on_geracao_timeout():
	$geracao.start()
	var astrosur = preload("res://Astronauta.tscn").instance()
	astrosur.position.y = rand_range(2,1100)
	astrosur.position.x = rand_range(2,1100)
	add_child(astrosur)

func _on_dragao_timeout():
	$dragao.start()
	var dragaoapa = preload("res://Dragao.tscn").instance()
	dragaoapa.position.y = rand_range(2,1100)
	dragaoapa.position.x = 2
	add_child(dragaoapa)
	
func _on_sangue_timeout():
	$sangue.start()
	var vampirosur = preload("res://Vampiro.tscn").instance()
	vampirosur.position.y = rand_range(2,1100)
	vampirosur.position.x = 1100
	add_child(vampirosur)


func _on_Timer_timeout():
	get_tree().change_scene("res://menu2.tscn")
