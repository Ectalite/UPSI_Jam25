extends Node2D

signal waterfall_enterred

func _on_waterfall_collision_body_entered(body: Node2D) -> void:
	if body.is_in_group("Hans"):
		waterfall_enterred.emit()
