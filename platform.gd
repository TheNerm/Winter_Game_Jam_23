extends StaticBody2D

class_name Platform

var platformStatus = 0
@onready var sprite0 = get_node("PlatformNomal")
@onready var sprite1 = get_node("PlatformCracked1")
@onready var sprite2 = get_node("PlatformCracked2")

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
	elif (platformStatus == 1):
		sprite1.visible = false
		sprite2.visible = true
	elif(platformStatus == 2):
		#TODO: play particle effect
		self.disabled = true
	platformStatus = platformStatus + 1
		
