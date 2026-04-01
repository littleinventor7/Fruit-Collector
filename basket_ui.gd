extends CanvasLayer

@onready var l_apple: Label = $TileMap2/Sprite2D/Label2
@onready var l_orange: Label = $TileMap2/Sprite2D3/Label2
@onready var l_watermelon: Label = $TileMap2/Sprite2D6/Label2
@onready var l_prickly_pear: Label = $TileMap2/Sprite2D7/Label2
@onready var l_fig: Label = $TileMap2/Sprite2D8/Label2
@onready var l_dates: Label = $TileMap2/Sprite2D9/Label2
@onready var l_grapes: Label = $TileMap2/Sprite2D4/Label2
@onready var l_banana: Label = $TileMap2/Sprite2D5/Label2
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	l_apple.text = str(Global.num_apple)
	l_banana.text = str(Global.num_banana)
	l_dates.text = str(Global.num_dates)
	l_fig.text = str(Global.num_fig)
	l_grapes.text = str(Global.num_grapes)
	l_orange.text = str(Global.num_orange)
	l_prickly_pear.text = str(Global.num_prickly_pear)
	l_watermelon.text = str(Global.num_watermelon)
	pass
