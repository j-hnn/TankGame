extends CharacterBody2D

var health = 100

func _process(delta):
	if health == 0:
		queue_free()


func _on_area_2d_body_entered(body):
	health -= 10
	body.queue_free()
	print("hit")


func _on_area_2d_area_entered(area):
	health -= 10
	area.queue_free()
	print("hit")
