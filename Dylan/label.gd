extends Label


func _process(delta: float) -> void:
	self.text = "Cash: " + str(GlobalData.cash) + "¥"
