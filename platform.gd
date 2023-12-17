extends StaticBody2D

class_name Platform

var platformStatus = 0
@onready var sprite0 = get_node("PlatformNomal")
@onready var sprite1 = get_node("PlatformCracked1")
@onready var sprite2 = get_node("PlatformCracked2")
@onready var glasshit = get_node("glasshit")
@onready var glassbreak = get_node("glassbreak")
@onready var collision = get_node("hitbox")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _hitPlatform():
	#TODO: Play sound + particle effect
	if(platformStatus == 0):
		sprite0.visible = false
		sprite1.visible = true
		glasshit.play()
	elif (platformStatus == 1):
		sprite1.visible = false
		sprite2.visible = true
		glasshit.play()
	elif(platformStatus == 2):
		#TODO: play particle effect
		glassbreak.play()
		sprite2.visible=false
		collision.set_deferred("disabled", true)
		
	platformStatus = platformStatus + 1
		


func _on_area_2d_body_entered(body):
	if (body.is_in_group("stone")):
		_hitPlatform()
