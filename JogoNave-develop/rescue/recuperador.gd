extends Area2D


func _ready():
	pass 


func _on_recuperador_body_entered(body):
	if body.name == "Player2":
		body.carregar()
		queue_free()

func _on_deletec_timeout():
	queue_free()



