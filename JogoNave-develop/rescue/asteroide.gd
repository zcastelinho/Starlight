extends Area2D


func _ready():
	pass 
	
func _on_asteroide_body_entered(body):
	if body.name == "Player2":
		body.salvar()
		queue_free()

func _on_deletec_timeout():
	queue_free()


