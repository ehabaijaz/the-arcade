extends CharacterBody2D

var speed = 500


func _ready() -> void:
	randomize()
	velocity.x = [-1, 1].pick_random()
	velocity.y = [-0.8, 0.8].pick_random()
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		$CollisionSound.play()

func stop_ball():
	speed = 0

func restart_ball():
	speed = 600
	velocity.x = [-1, 1].pick_random()
	velocity.y = [-0.8, 0.8].pick_random()
	
