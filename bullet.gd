extends Area2D

var velocity = Vector2(500, 0)

func _physics_process(delta):
	self.position += velocity * delta
	await get_tree().create_timer(5).timeout
	queue_free()
