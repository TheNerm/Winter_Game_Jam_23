extends Node2D

class_name GameHandler

@onready var player1 = get_node("player1")
@onready var player2 = get_node("player2")
@onready var gameOverScreen = get_node("GameOver")
@onready var gameOverLabel = get_node("GameOver/Game Over message")

var gameOver = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(gameOver &&  (Input.is_action_pressed("P1_Restart") || Input.is_action_pressed("P2_Restart"))):
		reload_current_scene()
		
func _death(deadPlayerName):
	if(!gameOver):
		gameOver = true
		gameOverLabel.text = deadPlayerName + " got crushed!!"
		gameOverScreen.visible = true
		
func reload_current_scene():
	#var current_scene = get_tree().current_scene
	#var scene_path = current_scene.filename  # Ensure your scenes are saved with a path
	get_tree().reload_current_scene()

