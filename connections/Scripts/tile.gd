extends Button

var new_tile : tile

func _on_button_down() -> void:
	Global.selected.sort()
	if button_pressed == false:
		if Global.buttons_pressed < 4:
			Global.buttons_pressed += 1
			Global.selected.append(new_tile.category)
			print(Global.selected)
		elif Global.buttons_pressed >= 4:
			button_pressed = true
	elif button_pressed == true:
		button_pressed = true
		Global.buttons_pressed -= 1		
		Global.selected.remove_at(Global.selected.bsearch(new_tile.category))
		
		print(Global.selected)
	
