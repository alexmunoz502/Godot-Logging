@tool
extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("Logging", "res://addons/logging/Logging.tscn")


func _exit_tree():
	remove_autoload_singleton("Logging")
