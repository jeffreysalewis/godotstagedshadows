@tool

@icon("icon.png")

class_name StagedShadowLight
extends DirectionalLight2D


@export var luzdir = Vector3(0.0, 0.0, 0.0):
	set(new_setting):
			luzdir = new_setting
			# Emit a signal when the property is changed.
			emit_signal("editor_state_changed")
			#changed.emit()
@export var luzdir2d = Vector2(0.0, 0.0):
	set(new_setting):
			luzdir2d = new_setting
			# Emit a signal when the property is changed.
			emit_signal("editor_state_changed")
			#changed.emit()
var toolbar
var oldrot = 0.0
var oldheight = 0.5

func _process(delta: float) -> void:
	if oldrot != rotation:
		emit_signal("editor_state_changed")
		oldrot = rotation
	if oldheight != height:
		emit_signal("editor_state_changed")
		oldheight = height

#func _set(property: String, value) -> bool:
	#if !(property in property_list): # property_list is a global variable 
		#print("property %s is not in property_list" % property)
		#return false
	#else:
		#print("emitting property changed signal now")
		#emit_signal("PropertyChanged", property, value);
		#return true

func _enter_tree() -> void:
	#toolbar = preload("res://")
	pass

func getluzdir():
	return luzdir;

func getrot():
	return rotation

func getheight():
	return height


#
#func _on_property_list_changed() -> void:
	#emit_signal("editor_state_changed")
