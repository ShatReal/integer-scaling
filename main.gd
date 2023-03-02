extends Control


@onready var svc := $SVC


func _ready() -> void:
	get_viewport().size_changed.connect(on_screen_resized)
	svc.size = Vector2(ProjectSettings["display/window/size/viewport_width"], ProjectSettings["display/window/size/viewport_height"])
	on_screen_resized()
	
	
func on_screen_resized() -> void:
	var window_size := DisplayServer.window_get_size()
	var possible_scale := window_size / Vector2i(svc.size)
	var final_scale: Vector2i = max(1, min(possible_scale.x, possible_scale.y)) * Vector2i.ONE
	svc.scale = final_scale
	svc.position = Vector2(window_size) / 2 - svc.size * svc.scale / 2
