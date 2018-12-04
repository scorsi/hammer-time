extends Area


onready var animation = $Animation

var is_nail_hit = false


signal good_hit
signal bad_hit



func hit():
	animation.play("hit")


func _input(event):
	if (event is InputEventMouseButton or InputEventScreenTouch) and event.is_pressed():
		hit()


func check_nail_hit():
	if !is_nail_hit:
		emit_signal("bad_hit")
	
	is_nail_hit = false


func _on_Hammer_area_entered(area):
	if area.is_in_group("Nails"):
		if area.is_already_hit:
			emit_signal("bad_hit")
		else:
			area.is_already_hit = true
			is_nail_hit = true
			emit_signal("good_hit")
