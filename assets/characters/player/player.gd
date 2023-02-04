extends Character
class_name Player

var moveSpeed : int = 300
var interactionDistance : int = 70
var facingDirection : Vector2 = Vector2()

func _ready():
	var rayCast = get_node("RayCast2D");

func move(delta):
	velocity = Vector2()
	
	#inputs
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		facingDirection = Vector2(0, -1)
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		facingDirection = Vector2(0, 1)
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		facingDirection = Vector2(-1, 0)
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		facingDirection = Vector2(1, 0)
	#prevent faster diagonal movement
	velocity = velocity.normalized() * moveSpeed
	#move the player
	move_and_slide()	
	

	

