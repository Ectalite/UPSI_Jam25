extends Node

signal area_triggered

func _on_exit_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Hans"):
		emit_signal("area_triggered")
		
