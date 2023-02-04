extends Node

var level1_path: String = "res://scenes/test/test_level.tscn"
var player_path: String = "res://assets/characters/player/player.tscn"
var camera_path: String = "res://assets/camera/PlayerCamera.tscn"

var current_level: Node2D
var player: Player
var camera: PlayerCamera

func init_camera():
	var loaded_camera = load(camera_path)
	var instantiated_camera = loaded_camera.instantiate()
	get_node("../Main").add_child(instantiated_camera)
	instantiated_camera.initialize(player)
	camera = instantiated_camera

func init_player():
	var loaded_player = load(player_path)
	var instantiated_player = loaded_player.instantiate()
	current_level.add_child(instantiated_player)
	player = instantiated_player
	
func init_level():
	var loaded_level = load(level1_path)
	var instantiated_level = loaded_level.instantiate()
	get_node("../Main").add_child(instantiated_level)
	current_level = instantiated_level

func _ready():
	init_level()
	init_player()
	init_camera()
