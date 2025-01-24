extends Node2D

func _ready():
	pass

func _on_geracao_timeout():
	$geracao.start()
	var astrosur = preload("res://asteroide.tscn").instance()
	astrosur.position.y = rand_range(2,1100)
	astrosur.position.x = rand_range(2,1100)
	add_child(astrosur)
	
	var cura = preload("res://recuperador.tscn").instance()
	cura.position.y = rand_range(2,1100)
	cura.position.x = rand_range(2,1100)
	add_child(cura)

func _on_dragao_timeout():
	$dragao.start()
	var dragaoapa = preload("res://navegran.tscn").instance()
	dragaoapa.position.y = rand_range(2,1100)
	dragaoapa.position.x = 2
	add_child(dragaoapa)
	
	var gran = preload("res://navegran.tscn").instance()
	gran.position.y = rand_range(2,1100)
	gran.position.x = 2
	add_child(gran)
	
func _on_sangue_timeout():
	$sangue.start()
	var vampirosur = preload("res://naveatir.tscn").instance()
	vampirosur.position.y = rand_range(2,1100)
	vampirosur.position.x = 1100
	add_child(vampirosur)


func _on_Timer_timeout():
	get_tree().change_scene("res://victori.tscn")
