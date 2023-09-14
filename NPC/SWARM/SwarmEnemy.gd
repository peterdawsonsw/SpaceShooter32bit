extends KinematicBody

var spd = rand_range(20,50)
var HP = 5
var damage = 5

func _physics_process(delta):
	move_and_slide(Vector3(0,0,spd))
	if transform.origin.z > 10:
		queue_free()

func takeDamage(damage):
	Glabals.score += 1
	HP -= damage
	if HP <= 0:
		queue_free()
