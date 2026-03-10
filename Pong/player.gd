extends CharacterBody2D

var speed = 335


func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	move_and_collide(velocity * speed * delta)
