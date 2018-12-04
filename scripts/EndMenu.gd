extends Node


var score_amount = 0



func _ready():
	$Score.bbcode_text = "[center]%d[/center]" % score_amount


func _on_Button_pressed():
	LevelManager.change_scene("Game")
