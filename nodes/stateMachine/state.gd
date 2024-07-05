extends Node
class_name State

func _ready():
	set_physics_process(false)


func enterState():
	set_physics_process(true)


func exitState():
	set_physics_process(false)


func transition():
	pass


func _physics_process(delta):
	transition()
