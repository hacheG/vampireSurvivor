extends Node2D

var player: KinematicBody2D
export var enemy: PackedScene
#var escena = preload("res://Scenes/Enemy.tscn")
var distance: float = 400

var minute: int setget set_minute
func set_minute(value):
	minute = value
	$"%Minute".text = str(value)

var second: int setget set_second
func set_second(value):
	second = value
	if second >= 10:
		second -= 10
		minute += 1
	$"%Second".text = str(second)

func spawn(pos: Vector2):
	var enemy_instance = enemy.instance()
	enemy_instance.position = pos
	enemy_instance.player_reference = player
	call_deferred("add_child", enemy_instance)


func get_random_position() -> Vector2:
	return player.position + distance * Vector2.RIGHT.rotated(rand_range(0, 2 * PI))


func amount(number: int = 1):
	for i in range(number):
		spawn(get_random_position())
		var _i = i


func _ready():
	player = get_tree().get_root().find_node("Player", true, false)
#	player = get_tree().get_root().find_node("Player", true, false)
#	var enemy = get_node("res://Scenes/Enemy.tscn")
#	var enemy_instance = enemy.instance()
#	get_tree().current_scene.add_child(enemy_instance)
#	
#	var inst_esc = enemy.instance()
#	get_tree().root.add_child(inst_esc)
#	call_deferred("add_child", inst_esc)
	pass

func _on_Timer_timeout():
	second += 1
	print(player)
	amount(second % 10)
