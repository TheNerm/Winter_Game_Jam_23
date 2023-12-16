extends CharacterBody2D

func _ready():
	set_velocity(Vector2(250, 250))

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())


func _on_area_2d_area_entered(area):
	if(area.is_in_group("players")):
		velocity.x *= 1.5
		velocity.y *= 1.5

func _on_hurtbox_body_entered(body):
	if(body.is_in_group("players")):
		velocity.x *= 1.5
		velocity.y *= 1.5
		
