extends Node

const element_dir : String = "res://Materials/Elements/"
const recipe_dir : String = "res://Materials/Recipes/"

var list : Dictionary[String, Element] = {}
var recipes : Dictionary[Types.MachinesTypes, Array] = {  }

func _ready() -> void:
	#load all the elements
	var folderEl = DirAccess.open(element_dir)
	for file_name in folderEl.get_files():
		if !folderEl.file_exists(file_name):
			prints("Error while loading file:", file_name)
		var element = load(element_dir + file_name)
		if element is Element:
			list[element.id] = element
	
	#load all the recipes
	for type in Types.MachinesTypes.values():
		recipes[type] = []
		
	var folderRe = DirAccess.open(recipe_dir)
	for file_name in folderRe.get_files():
		if !folderRe.file_exists(file_name):
			prints("Error while loading file:", file_name)
		var recipe = load(recipe_dir + file_name)
		if recipe is Recipe:
			recipes[recipe.machine].append(recipe)

func craft(ingredient_list : Array[String], machine : Types.MachinesTypes, avrage_stability : float)->ElementInstance:
	var product : Element = null
	# first options
	for recipe in recipes[machine]:
		if recipe.sorted_components_id == ingredient_list:
			if avrage_stability > recipe.stability_range.x && avrage_stability < recipe.stability_range.y:
				product = list[recipe.product_id]
				break;
	
	if product != null:
		var element_instance : ElementInstance = ElementInstance.new()
		element_instance.element = product
		element_instance.value = product.basic_value
		return element_instance
	
	return null
