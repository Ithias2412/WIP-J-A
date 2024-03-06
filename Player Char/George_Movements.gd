extends CharacterBody2D

@export var speed : int = 140


func get_input():
	var direction = Input.get_vector("Move Left", "Move Right", "Move Up", "Move Down")
	velocity = direction * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide()
