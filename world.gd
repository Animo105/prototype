extends Control

@onready var element_slot: ElementSlot = $GridContainer/ElementSlot
@onready var element_slot_2: ElementSlot = $GridContainer/ElementSlot2
@onready var element_slot_3: ElementSlot = $GridContainer/ElementSlot3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var element_instance : ElementInstance = ElementInstance.new()
	element_instance.element = Elements.list["air"]
	element_slot.element_instance = element_instance
	element_instance = ElementInstance.new()
	element_instance.element = Elements.list["earth"]
	element_slot_2.element_instance = element_instance
	element_instance = ElementInstance.new()
	element_instance.element = Elements.list["fire"]
	element_slot_3.element_instance = element_instance
	element_instance = ElementInstance.new()
	element_instance.element = Elements.list["water"]
	element_slot_3.element_instance = element_instance
