extends KinematicBody2D



export var SPEED = 50
var character
var destroyed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	character = randi()% 26 + 65
	$Label.text = (char(character)).to_lower()

func _process(delta):
	var direction_vector := Vector2(0,1)
	move_and_collide(direction_vector * delta * SPEED)


func check_input(input):
	if input == character and not destroyed:
		destroyed = true
		get_tree().call_group("GameManager", "score_up")
		$AnimationPlayer.play("Destroy")
	pass

func remove():
	queue_free()