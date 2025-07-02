extends KinematicBody2D

onready var player_reference: KinematicBody2D 
var direction: Vector2
var speed: float = 75
var velocity: Vector2

func _ready():
	pass
	
	
func _physics_process(delta):
	player_reference = get_tree().get_root().find_node("Player", true, false)
#	print(player_reference.position)
	velocity = (player_reference.position - position).normalized() * speed
	return move_and_collide(velocity * delta)
