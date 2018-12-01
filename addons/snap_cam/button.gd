tool
extends Button

var edi

func _ready():
	var plugin = EditorPlugin.new()
	edi = plugin.get_editor_interface();
	plugin.queue_free()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func clicked():
	print("SnapCam executing.")
	#var a = EditorNode.get_singleton()
	#print(a)
	print("This script makes the camera look at the selected object.")
	print("Camera must be named \"Camera\" and must be a direct child of the RootNode.")
	print("Also the camera looks at the local translation of the selected object.")
	if edi == null:
		_ready()
	var root = edi.get_edited_scene_root();
	var sel = edi.get_selection().get_selected_nodes()
	if len(sel) != 1:
		print("Please select one scene object other than the camera.")
		return
	var cam = root.get_node("Camera")
	if cam == null:
		print("Please name your Camera \"Camera\" and make sure it is a child of the root node.")
		return
	if cam != sel[0]:
		cam.look_at(sel[0].translation, Vector3(0,1,0))
	else:
		print("Please select one scene object other than the camera.")

	
