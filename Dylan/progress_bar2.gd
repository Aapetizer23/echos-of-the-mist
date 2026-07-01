extends ProgressBar

@onready var label: Label = $"../Label"
@onready var progress_bar: ProgressBar = $"."


func _process(delta: float) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "value", GlobalData.sp, 0.2).set_trans(Tween.TRANS_BOUNCE)
	if GlobalData.sp >= 0:
		label.text = "SP: " + str(GlobalData.sp)



func _on_sp_refill_timeout() -> void:
	if GlobalData.sp < 20:
		GlobalData.sp = GlobalData.sp + 1
