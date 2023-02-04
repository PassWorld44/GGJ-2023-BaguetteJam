extends StaticBody


var length = 2 setget set_length

onready var col = $CollisionShape
onready var mesh = $MeshInstance
onready var raycast = $RayCast

func set_last_collision(last_collision:StaticBody):
	if is_instance_valid(last_collision):
		var pos_to_last = last_collision.global_translation
		look_at(pos_to_last,Vector3.UP)
		set_length(global_translation.distance_to(pos_to_last)+ 0.75)
		if !raycast.is_colliding():
			if length > 1:
				var new_collision = duplicate()
				new_collision.length = 2
				CollisionManager.add_child(new_collision)

func set_length(new_length:int):
	col.shape.height = new_length 
	col.translation.z = -new_length/2.0
	mesh.mesh.height = new_length
	mesh.translation.z = -new_length/2.0
	$ball2.translation.z = -new_length
	raycast.translation.z = -new_length
