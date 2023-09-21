extends Spatial


var BULLET =  preload("res://Bullet/Bullet.tscn")
var main
onready var sournd = $AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_tree().current_scene


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func fire():
	var bullet = BULLET.instance()
	main.add_child(bullet)
	bullet.transform = global_transform
	sournd.play(0.0)
	
