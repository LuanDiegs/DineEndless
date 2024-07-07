extends Control
class_name Score

@onready var score_value = $CanvasLayer/scoreValue
@onready var high_score_value = $CanvasLayer/highScoreValue

var score: int = 0
var highScore: int = 0
	
func _process(delta):
	score += 1
	score_value.text = str(score)
	
	if(score > highScore):
		high_score_value.text = str(score)


func setHighScore(highScore: int):
	self.highScore = highScore
	high_score_value.text = str(highScore)
