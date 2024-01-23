extends Node2D

@export var speed = 5
@export var health = 100
@export var reload = 2

var can_fire = true
var x_direction = 0
var y_direction = 0

@onready var muzzle = $muzzle


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("a"):
		global_position.x -= speed
	if Input.is_action_pressed("d"):
		global_position.x += speed
	if Input.is_action_pressed("s"):
		global_position.y += speed
	if Input.is_action_pressed("w"):
		global_position.y -= speed
	if Input.is_action_pressed("fire"):
		if can_fire:
			fire_bullet()

func fire_bullet():
	can_fire = false
	print("fire")
	var bullet = load("res://bullet.tscn")
	bullet.global_position = Vector2(muzzle.global_positon.x, muzzle.global_position.y)
	await get_tree().create_timer(reload).timeout
