extends Character

var moveSpeed : int = 200

var sprite
var player

var anger = preload("res://anger.png")
var no_anger = preload("res://no_anger.png")
func _ready():
	sprite = get_node("Sprite2D")

func move(delta):
	if player:
		var chase_direction = position.direction_to(player.position)
		velocity = chase_direction * moveSpeed
		move_and_slide()
				
func _on_chase_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	
	if body.is_in_group("player"):
		sprite.set_texture(anger)
		player = body
		
	
func _on_chase_area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	player = null
	sprite.set_texture(no_anger)
