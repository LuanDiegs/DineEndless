extends Node
class_name FiniteStateMachine

var previous_state: State
var current_state: State

func _ready():
	# Get the first child, it will be the default state
	var child = get_child(0)
	if child is State:
		current_state = child
		previous_state = current_state
		current_state.enterState()

func changeState(state: String):
	# Find the child in all states
	print(find_child(state))
	print(previous_state)
	current_state = find_child(state) as State
	current_state.enterState()
	
	# Exit the previous state and put that the current is the previous now
	previous_state.exitState()
	previous_state = current_state
		
