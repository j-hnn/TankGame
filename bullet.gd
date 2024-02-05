extends Area2D

var velocity = 50
var direction = Vector2.ZERO

func _physics_process(delta):
	self.global_position += velocity
	
	await get_tree().create_timer(2.5).timeout
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
