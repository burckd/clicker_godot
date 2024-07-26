class_name ClickGenerator
extends Control
## timer based click generator

@export var label : Label
@export var button : Button
@export var timer : Timer

@onready var timer_limit = $TimerLimit

var click: int = 0
var count: int = 2

func _ready() -> void:
	update_label_text()
	update_button_text()

func create_click() -> void:
	click += 1
	update_label_text()

func update_label_text() -> void:
	label.text = "Auto Clicked Count: " + str(click)

func update_button_text() -> void:
	button.text = "Start " + str(count)

func begin_generating_click() -> void:
	count += count
	timer.start()
	timer_limit.start()
	timer_limit.wait_time = count
	button.disabled = true

func _on_button_pressed():
	begin_generating_click()

func _on_timer_timeout():
	create_click()

func _on_timer_limit_timeout():
	timer.stop()
	update_button_text()
	button.disabled = false
