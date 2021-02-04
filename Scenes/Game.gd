extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var block_prefab = preload("res://Prefabs/Block.tscn")
var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	update_score()
	$Timer.start()
	
func get_multiplier():
	return int(round(score / 10))

func update_score():
	$HUD/Score.text = String(score)

func _input(event):
	if event is InputEventKey && not event.is_echo():
		var blocks = $Blocks.get_children()
		for block in blocks:
			if block.has_method("check_input"):
				block.check_input(event.scancode)

func spawn_new_block():
	var block = block_prefab.instance(get_multiplier())
	block.global_position = random_position()
	block.multiplier = get_multiplier()
	$Blocks.add_child(block)

func random_position():
	randomize()
	var rect = get_viewport().size
	var random_position = rand_range(20, rect.x -20)
	return Vector2(random_position, 0)
	
func score_up():
	score += 1
	update_score()

func _on_Timer_timeout():
	spawn_new_block()
