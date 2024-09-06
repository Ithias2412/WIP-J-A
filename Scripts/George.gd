class_name George extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.ZERO
var direction : Vector2 = Vector2.ZERO
var move_speed : float = 140.0
var state : String = "idle"

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

#gives binds an axis strength. 
func _process (_delta):
	
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	velocity = direction * move_speed
	#this runs the updateanim func if both return true
	if SetState() == true or SetDirection() == true:
		UpdateAnimation()
	
func _physics_process(_delta):
	move_and_slide()
#decides if it needs to flip the texture or not, im using scale to ensure items are also flipped later
func SetDirection() -> bool:
	var new_dir : Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
		
	if direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	elif direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	if new_dir == cardinal_direction:
		return false
	cardinal_direction = new_dir
	sprite_2d.scale.x = -0.1 if cardinal_direction == Vector2.LEFT else 0.1
	return true
	
	#this is figuring out if you should idle or not
func SetState() -> bool:
	var new_state : String = "idle" if direction == Vector2.ZERO else "walk"
	if new_state == state: #this checks if my state is the same as my new_state
		return false
	state = new_state #this will make my state my new_state
	return true
	
	#adds up/down to end of idle/walk to match anim name
func UpdateAnimation() -> void:
	animation_player.play(state + "_" + AnimDirection() ) 
	pass
	
	#will add up to anim name if vectoring up
func AnimDirection() -> String:
	if cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
