extends CharacterBody2D

@onready var character_body_2d: CharacterBody2D = $"."

var SPEED = 100


func _physics_process(delta: float) -> void:

	var dir := Input.get_vector("west","east","north","south")
	velocity = dir * SPEED
	
	move_and_slide()
