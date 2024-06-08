extends StateMachine

func get_objects_in_rect(rect: Rect2, objects: Array):
	var objects_arr: Array = []
	var camera = get_viewport().get_camera_3d()
	for object in objects:
		if rect.has_point(camera.unproject_position(object.global_position)): objects_arr.append(object)
	return objects_arr

func get_world_mouse_position(position: Vector2):
	var result = get_world_point(position)
	return result.get("position") if result.has("position") else Vector3()

func get_world_point(position: Vector2):
	var camera = get_tree().get_root().get_camera_3d()
	var parameters = PhysicsRayQueryParameters3D.create(camera.project_ray_origin(position), camera.project_ray_normal(position) * 99999)
	var result = get_parent().get_world_3d().direct_space_state.intersect_ray(parameters)
	return result
