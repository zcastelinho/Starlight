extends Area2D


func _ready():
	pass 
	
func _on_Astronauta_body_entered(body):
	if body.name == "Player":
		body.salvar()
		queue_free()

func _on_deletec_timeout():
	queue_free()
