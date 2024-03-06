extends CharacterBody2D

@export var speed : int = 140


func get_input():
	var direction = Input.get_vector("Move Left", "Move Right", "Move Up", "Move Down")
	velocity = direction * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide()
	
#This is all my funny anim code, I dont know what i'm doing :(
@onready var animated_sprite_2d : AnimatedSprite2D = $AnimatedSprite2D

func _process(delta):
	if abs(velocity.x) > 10:
		animated_sprite_2d.play("George_Move")
	else:
		if abs(velocity.y) > 10:
			animated_sprite_2d.play("George_Move")
		else:
			animated_sprite_2d.play("George_Idle")
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true
	if velocity.x > 0:
		animated_sprite_2d.flip_h = false
