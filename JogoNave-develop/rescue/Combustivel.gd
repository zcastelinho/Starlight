extends Area2D


func _ready():
	pass 


func _on_Combustivel_body_entered(body):
	if body.name == "Player":
		body.carregar()
		queue_free()

func _on_deletec_timeout():
	queue_free()
