class_name State extends Node

#references who these states belong to
static  var player: George

func _ready() -> void:
	pass # Replace with function body.
# what happens when the player enters this state
func Enter() -> void:
	pass
# what happens when the player exits this state
func Exit() -> void:
	pass
# what happens during the _process update in this state
func Process(_delta : float) -> State:
	return null
# what happens during the _physics_process update in this state
func Physics(_delta : float) -> State:
	return null
# what happens to inputs in this state
func HandleInput( _event : InputEvent) -> State:
	return null