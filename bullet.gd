extends CharacterBody2D

var speed = 500

func _ready():
	await get_tree().create_timer(5).timeout
	queue_free()
	
func _physics_process(delta):
	velocity = transform.x * speed
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
