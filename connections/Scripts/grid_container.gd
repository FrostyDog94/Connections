extends GridContainer
var z = 0
var score : int = -1
var victory : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.list.shuffle()
	
	for n in self.get_children():
		n.new_tile = Global.list[z]
		n.text = Global.list[z].word
		
		z += 1
		
		
func _process(delta: float) -> void:
	pass
		
		
func _check_selected():
	for item in Global.selected:
			if item != Global.selected.front():
				victory = false
				break
			else:
				victory = true		
	if victory == true:
		score += 1
		for n in self.get_children():
			if n.button_pressed == true:
				n.toggle_mode = false
				self.move_child(n, score * 4)
		
	print(victory)
	
	if score >= 3:
		print("You win!")		

#Submit button
func _on_button_pressed() -> void:
	if Global.buttons_pressed >= 4:
		_check_selected()
		for n in self.get_children():
			n.button_pressed = false
		Global.buttons_pressed = 0	
		Global.selected.clear()
