extends Camera2D
class_name PlayerCamera

var target: Character
var player: Player

func _ready():
	if (!target):
		set_physics_process(false);

func initialize(_target: Character):
	target = _target
	set_physics_process(true)
	
func _physics_process(delta):
	if (target):
		global_position = target.position
