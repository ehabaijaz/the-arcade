extends Node

var score = 0 
var level = 1

func addPoints(points):
	score += points
func addLevel(forgmtowork):
	level = forgmtowork + level

func _process(delta: float) -> void:
	$CanvasLayer/ScoreLabel.text = str(score)
	$CanvasLayer/LevelLabel.text = "Level: " + str(level)
