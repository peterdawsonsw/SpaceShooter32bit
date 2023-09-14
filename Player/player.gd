extends KinematicBody
class_name Player

const COOLDOWN = 8
const MAXSPEED = 30
const ACCELERATION = 0.75
const MAXHP = 1000

var inputVector = Vector3()
var velo = Vector3()
var cooldown = 0
var HP = 100


#var Bullet = preload("res://Bullet.tscn")

func _physics_process(delta):
	getInput()
	velo.x = move_toward(velo.x, inputVector.x * MAXSPEED, ACCELERATION)
	velo.y = move_toward(velo.y, inputVector.y * MAXSPEED, ACCELERATION)
	rotation_degrees.z = velo.x * -2
	rotation_degrees.x = velo.y / 2
	rotation_degrees.y = -velo.x / 2
	move_and_slide(velo)
	transform.origin.x = clamp(transform.origin.x, -15, 15)
	transform.origin.y = clamp(transform.origin.y, -10, 10)
	
func getInput():
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	inputVector = inputVector.normalized()
	if Input.is_action_just_pressed("ui_accept"):
		$GUN.fire()
		print(str(HP))
	
func takeDamage(damage):
	HP -= damage
	print(str(HP))
	if HP <= 0:
		Events.emit_signal("GameOVER")
		self.queue_free()
		
