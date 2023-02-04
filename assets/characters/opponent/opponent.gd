extends Character

var staggered = false
var moveSpeed : int = 150

var sprite
var player

var anger = preload("res://anger.png")
var no_anger = preload("res://no_anger.png")
func _ready():
	sprite = get_node("Sprite2D")

func move(delta):
	if player:
		if !staggered:
			var chase_direction = position.direction_to(player.position)
			velocity = chase_direction.normalized() * moveSpeed
	move_and_slide()
				
func _on_chase_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("player"):
		sprite.set_texture(anger)
		player = body
		
	
func _on_chase_area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("player"):
		player = null
		sprite.set_texture(no_anger)
		

func _on_attack_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("player"):
		attack(body)

func attack(body):
	staggered = true
	velocity = position.direction_to(body.position) * -3 *moveSpeed
	await get_tree().create_timer(0.2).timeout
	moveSpeed = 100
	staggered = false
