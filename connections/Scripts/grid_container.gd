extends GridContainer
var x = 0
var y = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in self.get_children():
		get_child(x).text = Global.list[y][y]
		x += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
