extends Node3D

var num:int = 0
const Wall = preload("res://flying_wall.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	%Start.start(5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_timeout():
	print("works")
	%Spawn1.start(5)
	%Start.stop()
	pass # Replace with function body.


#have first timer go a certain number of times then start a new timer

#have it emit a signal to wall that says which direction to move in physics process
#or just have it change values. look at wizards code

func _on_spawn_1_timeout():
	print("work ",num)
	var spawned:NormalWall = Wall.instantiate()
	spawned.global_position = %SpawnLocation1.global_position 
	spawned.direction = 1
	add_child(spawned)
	
	pass # Replace with function body.
