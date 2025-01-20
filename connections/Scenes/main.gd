extends Control
var z = 0
var score : int = -1
var victory : bool
var complete_theme = load("res://Themes/Tile_complete.tres")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.new_list.shuffle()
	
	for n in $CenterContainer/GridContainer.get_children():
		n.new_tile = Global.new_list[z]
		n.get_child(0).text = Global.new_list[z].word.to_upper()
		
		z += 1
	
		
func _check_selected():
	for item in Global.selected:
			if item != Global.selected.front():
				victory = false
				Global.tries -= 1
				break
			else:
				victory = true		
	if victory == true:
		score += 1
		for n in $CenterContainer/GridContainer.get_children():
			if n.button_pressed == true:
				n.toggle_mode = false
				$CenterContainer/GridContainer.move_child(n, score * 4)
				n.set_theme(complete_theme)
		$Categories.get_child(score).text = Global.selected.front().to_upper()
	print(victory)
	
	if score >= 3:
		$UIText.text = "You win!"
	
	if Global.tries <= 0:
		$UIText.text = "Next time!"
		for n in $CenterContainer/GridContainer.get_children():
			n.disabled = true
			

#Submit button
func _on_submit_pressed() -> void:
	if Global.buttons_pressed >= 4:
		_check_selected()
		for n in $CenterContainer/GridContainer.get_children():
			n.button_pressed = false
		Global.buttons_pressed = 0	
		Global.selected.clear()

#Clear
func _on_clear_pressed() -> void:
	Global.buttons_pressed = 0	
	Global.selected.clear()
	#print(Global.buttons_pressed)
	#print(Global.selected)
	for n in $CenterContainer/GridContainer.get_children():
			n.button_pressed = false
