extends GridContainer
var x = randi_range(0, 3)
var y = randi_range(0, 3)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in self.get_children():
		n.text = Global.list[x][y]
		
		x = randi_range(0, 3)
		y = randi_range(0, 3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
