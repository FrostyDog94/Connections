extends GridContainer
var z = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.list.shuffle()
	
	for n in self.get_children():
		n.text = Global.list[z].word
		
		z += 1
func _process(delta: float) -> void:
	if Global.buttons_pressed == 4:
		for n in self.get_children():
			n.button_pressed = false;
		Global.buttons_pressed = 0	
		
