extends Node
class_name SaveGame

var highScore: int = 0

# Path to save
# The file name is hardcoded "player" bacuse we don't have other variables to save
var saveDir: String = "user://save/"
var fileNameSave: String = "Player.tres"
var savePath: String = saveDir + fileNameSave


func save(valueToSave: PlayerData):
	ResourceSaver.save(valueToSave, savePath)


func loadSave():
	if ResourceLoader.exists(savePath):	
		return ResourceLoader.load(savePath).duplicate(true)
		
	return PlayerData.new()


func verifySaveFile():
	DirAccess.make_dir_absolute(saveDir)
