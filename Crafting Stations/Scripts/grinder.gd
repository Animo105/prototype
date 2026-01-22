extends Control

@onready var lid: TextureRect = $Lid
@onready var button: Button = $Button

@onready var element_slot: ElementSlot = $ElementSlot

var is_opened : bool = false
var product : ElementInstance = null

func _ready() -> void:
	element_slot.elementChanged.connect(select_product)
	button.disabled = true

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		is_opened = !is_opened
		var tween = create_tween()
		if is_opened:
			tween.tween_property(lid, "rotation", -2.15, 0.1)
			button.visible = false
		else:
			tween.tween_property(lid, "rotation", 0, 0.1)
			button.visible = true

func select_product():
	if element_slot.element_instance && element_slot.element_instance.element:
		var ingredient : Array[String] = [ element_slot.element_instance.element.id ]
		product = Elements.craft(ingredient, Types.MachinesTypes.GRINDER, 1)
		button.disabled = !product
		if product:
			button.mouse_filter = Control.MOUSE_FILTER_STOP
		else:
			button.mouse_filter = Control.MOUSE_FILTER_IGNORE

func _on_button_pressed() -> void:
	if is_opened: return
	if !product: return
	element_slot.element_instance = product
