extends CharacterBody2D

@onready var piz = $Node2D

const BulletPath = preload("res://bullet.tscn")

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
		$Node2D.look_at(get_global_mouse_position())

func shoot():
	var bullet = BulletPath.instantiate()
	
	get_parent().add_child(bullet)
	bullet.position = $Node2D/Marker2D.global_position
	
	bullet.velocity = get_global_mouse_position() - bullet.position
	bullet.rotation = piz.rotation
