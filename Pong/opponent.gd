extends CharacterBody2D

var speed = 366
var ball 

func _ready() -> void:
	ball = get_parent().get_node("Ball")
	
func _physics_process(delta: float) -> void:
	move_and_collide(Vector2(0,get_opponent_direction()) * speed * delta)

func get_opponent_direction():
	if abs(ball.position.y - position.y ) > 25:
		if ball.position.y > position.y: return 1
		else: return -1 
	else: return 0
