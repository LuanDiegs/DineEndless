extends Resource
class_name PlayerData

@export var highScore: int


func getHighScore():
	return highScore

	
func setHighScore(highScore: int):
	self.highScore = highScore
