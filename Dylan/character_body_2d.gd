extends CharacterBody2D

@onready var character_body_2d: CharacterBody2D = $"."
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var sword_box: Area2D = $SwordBox
@onready var attack_timer: Timer = $AttackTimer
@onready var wait: Timer = $Wait
@onready var hurtbox: Area2D = $Hurtbox
@onready var cooldown_timer: Timer = $Hurtbox/Cooldown
@onready var respawn: Timer = $Respawn
@onready var kick_box: Area2D = $KickBox
@onready var kick_timer: Timer = $KickTimer
@onready var block_sp: Timer = $Hurtbox/BlockSP



var SPEED = 100
var attacking = false
var animdir = "front"
var hurt = false
var cooldown = false


func _physics_process(_delta: float) -> void:


	var dir := Input.get_vector("west","east","north","south")
	
	
	if attacking == false and GlobalData.health > 0:
		if dir == Vector2(1,0):
			anim.play("run_right")
		elif dir == Vector2(-1,0):
			anim.play("run_left")
		elif dir == Vector2(0,-1):
			anim.play("run_back")
		elif dir == Vector2(0,1):
			anim.play("run_front")
		elif dir.x > 0 and dir.y > 0:
			anim.play("run_se")
		elif dir.x > 0 and dir.y < 0:
			anim.play("run_ne")
		elif dir.x < 0 and dir.y > 0:
			anim.play("run_sw")
		elif dir.x < 0 and dir.y < 0:
			anim.play("run_nw")
		
		
	if Input.is_action_just_pressed("attack") == true:
		if GlobalData.health > 0 and GlobalData.sp >= 6:
			if anim.animation == "run_right" or anim.animation == "idle_right":
				GlobalData.sp = GlobalData.sp - 6
				attacking = true
				anim.play("attack_right")
				animdir = "right"
				timer.start()
				attack_timer.start()
			elif anim.animation == "run_left" or anim.animation == "idle_left":
				GlobalData.sp = GlobalData.sp - 6
				attacking = true
				anim.play("attack_left")
				animdir = "left"
				timer.start()
				attack_timer.start()
			elif anim.animation == "run_front" or anim.animation == "idle_front":
				GlobalData.sp = GlobalData.sp - 6
				attacking = true
				anim.play("attack_front")
				animdir = "front"
				timer.start()
				attack_timer.start()
			elif anim.animation == "run_back" or anim.animation == "idle_back":
				GlobalData.sp = GlobalData.sp - 6
				attacking = true
				anim.play("attack_back")
				animdir = "back"
				timer.start()
				attack_timer.start()
			elif anim.animation == "run_ne" or anim.animation == "idle_ne":
				GlobalData.sp = GlobalData.sp - 6
				attacking = true
				anim.play("attack_ne")
				animdir = "ne"
				timer.start()
				attack_timer.start()
			elif anim.animation == "run_nw" or anim.animation == "idle_nw":
				GlobalData.sp = GlobalData.sp - 6
				attacking = true
				anim.play("attack_nw")
				animdir = "nw"
				timer.start()
				attack_timer.start()
			elif anim.animation == "run_se" or anim.animation == "idle_se":
				GlobalData.sp = GlobalData.sp - 6
				attacking = true
				anim.play("attack_se")
				animdir = "se"
				timer.start()
				attack_timer.start()
			elif anim.animation == "run_sw" or anim.animation == "idle_sw":
				GlobalData.sp = GlobalData.sp - 6
				attacking = true
				anim.play("attack_sw")
				animdir = "sw"
				timer.start()
				attack_timer.start()
				
	if Input.is_action_just_pressed("kick") == true:
		if GlobalData.health > 0 and GlobalData.sp >= 4:
			if anim.animation == "run_right" or anim.animation == "idle_right":
				GlobalData.sp = GlobalData.sp - 4
				attacking = true
				anim.play("kick_right")
				animdir = "right"
				timer.start()
				kick_timer.start()
			elif anim.animation == "run_left" or anim.animation == "idle_left":
				GlobalData.sp = GlobalData.sp - 4
				attacking = true
				anim.play("kick_left")
				animdir = "left"
				timer.start()
				kick_timer.start()
			elif anim.animation == "run_front" or anim.animation == "idle_front":
				GlobalData.sp = GlobalData.sp - 4
				attacking = true
				anim.play("kick_front")
				animdir = "front"
				timer.start()
				kick_timer.start()
			elif anim.animation == "run_back" or anim.animation == "idle_back":
				GlobalData.sp = GlobalData.sp - 4
				attacking = true
				anim.play("kick_back")
				animdir = "back"
				timer.start()
				kick_timer.start()
			elif anim.animation == "run_ne" or anim.animation == "idle_ne":
				GlobalData.sp = GlobalData.sp - 4
				attacking = true
				anim.play("kick_ne")
				animdir = "ne"
				timer.start()
				kick_timer.start()
			elif anim.animation == "run_nw" or anim.animation == "idle_nw":
				GlobalData.sp = GlobalData.sp - 4
				attacking = true
				anim.play("kick_nw")
				animdir = "nw"
				timer.start()
				kick_timer.start()
			elif anim.animation == "run_se" or anim.animation == "idle_se":
				GlobalData.sp = GlobalData.sp - 4
				attacking = true
				anim.play("kick_se")
				animdir = "se"
				timer.start()
				kick_timer.start()
			elif anim.animation == "run_sw" or anim.animation == "idle_sw":
				GlobalData.sp = GlobalData.sp - 4
				attacking = true
				anim.play("kick_sw")
				animdir = "sw"
				timer.start()
				kick_timer.start()
	
		
		
		
	if dir == Vector2(0,0):
		if attacking == false and GlobalData.health > 0: 
			if anim.animation == "run_right":
				anim.play("idle_right")
			elif anim.animation == "run_left":
				anim.play("idle_left")
			elif anim.animation == "run_front":
				anim.play("idle_front")
			elif anim.animation == "run_back":
				anim.play("idle_back")
			elif anim.animation == "run_ne":
				anim.play("idle_ne")
			elif anim.animation == "run_nw":
				anim.play("idle_nw")
			elif anim.animation == "run_se":
				anim.play("idle_se")
			elif anim.animation == "run_sw":
				anim.play("idle_sw")


		
	
	if attacking == false and GlobalData.health > 0:
		velocity = dir * SPEED
		sword_box.monitoring = false
		sword_box.monitorable = false
		kick_box.monitorable = false
		kick_box.monitoring = false
		move_and_slide()
		
	if hurt == true:
		if cooldown == false:
			GlobalData.health = GlobalData.health - 1
			cooldown = true
			cooldown_timer.start()
	
	if GlobalData.health <= 0:
		if anim.animation.contains("front"):
			
			anim.play("death_front")
			await anim.animation_finished == true
			anim.frame = 14
		elif anim.animation.contains("back"):
			
			anim.play("death_back")
			await anim.animation_finished == true
			anim.frame = 14
		elif anim.animation.contains("left"):
			
			anim.play("death_left")
			
			await anim.animation_finished == true
			
			anim.frame = 14
		elif anim.animation.contains("right"):
			
			anim.play("death_right")
			
			await anim.animation_finished == true
			
			anim.frame = 14
		elif anim.animation.contains("ne"):
			
			anim.play("death_ne")
			
			await anim.animation_finished == true
			
			anim.frame = 14
		elif anim.animation.contains("nw"):
			
			anim.play("death_nw")
			
			await anim.animation_finished == true
			
			anim.frame = 14
		elif anim.animation.contains("se"):
			
			anim.play("death_se")
			
			await anim.animation_finished == true
			
			anim.frame = 14
		elif anim.animation.contains("sw"):
			
			anim.play("death_sw")
			
			await anim.animation_finished == true
			
			anim.frame = 14
			
	if anim.animation.contains("death") and anim.frame == 14:
		GlobalData.dead = true
		
	if Input.is_action_pressed("block") == true and Input.is_action_just_released("block") == false:
		if GlobalData.health > 0 and GlobalData.sp > 1:
			GlobalData.blocking = true
			block_sp.start()
			attacking = true
			if anim.animation.contains("right") == true:
				anim.play("block_right")
				animdir = "right"
			elif anim.animation.contains("left") == true:
				anim.play("block_left")
				animdir = "left"
			elif anim.animation.contains("front") == true:
				anim.play("block_front")
				animdir = "front"
			elif anim.animation.contains("back") == true:
				anim.play("block_back")
				animdir = "back"
			elif anim.animation.contains("ne") == true:
				anim.play("block_ne")
				animdir = "ne"
			elif anim.animation.contains("nw") == true:
				anim.play("block_nw")
				animdir = "nw"
			elif anim.animation.contains("se") == true:
				anim.play("block_se")
				animdir = "se"
			elif anim.animation.contains("sw") == true:
				anim.play("block_sw")
				animdir = "sw"
			
	if GlobalData.blocking == true:
		hurtbox.monitorable = false
		hurtbox.monitoring = false
	else:
		hurtbox.monitorable = true
		hurtbox.monitoring = true
			
	if Input.is_action_just_released("block") == true or GlobalData.sp <= 1:
		if Input.is_action_just_released("block") == true:
			GlobalData.blocking = false
			attacking = false
			block_sp.stop()
			anim.play("idle_" + animdir)

func _on_timer_timeout() -> void:
	attacking = false
	anim.play("idle_" + animdir)


func _on_attack_timer_timeout() -> void:
	sword_box.monitoring = true
	sword_box.monitorable = true
	wait.start()

func _on_kick_timer_timeout() -> void:
	kick_box.monitorable = true
	kick_box.monitoring = true
	wait.start()

func _on_wait_timeout() -> void:
	sword_box.monitoring = false
	sword_box.monitorable = false
	kick_box.monitorable = false
	kick_box.monitoring = false




func _on_hurtbox_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	hurt = true


func _on_hurtbox_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	hurt = false


func _on_cooldown_timeout() -> void:
	cooldown = false


func _on_respawn_timeout() -> void:
	get_tree().reload_current_scene()
	


func _on_block_sp_timeout() -> void:
	if GlobalData.sp > 1:
		GlobalData.sp = GlobalData.sp - 1
