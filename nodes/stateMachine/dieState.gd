extends State
class_name DieState

@export var player: Player
@onready var restartGameTimer = $TimeToRestartGame

signal died

func enterState():
	restartGameTimer.timeout.connect(restartScene)
	
	super.enterState()
	player.isDead = true
	
	restartGameTimer.start()
	

func transition():
	pass


func restartScene():
	get_tree().reload_current_scene()
