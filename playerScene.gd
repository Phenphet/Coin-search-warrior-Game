extends CharacterBody2D

var score = 0
var speed = 300
var jump = 400
var gavity = 800
var anm = "idel"

@onready var spite = get_node("AnimatedSprite2D")
func _physics_process(delta):
	var mylabel = $Label
	velocity.x = 0
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("jump") and is_on_floor() :
		velocity.y -= jump
	
	velocity.y += gavity * delta
	
	if velocity.x == 0:
		anm = "idel"
	if velocity.x < 0:
		anm = "run"
		spite.flip_h = true
	if velocity.x > 0:
		anm = "run"
		spite.flip_h = false
	if  velocity.y < 0:
		anm = "jump"	
		
	spite.play(anm)
	mylabel.text = str(score)
	if score == 15:
		get_tree().change_scene_to_file('res://gameOverscene.tscn')
	move_and_slide()
	
func add_coin():
		score += 1
