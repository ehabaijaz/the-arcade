extends RigidBody2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func hit():
	get_tree().call_group("GameManagerBrick", "addPoints", 1)
	
	print("brick was hit")
	$Sprite2D.visible = false
	$CollisionShape2D.set_deferred("disabled", true)
	
	var bricksLeft = get_tree().get_nodes_in_group('Brick')
	
	if bricksLeft.size() == 1:
		get_parent().get_node("Ball").is_active = false
		await get_tree().create_timer(1).time_out
		get_tree().call_group("GameManagerBrick", "addLevel", 1)

		get_tree().reload_current_scene()
	else:
		await get_tree().create_timer(1).timeout
		queue_free()
	await get_tree().create_timer(1).timeout
	queue_free()
