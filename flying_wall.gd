class_name NormalWall
extends StaticBody3D


var x_z:bool # true is x, false is z
var direction:int

var travelled_distance:float = 0.0
const SPEED:float = 1.4 #base is 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(x_z):
		global_position.x += direction * delta * SPEED
	else:
		global_position.z += direction * delta * SPEED
	travelled_distance += abs(direction) * delta * SPEED
	if (travelled_distance > 40):
		queue_free()
	
	pass


