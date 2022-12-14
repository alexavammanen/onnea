extends Control

signal kana

func _on_Button_pressed():
	hide()
	emit_signal("kana")
