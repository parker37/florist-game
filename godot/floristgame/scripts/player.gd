extends KinematicBody2D

var velocity: Vector2 = Vector2()
var direction: Vector2 = Vector2()

func read_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		direction = Vector2(0,-1)

	elif Input.is_action_pressed("down"):
		velocity.y += 1
		$AnimationPlayer.play("walk_down")
		direction = Vector2(0,1)

	elif Input.is_action_pressed("left"):
		velocity.x -= 1
		direction = Vector2(-1,0)

	elif Input.is_action_pressed("right"):
		velocity.x += 1
		direction = Vector2(1,0)
		
	else:
		$AnimationPlayer.play("idle")
	
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 150)

func _physics_process(delta):
	read_input()
