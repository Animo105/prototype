extends BasicSlot
@onready var texture_rect: TextureRect = $TextureRect

@export var element_produced : Element
@export var produced_stability : int = 0
@export var produced_purity : float = 0
@export var produced_value : float = 0.0

var produced_instance : ElementInstance

func _ready() -> void:
	if element_produced == null:
		push_error("Infinite Slot without element to produce")
		queue_free()
		return
		
	produced_instance = ElementInstance.new()
	produced_instance.element = element_produced
	produced_instance.stability = produced_stability
	produced_instance.purity = produced_purity
	produced_instance.value = produced_value
	element_instance = produced_instance
	texture_rect.texture = element_produced.texture

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return false

func element_instance_changed():
	pass

func set_element_instance(_value : ElementInstance):
	element_instance = produced_instance
