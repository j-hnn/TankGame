extends Area2D

func _process(delta):
	await get_tree().create_timer(5).timeout
	queue_free()

