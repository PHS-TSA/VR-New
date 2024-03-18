extends Node3D

var num:int = 0
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

func _on_spawn_1_timeout():
	print("work ",num)
	pass # Replace with function body.
