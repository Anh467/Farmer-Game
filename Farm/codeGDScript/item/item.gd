extends Node2D
class_name Item 
var selected = false
var item_id = ""

func _ready():
	#$AnimatedSprite.play("default")
	pass 
	
func setItemID(type):
	item_id = type
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	Inventory.object_slect_position = position
	if Input.is_action_just_pressed("ui_action"):
		if GlobalPlayer.player_position.distance_to(Inventory.object_slect_position) < 15:
			Inventory.selected = false
			selected = true
			Inventory.object_selected = item_id
			Inventory.selected = true

func _physics_process(delta):
	if Inventory.selected and selected and Inventory.object_selected == item_id:
		var player_position = GlobalPlayer.player_position
		player_position.y -= 12
		global_position = lerp(global_position, player_position, 25 * delta)

func put_down():
	if selected:
		var player_position = GlobalPlayer.player_position
		player_position.y -= 12
		global_position = lerp(global_position, player_position, 0.416667)
		Inventory.selected = false
		selected = false
		Inventory.object_selected =""

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_SPACE and not event.pressed:
			put_down()
