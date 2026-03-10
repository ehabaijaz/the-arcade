extends Node

var PlayerScore = 0
var OpponentScore = 0

func _ready():
	$CountdownLabel.visible = false
	
func _on_left_body_entered(body) -> void:
	score_achieved()
	OpponentScore += 1
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://MainMenu/mainmenu.tscn")

func _on_right_body_entered(body) -> void:
	score_achieved()
	PlayerScore += 1


func _process(delta: float) -> void:
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)


func _on_countdown_timer_timeout() -> void:
	get_tree().call_group('BallGroup', 'restart_ball')
	$CountdownLabel.visible = false

func score_achieved():
	$Ball.position = Vector2(640,360)
	get_tree().call_group('BallGroup', 'stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
