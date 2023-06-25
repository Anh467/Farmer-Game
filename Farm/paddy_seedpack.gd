extends StaticBody2D

#var selected = false
var seed_type = 1


func _ready():
	$AnimatedSprite.play("default")
	

func _on_Area2D_input_event(viewport, event, shape_idx):
	Inventory.seed_pack_position= position;
	#Inventory.selected= false;
	if Input.get_action_strength("ui_action"):
		
		print('Distace: '+str(Inventory.player_position.distance_to(Inventory.seed_pack_position)));
		if Inventory.player_position.distance_to(Inventory.seed_pack_position) < 15:
			Inventory.selected = true
			Inventory.object_selected = seed_type
		
func _physics_process(delta):
	if Inventory.selected and Inventory.object_selected == seed_type:
		global_position = lerp(global_position,  Inventory.player_position, 25*delta)
	
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_SPACE and not event.pressed :
			Inventory.selected = false
			Inventory.object_selected = 0


func _on_Area2D_area_entered(area):
	pass # Replace with function body.
