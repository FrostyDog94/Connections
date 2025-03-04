extends Control

var x = 1
var button 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button = preload("res://Objects/game_option.tscn")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _select_game_type(file):
	$Game_sel_buttons.visible = true
	$_game_type.visible = false
	$Back.visible = true
	$Title_Anatomy.visible = false
	
	Global.file = FileAccess.open(file, FileAccess.READ)
	
	
func _create_list():
	x = 1
	for v in $Game_sel_buttons/GridContainer.get_children():
		$Game_sel_buttons/GridContainer.remove_child(v)
		
	for i in range(Global.game_list.size() - 1):
		$Game_sel_buttons/GridContainer.add_child(button.instantiate())
	
	for n in $Game_sel_buttons/GridContainer.get_children():
		n.get_child(0).text = Global.game_list[x]
		if x < Global.game_list.size() - 1:
			x += 1
	Global.file.close()


func _on_an_p_button_pressed() -> void:
	Global.file_path = "res://Files/AnP/AnP_Data.csv"
	_select_game_type("res://Files/AnP/AnP_Data.csv")
	Global._create_game_list("res://Files/AnP/AnP_Data.csv")
	_create_list()


func _on_back_pressed() -> void:
	$Instructions_label.visible = false
	$Game_sel_buttons.visible = false
	$_game_type.visible = true
	$Back.visible = false
	$Quit_button.visible = true
	$Title_Anatomy.visible = true


func _on_herp_button_pressed() -> void:
	Global.file_path = "res://Files/Herp/Herp_Data.csv"
	_select_game_type("res://Files/Herp/Herp_Data.csv")
	Global._create_game_list("res://Files/Herp/Herp_Data.csv")
	_create_list()


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_instructions_button_pressed() -> void:
	$Title_Anatomy.visible = false
	$Quit_button.visible = false
	$Instructions_label.visible = true
	$_game_type.visible = false
	$Back.visible = true
