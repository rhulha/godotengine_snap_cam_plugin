tool
extends EditorPlugin

var dock = null

func _enter_tree():
	dock = preload("res://addons/snap_cam/snap_cam.scn").instance()
	add_control_to_container( CONTAINER_TOOLBAR, dock )

func _exit_tree():
	# Remove from docks (must be called so layout is updated and saved)
	remove_control_from_container(CONTAINER_TOOLBAR, dock)
	dock.free()
