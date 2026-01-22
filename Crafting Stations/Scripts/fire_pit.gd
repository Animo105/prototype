extends Control

@onready var pit: TextureRect = $Pit
@onready var fuel_level_timer: Timer = $fuelLevel

@onready var element_slot: ElementSlot = $ElementSlot

var fire_up3_texture : Texture2D
var fire_up2_texture : Texture2D
var fire_up1_texture : Texture2D
var fire_cold_texture : Texture2D

var fuel_tier : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fuel_tier = 0
	fire_up3_texture = load("res://Assets/firepitt3.png")
	fire_up2_texture = load("res://Assets/firepitt2.png")
	fire_up1_texture = load("res://Assets/firepit.png")
	fire_cold_texture = load("res://Assets/firepit_cold.png")
	pit.texture = fire_cold_texture


func _on_timer_timeout() -> void:
	fuel_tier -= 1
	match fuel_tier:
		2:
			pit.texture = fire_up2_texture
			fuel_level_timer.start()
		1:
			pit.texture = fire_up1_texture
			fuel_level_timer.start()
		0:
			pit.texture = fire_cold_texture 
	


func _on_button_pressed() -> void:
	if element_slot.element_instance && element_slot.element_instance.element:
		var tags : Array[Types.Tags] = element_slot.element_instance.element.tags
		if tags.find(Types.Tags.FUEL_T1):
			fuel_tier = 1
			pit.texture = fire_up3_texture
		
		if tags.find(Types.Tags.FUEL_T2):
			fuel_tier = 2
			pit.texture = fire_up2_texture
		
		if tags.find(Types.Tags.FUEL_T3):
			fuel_tier = 3
			pit.texture = fire_up1_texture
