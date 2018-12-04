extends Area


var is_already_hit = false

onready var animation = $Animation



func _on_Nail_area_entered(area):
	if area.name == "Hammer" and !is_already_hit:
		animation.play("hit")
