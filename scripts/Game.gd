extends Node


onready var score_text = $Score

var score = 0



func _ready():
	score_text.text = str(score)


func _on_Hammer_good_hit():
	score += 1
	score_text.text = str(score)


func _on_Hammer_bad_hit():
	LevelManager.load_end_game(score)
