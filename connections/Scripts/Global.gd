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

var content

var game_list = []

var file 

var file_path = "res://Files/AnP/AnP_Data.csv"

#var game = "skull 1"

func _ready() -> void:
	file = FileAccess.open("res://Files/AnP/AnP_Data.csv", FileAccess.READ)
	_create_game("skull 1")
	
	
func _create_game(game):
	file = FileAccess.open(file_path, FileAccess.READ)
	game_list.clear()
	new_list.clear()
	while !file.eof_reached():
		content = file.get_csv_line()
		if content[0] == game:
			new_list.append(tile.new(content[2], content[1]))
			new_list.append(tile.new(content[3], content[1]))
			new_list.append(tile.new(content[4], content[1]))
			new_list.append(tile.new(content[5], content[1]))
		if !game_list.has(content[0]):
			game_list.append(content[0])
	file.close()
	
	
func _create_game_list(filex):
	file = FileAccess.open(filex, FileAccess.READ)
	game_list.clear()
	
	while !file.eof_reached():
		content = file.get_csv_line()
		if !game_list.has(content[0]):
			game_list.append(content[0])
	file.close()
	

	
