extends BasicSlot
class_name ElementSlot

signal elementChanged()

@onready var texture_rect: TextureRect = $TextureRect

func _ready() -> void:
	set_texture_size()
	self_modulate.a = 0.3

func element_instance_changed():
	elementChanged.emit()
	if texture_rect:
		if element_instance && element_instance.element:
			texture_rect.texture = element_instance.element.texture
			mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		else:
			texture_rect.texture = null
			mouse_default_cursor_shape = Control.CURSOR_ARROW


func _on_mouse_exited() -> void:
	self_modulate.a = 0.3


func _on_mouse_entered() -> void:
	self_modulate.a = 1
