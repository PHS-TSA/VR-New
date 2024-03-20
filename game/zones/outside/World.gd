extends Node3D

const Wall = preload("res://flying_wall.tscn")
const duckWall = preload("res://duck_wall.tscn")
var num:int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	%Start.start(1)


func _on_start_timeout():
	%Spawn1.start(5)
	%Start.stop()


#have first timer go a certain number of times then start a new timer

#have it emit a signal to wall that says which direction to move in physics process
#or just have it change values. look at wizards code

func _on_spawn_1_timeout():
	num = randi_range(0,1)
	wall_spawn(num)

#use case switch with ran num for spawn location in wall spawn function
#goona need to change code below to reflect the directiosn the walls need to go

func wall_spawn(i:int):
	var random = randi_range(1,8)
	var spawned:NormalWall
	if(i==0):
		spawned = Wall.instantiate()
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
	elif(i==1):
		spawned = duckWall.instantiate()
		print("DUCK")
		match (random): #I know this isn't super efficient eli but the judges are just watching a video. its fine
			1,2:
				spawned.x_z = false
				spawned.direction = 1
				spawned.global_position = %DuckSpawnLocation1.global_position 
			3,4:
				spawned.x_z = true
				spawned.direction = 1
				spawned.global_position = %DuckSpawnLocation2.global_position
				spawned.rotation.y = PI/2
			5,6:
				spawned.x_z = false
				spawned.direction = -1
				spawned.global_position = %DuckSpawnLocation3.global_position 
			7,8:
				spawned.x_z = true
				spawned.direction = -1
				spawned.global_position = %DuckSpawnLocation4.global_position
				spawned.rotation.y = PI/2
	else:
		print("Erm what the scallop this shouldnt run")
	add_child(spawned)




#func _on_area_3d_body_exited(body):
	#print("work")
	#get_parent().get_node("XROrgin3D").globalposition = %Spawn.globalposition
	#pass # Replace with function body.


#func _on_area_3d_area_exited(area):
	#print("work")
	#get_node("../XROrigin3D").globalposition = %Spawn.globalposition
