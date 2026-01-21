extends Control

@onready var element_slot: ElementSlot = $ElementSlot
@onready var element_slot_3: ElementSlot = $ElementSlot3
@onready var element_slot_4: ElementSlot = $ElementSlot4

@onready var product_slot: ProductSlot = $ProductSlot

func _on_button_pressed() -> void:
	var ingredients : Array[String] = []
	if !element_slot.element_instance or !element_slot_3.element_instance or !element_slot_4.element_instance: return
	ingredients.append(element_slot.element_instance.element.id)
	ingredients.append(element_slot_3.element_instance.element.id)
	ingredients.append(element_slot_4.element_instance.element.id)
	ingredients.sort()
	
	var product : ElementInstance = Elements.craft(ingredients,Types.MachinesTypes.TRANSMUTATION, 1)
	if product == null:
		print(ingredients)
		return
	element_slot.element_instance = null
	element_slot_3.element_instance = null
	element_slot_4.element_instance = null
	product_slot.element_instance = product
