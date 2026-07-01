extends CharacterBody2D

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var area_2d: Area2D = $Area2D
@onready var up_limit: Marker2D = $"../../TileMapLayer/UpLimit"
@onready var left_limit: Marker2D = $"../../TileMapLayer/LeftLimit"
@onready var right_limit: Marker2D = $"../../TileMapLayer/RightLimit"
@onready var down_limit: Marker2D = $"../../TileMapLayer/DownLimit"
@onready var following: bool = false
@onready var lostplayer: bool = true
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var speed: float = 50.0
@export var keyholder: bool = false
@onready var death: Timer = $Death
var isdead = false

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if GlobalData.dead == false:
		if area.name.containsn("SwordBox") or area.name.contains("KickBox"):
			GlobalData.cash = GlobalData.cash + 10
			GlobalData.enemynumber = GlobalData.enemynumber - 1
			print(GlobalData.enemynumber)
			isdead = true
			death.start()
			animated_sprite_2d.play("death")

func move_enemy() -> void:
	if GlobalData.dead == false:
		
		
		var distance = global_position.distance_to(GlobalData.player.global_position)
		var current_speed: float = 0.0
		

		if distance < 300 and distance >= 10:
			following = true
			lostplayer = true
			navigation_agent_2d.set_target_position(GlobalData.player.global_position)
			current_speed = speed
		elif distance >= 300 or following == false:
			if lostplayer == true:
				navigation_agent_2d.set_target_position(Vector2(randi_range(left_limit.position.x, right_limit.position.x), randi_range(up_limit.position.y, down_limit.position.y)))
				lostplayer = false
			current_speed = speed



		
		var next_path_position = navigation_agent_2d.get_next_path_position()
		var direction = global_position.direction_to(next_path_position)
		
		if direction.x > 0 and direction.y > 0:
			if direction.x > 0.5 and direction.y > 0.5:
				animated_sprite_2d.play("se")
			elif direction.x <= 0.5 and direction.y > 0.5:
				animated_sprite_2d.play("back")
			elif direction.x > 0.5 and direction.y <= 0.5:
				animated_sprite_2d.play("right")
			else:
				animated_sprite_2d.play("nw")
		if direction.x < 0 and direction.y < 0:
			if direction.x < 0.5 and direction.y < 0.5:
				animated_sprite_2d.play("left")
			elif direction.x >= 0.5 and direction.y < 0.5:
				animated_sprite_2d.play("front")
			elif direction.x < 0.5 and direction.y >= 0.5:
				animated_sprite_2d.play("sw")
			else:
				animated_sprite_2d.play("ne")

		velocity = direction * current_speed
		
		if isdead == false:
			move_and_slide()

func _physics_process(_delta: float) -> void:
	if GlobalData.dead == false:
		if is_instance_valid(GlobalData.player):
			move_enemy()
	
	if isdead == false:
		var facing_direction: int = 0  # 0 to 7 index
		var angle = velocity.angle() + PI

		facing_direction = int(round(angle / (TAU / 8.0))) % 8
		
		if facing_direction == 0:
			animated_sprite_2d.play("left")
		elif facing_direction == 1:
			animated_sprite_2d.play("ne")
		elif facing_direction == 2:
			animated_sprite_2d.play("back")
		elif facing_direction == 3:
			animated_sprite_2d.play("nw")
		elif facing_direction == 4:
			animated_sprite_2d.play("right")
		elif facing_direction == 5:
			animated_sprite_2d.play("se")
		elif facing_direction == 6:
			animated_sprite_2d.play("front")
		elif facing_direction == 7:
			animated_sprite_2d.play("sw")
	else:
		animated_sprite_2d.play("death")
		


func _on_navigation_agent_2d_navigation_finished() -> void:
	navigation_agent_2d.set_target_position(Vector2(randi_range(left_limit.position.x, right_limit.position.x), randi_range(up_limit.position.y, down_limit.position.y)))


func _on_death_timeout() -> void:
	queue_free()
