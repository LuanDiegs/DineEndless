extends State
class_name DieState

@export var player: Player
@onready var restartGameTimer = $TimeToRestartGame
	
var saveComponent = SaveGame.new()

func enterState():
	restartGameTimer.timeout.connect(restartScene)
	
	super.enterState()
	
	restartGameTimer.start()
	

func transition(delta):
	player.velocity.x += lerp(player.velocity.x , 0.0, 1.05)
	player.hitbox.disabled = true
	
	if(player.score.score > player.playerData.highScore):
			# Save
			var playerData = PlayerData.new()
			playerData.setHighScore(player.score.score)
			saveComponent.save(playerData)


func restartScene():
	get_tree().reload_current_scene()


func changeStateToDeath():
	get_parent().changeState("DieState")
