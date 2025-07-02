extends KinematicBody2D

var speed: float = 150
var velocity = Vector2(0, 0)

func _physics_process(delta):
	velocity = Input.get_vector("left", "right", "up", "down") * speed
	move_and_collide(velocity * delta)
