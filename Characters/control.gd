extends Control
@onready var arm: TextureRect = $Arm

var isArmUp: bool = false

func _ready() -> void:
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:x", 1, 1.5)

func armRaise():
	if !isArmUp:
		arm.visible = true
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_IN)
		tween.tween_property(arm, "position:x", 70, 1.5)
		await tween.finished
		isArmUp = true
	else:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_IN)
		tween.tween_property(arm, "position:x", 0, 1.5)
		await tween.finished
		isArmUp = false
		arm.visible = false

func leave():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:x", -500, 1.5)

func _on_body_mouse_entered() -> void:
	print("enter")
	leave()
	#armRaise()
