extends Node2D

@onready var interaction_area: InteractionArea = $Node2D/InteractionArea

func _ready() -> void:
	interaction_area.interact = Callable(self, "_toggle_fishing_expedition")
	
func _toggle_fishing_expedition() -> void:
	print('going on a trip!')
