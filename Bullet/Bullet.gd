extends Area


export var damage = 5
export var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Bullet has been loaded into the scene")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(-transform.basis.z * speed)


func _on_Bullet_body_entered(body):
	print("hit " + body.name)
	if !body.is_in_group("player"):
		body.takeDamage(damage)
		Glabals.score += 1
