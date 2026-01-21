@abstract extends PanelContainer
class_name BasicSlot

@abstract func element_instance_changed()

func _init() -> void:
	set_texture_size()

func _ready() -> void:
	set_texture_size()

func set_texture_size():
	custom_minimum_size = Settings.TextureSize
	size = Settings.TextureSize

var element_instance : ElementInstance :
	set = set_element_instance
		

func set_element_instance(value : ElementInstance):
	if value != element_instance:
		element_instance = value
		element_instance_changed()

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is BasicSlot

func _get_drag_data(_at_position: Vector2) -> Variant:
	if !element_instance:
		return null
	
	var preview_texture : TextureRect = TextureRect.new()
	preview_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_texture.size = Settings.TextureSize
	preview_texture.texture = element_instance.element.texture
	
	var preview : Control = Control.new()
	preview.add_child(preview_texture)
	preview_texture.position = -Settings.TextureSize/2
	set_drag_preview(preview)
	
	return self

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if data is BasicSlot:
		var temp : ElementInstance = data.element_instance
		data.element_instance = element_instance
		element_instance = temp
