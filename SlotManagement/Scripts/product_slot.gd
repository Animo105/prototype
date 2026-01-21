extends BasicSlot
class_name ProductSlot

@onready var texture_rect: TextureRect = $TextureRect

func _ready() -> void:
	self_modulate.a = 0.4

func element_instance_changed():
	if texture_rect:
		if element_instance && element_instance.element:
			texture_rect.texture = element_instance.element.texture
			self_modulate.a = 1
		else:
			texture_rect.texture = null
			self_modulate.a = 0.4

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return false
