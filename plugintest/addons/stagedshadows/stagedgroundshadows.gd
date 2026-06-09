@tool

@icon("icon.png")

class_name StagedGroundShadow
extends Node2D

@export var luz: StagedShadowLight
@export var cha: CharacterBody2D
@export var animref: AnimatedSprite2D

func _enter_tree() -> void:
	pass


func castshadow() -> void:
	#animref.frame
	pass
