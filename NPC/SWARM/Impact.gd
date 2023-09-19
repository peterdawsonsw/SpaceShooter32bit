extends Area

var damage = 5

func _on_Area_body_entered(body):
	body.takeDamage(damage)
	get_parent().queue_free()
