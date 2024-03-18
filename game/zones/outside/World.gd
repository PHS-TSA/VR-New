extends Node3D

var num:int = 0
const Wall = preload("res://flying_wall.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	%Start.start(1)
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
	normal_wall_spawn()
	pass # Replace with function body.

#use case switch with ran num for spawn location in wall spawn function
#goona need to change code below to reflect the directiosn the walls need to go

func normal_wall_spawn():
	var random = randi_range(1,8)
	print(random)
	var spawned:NormalWall = Wall.instantiate()
	match (random): #I know this isn't super efficient eli but the judges are just watching a video. its fine
		1:
			spawned.x_z = false
			spawned.direction = 1
			spawned.global_position = %SpawnLocation1.global_position 
		2:
			spawned.x_z = false
			spawned.direction = 1
			spawned.global_position = %SpawnLocation2.global_position 
		3:
			spawned.x_z = true
			spawned.direction = 1
			spawned.global_position = %SpawnLocation3.global_position
			spawned.rotation.y = PI/2
		4:
			spawned.x_z = true
			spawned.direction = 1
			spawned.global_position = %SpawnLocation4.global_position 
			spawned.rotation.y = PI/2
		5:
			spawned.x_z = false
			spawned.direction = -1
			spawned.global_position = %SpawnLocation5.global_position 
		6:
			spawned.x_z = false
			spawned.direction = -1
			spawned.global_position = %SpawnLocation5.global_position 
		7:
			spawned.x_z = true
			spawned.direction = -1
			spawned.global_position = %SpawnLocation7.global_position
			spawned.rotation.y = PI/2
		8:
			spawned.x_z = true
			spawned.direction = -1
			spawned.global_position = %SpawnLocation8.global_position 
			spawned.rotation.y = PI/2
	add_child(spawned)
