extends ProgressBar

@onready var label: Label = $"../Label"
@onready var progress_bar: ProgressBar = $"."


func _process(delta: float) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "value", GlobalData.health, 0.2).set_trans(Tween.TRANS_BOUNCE)
	# progress_bar.value = GlobalData.health
	if GlobalData.health >= 0:
		label.text = "HP: " + str(GlobalData.health)
