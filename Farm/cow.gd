extends KinematicBody2D

# default eat idle love walk
var MAX_SPEED= 0.04
var velocity= Vector2.ZERO
var state= 0
var animation_state = "idle"
var leftOrRight = true
onready var anima_cow = get_node("Position2D/anima_cow")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():	
	state = int(rand_range(0, 9))
	print('state: '+ str(state))
	$Timer.start()
	play_animtion()

func _physics_process(delta):
	match state:
		0: move_none()
		1: move_up()
		2: move_down()
		3: move_right()
		4: move_left()
		5: # default
			default()
		6: #eat
			eat()
		7: # love
			love()
		8: chill()
	play_animtion()
	move_and_slide(velocity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func play_animtion():
	if leftOrRight:
		$Position2D.scale.x= 1
	else: $Position2D.scale.x= -1
	anima_cow.play(animation_state)
	
func _on_Timer_timeout():
	var new_state= int(rand_range(0, 9))
	if state != new_state:
		velocity.x= 0
		velocity.y= 0
	state = new_state # Replace with function body.
	print('state: '+ str(state))
	$Timer.start()

func move_none():
	animation_state = "idle"
	velocity.x= 0
	velocity.y= 0
	#play_animtion()
# default eat idle love walk	
func move_up():
	leftOrRight= false
	animation_state = "run"
	velocity.x= 0
	#velocity.y= 0
	velocity.y -= MAX_SPEED
	#play_animtion()

func move_down():
	leftOrRight= true
	animation_state = "run"
	velocity.x= 0
	#velocity.y= 0
	velocity.y += MAX_SPEED
	#play_animtion()

func move_right():
	leftOrRight= false
	animation_state = "run"
	#velocity.x= 0
	velocity.y= 0
	velocity.x -= MAX_SPEED
	#play_animtion()
	
func move_left():
	leftOrRight= true
	animation_state = "run"
	#velocity.x= 0
	velocity.y= 0
	velocity.x += MAX_SPEED
	#play_animtion()
	
func love():
	animation_state = "love"
	#velocity.x= 0
	velocity.x= 0
	velocity.y= 0
	
func eat():
	animation_state = "eat"
	#velocity.x= 0
	velocity.x= 0
	velocity.y= 0
	
func default():
	animation_state = "idle"
	#velocity.x= 0
	velocity.x= 0
	velocity.y= 0	
	
func chill():
	animation_state = "chill"
	#velocity.x= 0
	velocity.x= 0
	velocity.y= 0	
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			print('click')
			state=7
			play_animtion()
			$Timer.start()
