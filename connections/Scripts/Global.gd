extends Node

var buttons_pressed = 0

var tries = 4

var list = [
	tile.new("Stitch", "Disney Characters"), tile.new("Belle", "Disney Characters"), tile.new("Elsa", "Disney Characters"), tile.new("Mickey", "Disney Characters"),
	tile.new("Blue", "Colors"), tile.new("Red", "Colors"), tile.new("Purple", "Colors"), tile.new("Green", "Colors"),
	tile.new("Honda", "Cars"), tile.new("Ford", "Cars"), tile.new("Mustang", "Cars"), tile.new("Nissan", "Cars"),
	tile.new("Dog", "Animals"), tile.new("Cat", "Animals"), tile.new("Bat", "Animals"), tile.new("Owl", "Animals")
]

var new_list = []

var selected : Array

func _ready() -> void:
	var file = FileAccess.open("res://Files/Biology Connections Terms.csv", FileAccess.READ)	
	while !file.eof_reached():
		var content = file.get_csv_line()
		if content[0] == "axial skeleton":
			new_list.append(tile.new(content[2], content[1]))
			new_list.append(tile.new(content[3], content[1]))
			new_list.append(tile.new(content[4], content[1]))
			new_list.append(tile.new(content[5], content[1]))
