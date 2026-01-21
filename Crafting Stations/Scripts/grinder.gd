extends Control

@onready var element_slot: ElementSlot = $ElementSlot
@onready var product_slot: ProductSlot = $ProductSlot


func _on_button_pressed() -> void:
	if element_slot.element_instance && element_slot.element_instance.element:
		var ingredient : Array[String] = [ element_slot.element_instance.element.id ]
		var product = Elements.craft(ingredient, Types.MachinesTypes.GRINDER, 1)
		if product != null:
			element_slot.element_instance = null
			product_slot.element_instance = product
