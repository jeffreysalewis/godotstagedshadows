@tool

@icon("icon.png")

class_name StagedShadowBumpMap

extends Node2D

@export var bumpmap: AnimatedSprite2D
@export_tool_button("Normalize!")
var button = theyrenormal

#func _add_inspector_buttons() -> Array:
	#var buttons = []
	#buttons.push_back({
		#"name": "Test button",
		#"icon": preload("res://icon.svg"),
		#"pressed": _on_test_button_pressed
	#})
	#buttons.push_back({
		#"name": "Another button",
		#"pressed": _on_another_button_pressed
	#})
	#buttons.push_back({
		#"name": "Other button with lambda",
		#"pressed": func(): print('Lambda callback')
	#})
	#return buttons
#
#
#func _on_test_button_pressed() -> void:
	#print('Test pressed')
#
#
#func _on_another_button_pressed() -> void:
	#print('Another button pressed')

func _enter_tree() -> void:
	pass
	#editor_button_plugin = EditorButtonPlugin.new()
	#add_inspector_plugin(editor_button_plugin)


func _exit_tree() -> void:
	pass
	#if is_instance_valid(editor_button_plugin):
	#	remove_inspector_plugin(editor_button_plugin)
	#	editor_button_plugin = null

func theyrenormal() -> void:
	print("thenormal")
