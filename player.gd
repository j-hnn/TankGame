extends CharacterBody2D

@export var speed = 300
const rotation_speed = 1.2

var can_fire = true
var player_direction = 1

@onready var muzzle = $muzzle
@onready var trail = $trail


func _physics_process(delta):
	var move_input = Input.get_axis("ui_down", "ui_up")
	var rotation_direction = Input.get_axis("ui_left", "ui_right")
	if Input.is_action_pressed("ui_up"):
		if can_fire:
			smoke_trail()
	velocity = transform.x * move_input * speed
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	
	if Input.is_action_just_pressed("fire"):
		if can_fire:
			fire_bullet()

func fire_bullet():
	print("fire!")
	can_fire = false
	var bullet = load("res://bullet.tscn").instantiate()
	bullet.global_position = Vector2(muzzle.global_position.x, muzzle.global_position.y)
	
	player_direction = Input.get_axis("ui_left", "ui_right")
	bullet.set("velocity", Vector2(500 * player_direction, 0)) 
	get_parent().add_child(bullet)
	await get_tree().create_timer(1).timeout
	can_fire = true
	
func smoke_trail():
	var smoke = load("res://smoke_trail.tscn").instantiate()
	smoke.global_position = Vector2(trail.global_position.x, trail.global_position.y)
	get_parent().add_child(smoke)
