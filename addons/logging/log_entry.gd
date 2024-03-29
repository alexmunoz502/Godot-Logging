class_name LogEntry extends RefCounted

var color_code: String
var level_name: String
var trace: String
var message: String
var timestamp: String

func _init(color: Color, level_name: String, trace: String, message: String) -> void:
	self.color_code = color.to_html()
	self.level_name = level_name
	self.trace = trace
	self.message = message
	self.timestamp = Time.get_datetime_string_from_system()

func _to_string() -> String:
	var context = [
		self.color_code,
		self.timestamp,
		self.level_name,
		self.trace,
		self.message
	]
	return "[color=%s][%s] %s (%s): %s" % context
