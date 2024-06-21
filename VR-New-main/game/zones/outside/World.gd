extends Node3D

const Wall = preload("res://flying_wall.tscn")
const DuckWall = preload("res://duck_wall.tscn")
var num: int = 0
var repeat: int = 0
var wall_list: Array[StaticBody2D] = []

#have first timer go a certain number of times then start a new timer

#have it emit a signal to wall that says which direction to move in physics process
#or just have it change values. look at wizards code


func _on_spawn_1_timeout():
	num = randi_range(0, 1)
	wall_spawn(num)
	repeat += 1
	if repeat >= 20:
		%Spawn1.stop()
		print(wall_list)
		for child in self.get_children():
			if child.has_method("funny"):
				child.queue_free()
		%WinLabel1.visible = true
		%WinLabel2.visible = true
		%WinLabel3.visible = true
		%WinLabel4.visible = true


func wall_spawn(i: int):
	var random = randi_range(1, 8)
	var spawned: NormalWall
	if i == 0:
		spawned = Wall.instantiate()
		# I know this isn't super efficient eli but the judges are just watching a video. its fine
		match random:
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
				spawned.rotation.y = PI / 2
			4:
				spawned.x_z = true
				spawned.direction = 1
				spawned.global_position = %SpawnLocation4.global_position
				spawned.rotation.y = PI / 2
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
				spawned.rotation.y = PI / 2
			8:
				spawned.x_z = true
				spawned.direction = -1
				spawned.global_position = %SpawnLocation8.global_position
				spawned.rotation.y = PI / 2
	elif i == 1:
		spawned = DuckWall.instantiate()
		print("DUCK")
		match random:
			1, 2:
				spawned.x_z = false
				spawned.direction = 1
				spawned.global_position = %DuckSpawnLocation1.global_position
			3, 4:
				spawned.x_z = true
				spawned.direction = 1
				spawned.global_position = %DuckSpawnLocation2.global_position
				spawned.rotation.y = PI / 2
			5, 6:
				spawned.x_z = false
				spawned.direction = -1
				spawned.global_position = %DuckSpawnLocation3.global_position
			7, 8:
				spawned.x_z = true
				spawned.direction = -1
				spawned.global_position = %DuckSpawnLocation4.global_position
				spawned.rotation.y = PI / 2
	else:
		print("Erm what the scallop this shouldnt run")
	wall_list.append(spawned)
	add_child(spawned)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "PlayerBody":
		%XROrigin3D.global_position = (%Spawn as Marker3D).global_position


func _on_audio_stream_player_3d_finished():
	%Audio.stream_paused = false
	%Audio.play()


func _on_video_stream_player_finished() -> void:
	%Audio.stream_paused = false
	%Audio.play()
	%Screen.visible = false
	%VideoStreamPlayer.paused = true
	%Spawn1.start(4)
	%VideoStreamPlayer.paused = false
