extends Control

@onready var book_cover: TextureRect = $BookCover

var is_opened : bool = false

func _ready() -> void:
	book_cover.visible = true
