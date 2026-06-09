@tool

@icon("icon.png")

class_name MyButton
extends Button

func _enter_tree() -> void:
	pressed.connect(clicked)

func clicked():
	print("got this workin")
