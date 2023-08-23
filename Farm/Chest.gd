extends StaticBody2D

var animation_state= "close"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	$AnimatedSprite.play(animation_state)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		match animation_state:
			"close":animation_state= "opening"
			"open":animation_state= "closing"


func _on_AnimatedSprite_animation_finished():
	match animation_state:
		"closing":animation_state= "close"
		"opening":animation_state= "open"
