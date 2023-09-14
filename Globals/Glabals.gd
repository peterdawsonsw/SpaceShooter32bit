extends Node


func _ready():
	Events.connect("GameOVER", self, "setGameOver")
	Events.connect("WAVEMODE", self, "setWaveMode")
	Events.connect("BOSSMODE",self, "setBossMode")
	
enum States {
	BOSSMODE,
	GAMEOVER, 
	WAVEMODE
}
var state = States.WAVEMODE
var score = 0

func GameState():
	match state:
		States.GAMEOVER:
			setGameOver()
		States.WAVEMODE:
			setWaveMode()
		States.BOSSMODE:
			setBossMode()
	
	
	
func setGameOver():
	state = States.GAMEOVER
	get_tree().reload_current_scene()
	score = 0
	
func setWaveMode():
	state = States.WAVEMODE
	
func setBossMode():
	state = States.BOSSMODE
