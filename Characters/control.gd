extends TextureRect
@onready var arm: TextureRect = $Arm
@onready var textbox: Label = $"../Textbox"

var dialogue: Array[String] = ["HELLO","SOAP_PLEASE","ME_BACK_MIDNIGHT"]
var currentDialogue: int = 0 :
	set(value):
		currentDialogue = clamp(value, 0, 2)

var isArmUp: bool = false
var armOrigin: Vector2
var tween: Tween

func _ready() -> void:
	textbox.text = dialogue[0]
	armOrigin = arm.position
	tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:x", 300, 2)
	await tween.finished
	textbox.visible = true

func armRaise():
	if !isArmUp:
		arm.visible = true
		tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_IN)
		tween.tween_property(arm, "position", armOrigin + Vector2(180,-200), 1.2)
		await tween.finished
		isArmUp = true
	else:
		tween = create_tween()
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_IN)
		tween.tween_property(arm, "position", armOrigin + Vector2(0,0), 1.5)
		await tween.finished
		isArmUp = false
		arm.visible = false

func leave():
	tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:x", -700, 1.5)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interract"):
		currentDialogue += 1
		textbox.text = dialogue[currentDialogue]
		if currentDialogue == 1 || currentDialogue > 1:
			armRaise()
			print("skip")
	if currentDialogue == 2:
		await tween.finished
		leave()
		textbox.visible = false
