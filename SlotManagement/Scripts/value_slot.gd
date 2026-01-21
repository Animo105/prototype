extends BasicSlot

@onready var label: Label = $Control/Label
@onready var texture_rect: TextureRect = $TextureRect

func _ready() -> void:
	set_texture_size()
	label.text = ""
	self_modulate.a = 0.3

func element_instance_changed():
	if texture_rect:
		if element_instance && element_instance.element:
			texture_rect.texture = element_instance.element.texture
		else:
			texture_rect.texture = null
	if label && element_instance:
		label.text = "%2.f$" % element_instance.value
	else:
		
		label.text = ""


func _on_mouse_exited() -> void:
	self_modulate.a = 0.3


func _on_mouse_entered() -> void:
	self_modulate.a = 1
