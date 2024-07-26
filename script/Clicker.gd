class_name Clicker
extends Control
## a clicker that counts click count from a button.

@export var label : Label

var click: int = 0

func _ready() -> void:
	update_label_text()

func create_click() -> void:
	click += 1
	update_label_text()

func update_label_text() -> void:
	label.text = "Click Counts: " + str(click)

func _on_button_pressed() -> void:
	create_click()
