extends KinematicBody2D

const MAXSPEED = 100
const ACCELERATION = 300
const FRICTION = 200

var motion = Vector2.ZERO

func _physics_process(delta):
	var input_vector = get_input_vector()
	apply_movement(input_vector, delta)
	apply_friction(input_vector, delta)
	motion = move_and_slide(motion)
	
func get_input_vector():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return input_vector.normalized()
	
func apply_movement(input_vector, delta):
	if input_vector != Vector2.ZERO:
		motion = motion.move_toward(input_vector * MAXSPEED, ACCELERATION * delta)
		
# 2nd way of applying movement
#	if input_vector.x != 0:
#		motion.x += input_vector.x * ACCELERATION * delta
#		motion.x = clamp(motion.x, -MAXSPEED,  MAXSPEED)
#	else:
#		motion.x = lerp(motion.x, 0, FRICTION)
#	if input_vector.y != 0:
#		motion.y += input_vector.y * ACCELERATION * delta
#		motion.y = clamp(motion.y, -MAXSPEED,  MAXSPEED)
#	else:
#		motion.y = lerp(motion.y, 0, FRICTION)
		
# 3rd way of applying movement
#		motion = lerp(Vector2.ZERO, input_vector * MAXSPEED, ACCELERATION)

# 4th way to apply movement 
#	if Input.is_action_just_pressed("move_up"):
#		motion...
		
func apply_friction(input_vector, delta):
	if input_vector == Vector2.ZERO:
		motion = motion.move_toward(Vector2.ZERO, FRICTION * delta)

# this is another way of apply friction
#		motion = lerp(motion, Vector2.ZERO, FRICTION)
		
	
	

