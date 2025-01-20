extends Control

var x = 1
var button 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button = preload("res://Objects/game_option.tscn")
	
	for i in range(Global.game_list.size()):
		$CenterContainer/GridContainer.add_child(button.instantiate())
		
	for n in $CenterContainer/GridContainer.get_children():
		n.text = Global.game_list[x]
		if x < Global.game_list.size() - 1:
			x += 1
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
