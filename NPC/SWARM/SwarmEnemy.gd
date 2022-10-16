extends KinematicBody

var spd = rand_range(20,50)
var HP = 5

func _physics_process(delta):
	move_and_slide(Vector3(0,0,spd))
	if transform.origin.z > 10:
		queue_free()

func takeDamage(damage):
	HP -= damage
	if HP <= 0:
		Glabals.score += 1
		self.queue_free()
