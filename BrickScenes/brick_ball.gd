extends CharacterBody2D

var speed = 300
var dir = Vector2.DOWN
var is_active = true
var collision
var manager

func _ready() -> void:
	manager = get_tree().get_first_node_in_group("GameManagerBrick")
	speed = 200 + (20 * manager.level)
	velocity = Vector2(speed * -1, speed)

func _physics_process(delta: float) -> void:
	print("Test")
	if is_active:
		collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
	
	if (velocity.y > 0 and velocity.y < 100):
		velocity.y = -200
	
	if velocity.x == 0:
		velocity.x = -200

func gameOver():
	manager.score = 0
	manager.level = 1
	get_tree().reload_current_scene()

func _on_death_zone_body_entered(body: Node2D) -> void:
	call_deferred('gameOver')
