extends Area


export var damage = 5
export var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(-transform.basis.z * speed)


func _on_Bullet_body_entered(body):
	body.takeDamage(damage)
