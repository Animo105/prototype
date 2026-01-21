extends BasicSlot
class_name ProductSlot

@onready var texture_rect: TextureRect = $TextureRect

func _ready() -> void:
	set_texture_size()
	self_modulate.a = 0.4

func element_instance_changed():
	if texture_rect:
		if element_instance && element_instance.element:
			texture_rect.texture = element_instance.element.texture
			self_modulate.a = 1
			mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		else:
			texture_rect.texture = null
			self_modulate.a = 0.4
			mouse_default_cursor_shape = Control.CURSOR_ARROW

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return false
