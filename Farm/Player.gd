extends KinematicBody2D
export var ACCELERATION = 500
export var MAX_SPEED = 30
export var ROLL_SPEED = 120
export var FRICTION = 500
enum {
	MOVE,
	ROLL,
	ATTACK
}
var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN
var animate_state= "default"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	GlobalPlayer.player_position= position;
	match state:
		MOVE: move_state(delta)
	$AnimatedSprite.play(animate_state)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	input_vector = input_vector.normalized()		
	if input_vector != Vector2.ZERO:
		if input_vector.y < 0:
			animate_state = "walk_up"
		elif input_vector.y > 0:
			animate_state = "walk_down"
		elif input_vector.x >0:
			animate_state = "walk_right"
		else:
			animate_state = "walk_left"
		
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta) 
	else:
		if animate_state == "walk_up":
			animate_state = "idle_up"
		elif animate_state == "walk_down":
			animate_state = "idle_down"
		elif animate_state == "walk_right":
			animate_state = "idle_right"
		elif animate_state == "walk_left":
			animate_state = "idle_left"
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move_and_slide(velocity)

	
