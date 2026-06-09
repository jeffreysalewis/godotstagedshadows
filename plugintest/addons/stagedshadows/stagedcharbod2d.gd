@tool

@icon("icon.png")

class_name StagedCharacterBody2D
extends CharacterBody2D

@export var luz: StagedShadowLight:
	set(new_resource):
			luz = new_resource
			# Connect the changed signal as soon as a new resource is being added.
			if luz != null:
				luz.editor_state_changed.connect(_setskew)
				luz.editor_state_changed.connect(_setyscale)
				#luz.connect(_setskew, luz.NOTIFICATION_LOCAL_TRANSFORM_CHANGED)
				#luz.NOTIFICATION_LOCAL_TRANSFORM_CHANGED.connect(_setskew)
				#luz.editor_state_changed.connect(_setskew)
var speed := 1500
var currentdir := "none"

#func _process(delta: float) -> void:
	#$AnimatedSprite2D2.skew = luz.luzdir.angle_to(Vector3(0, 1, 0))

func _setskew() -> void:
	#var j = Vector3(cos(luz.rotation), sin(luz.rotation), 0)
	var jj = Vector2(cos(luz.rotation), -1.0 * sin(luz.rotation))
	#$AnimatedSprite2D2.skew = luz.luzdir.signed_angle_to(Vector3(0, 1, 0), Vector3(0, 0, 1))
	$AnimatedSprite2D2.skew = jj.angle_to(Vector2(0, 1))
	#$AnimatedSprite2D2.skew = j.angle_to(Vector3(0, 1, 0))

func _setyscale() -> void:
	#var h = 
	$AnimatedSprite2D2.scale.y = tan(luz.height * PI / 2.0)
	#if $AnimatedSprite2D2.scale.y < 0:
		#shadow stuffs
	pass

#func _draw() -> void:
	#$AnimatedSprite2D2.skew = luz.luzdir.angle_to(Vector3(0, 1, 0))

#func _ready():
	#$AnimatedSprite2D2.skew = luz.getluzdir().angle_to(Vector3(0, 1, 0))
	#print(luz.getluzdir())
	#print(luz.getluzdir().angle_to(Vector3(0, 1, 0)))
		

func _physics_process(delta: float) -> void:
	playermovement(delta)


func playermovement(_delta):
	#if Input.is_action_pressed("ui_run"):
		#speed = 3000
	#else:
		#speed = 1500
	if Input.is_action_pressed("ui_right"):
		currentdir = "right"
		playanim(1)
		velocity.x = speed;
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		currentdir = "left"
		playanim(1)
		velocity.x = -speed;
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		currentdir = "down"
		playanim(1)
		velocity.y = speed;
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		currentdir = "up"
		playanim(1)
		velocity.y = -speed;
		velocity.x = 0
	else:
		playanim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func playanim(movement):
	var dir := currentdir
	var anim := $AnimatedSprite2D
	var anim2 := $AnimatedSprite2D2
	var shad := ""
	
	if dir == "down":
		#anim.flip_h = false
		if movement == 1:
			anim.play("frontrun")
			anim2.play("frontrun")
		elif movement == 0:
			anim.play("frontidle")
			anim2.play("frontidle")
	elif dir == "up":
		#anim.flip_h = false
		if movement == 1:
			anim.play("backrun")
			anim2.play("backrun")
		elif movement == 0:
			anim.play("backidle")
			anim2.play("backidle")
	elif dir == "left":
		#anim.flip_h = false
		if movement == 1:
			anim.play("leftrun")
			anim2.play("leftrun")
		elif movement == 0:
			anim.play("leftidle")
			anim2.play("leftidle")
	elif dir == "right":
		#anim.flip_h = false
		if movement == 1:
			anim.play("rightrun")
			anim2.play("rightrun")
		elif movement == 0:
			anim.play("rightidle")
			anim2.play("rightidle")
