extends Button

var new_tile : tile

var gs = Global.selected

func _ready() -> void:
	self.autowrap_mode = TextServer.AUTOWRAP_WORD
	
func _on_button_down() -> void:
	gs.sort()
	if button_pressed == false:
		if Global.buttons_pressed < 4:
			Global.buttons_pressed += 1
			gs.append(new_tile.category)
			print(gs)
		elif Global.buttons_pressed >= 4:
			button_pressed = true
	elif button_pressed == true:
		button_pressed = true
		Global.buttons_pressed -= 1
		gs.remove_at(gs.bsearch(new_tile.category))
		
		print(gs)
	
