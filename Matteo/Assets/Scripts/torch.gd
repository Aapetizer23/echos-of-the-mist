extends Button

@export var torch_ID: int
var is_on

func _ready():
	is_on = global_torch_manager.torch_array[torch_ID]
	$Off.visible = !is_on
	$On.visible = is_on


func _on_button_down() -> void:
	if !is_on:
		$Off.visible = false
		$On.visible = true
		global_torch_manager.torch_lit(torch_ID)
