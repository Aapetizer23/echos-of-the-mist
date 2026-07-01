extends Marker2D


@onready var spawner_cooldown: Timer = $SpawnerCooldown
@onready var enemies: Node2D = $"../.."
@onready var spawner: Node2D = $".."



func _on_spawner_cooldown_timeout() -> void:
	if GlobalData.enemynumber < 10:
		var NewEnemy: CharacterBody2D = GlobalData.ENEMY.instantiate()
		GlobalData.enemynumber = GlobalData.enemynumber + 1
		print(GlobalData.enemynumber)
		enemies.add_child(NewEnemy)
		NewEnemy.position = Vector2(spawner.position)
