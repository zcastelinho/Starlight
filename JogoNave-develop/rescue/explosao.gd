extends Area2D

func _on_explosao_body_entered(body):
	if body.name != "Player" and "Laser":
		queue_free()



func _on_Timer_timeout():
	queue_free()
