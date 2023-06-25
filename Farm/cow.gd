extends KinematicBody2D


var MAX_SPEED= 0.04
var velocity= Vector2.ZERO
var state= 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	state = int(rand_range(0, 5))
	print('state: '+ str(state))

func _physics_process(delta):
	match state:
		0: move_none()
		1: move_up()
		2: move_down()
		3: move_left()
		4: move_right()
	move_and_slide(velocity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	state = int(rand_range(0, 5)) # Replace with function body.
	print('state: '+ str(state))
	$Timer.start()

func move_none():
	$anima_cow.play("default")
	velocity.x= 0
	velocity.y= 0
	
func move_up():
	$anima_cow.play("walk_right")
	velocity.x= 0
	#velocity.y= 0
	velocity.y -= MAX_SPEED

func move_down():
	$anima_cow.play("walk_left")
	velocity.x= 0
	#velocity.y= 0
	velocity.y += MAX_SPEED
	
func move_left():
	$anima_cow.play("walk_left")
	#velocity.x= 0
	velocity.y= 0
	velocity.x -= MAX_SPEED
	
func move_right():
	$anima_cow.play("walk_right")
	#velocity.x= 0
	velocity.y= 0
	velocity.x += MAX_SPEED


func _on_Timer_ready():
	pass# Replace with function body.
