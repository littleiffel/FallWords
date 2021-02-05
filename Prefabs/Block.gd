extends RigidBody2D



export var SPEED = 50
var multiplier = 0
var character
var destroyed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	gravity_scale += multiplier * 2
	character = randi()% 26 + 65
	$Label.text = (char(character)).to_lower()

func check_input(input):
	if input == character and not destroyed:
		destroyed = true
		get_tree().call_group("GameManager", "score_up")
		$AnimationPlayer.play("Destroy")
	pass

func remove():
	queue_free()
