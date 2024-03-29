extends Node

enum Level {
	DEBUG,
	INFO,
	WARNING,
	ERROR,
	CRITICAL
}

signal entry_logged(entry: LogEntry)

@export_category("Settings")
@export var default_level: Level = Level.DEBUG

var current_level: Level

@export_category("Colors")
@export_color_no_alpha var debug_color: Color = Color.LIGHT_SKY_BLUE
@export_color_no_alpha var info_color: Color = Color.GHOST_WHITE
@export_color_no_alpha var warning_color: Color = Color.KHAKI
@export_color_no_alpha var error_color: Color =  Color.INDIAN_RED
@export_color_no_alpha var critical_color: Color =Color.CRIMSON

var color_map: Dictionary = {
	Level.DEBUG: debug_color,
	Level.INFO: info_color,
	Level.WARNING: warning_color,
	Level.ERROR: error_color,
	Level.CRITICAL: critical_color
}

func _ready() -> void:
	current_level = default_level

func set_level(new_level: Level) -> void:
	current_level = new_level

func debug(message: String) -> void:
	log_entry(Level.DEBUG, message)

func info(message: String) -> void:
	log_entry(Level.INFO, message)

func warning(message: String) -> void:
	log_entry(Level.WARNING, message)

func error(message: String) -> void:
	log_entry(Level.ERROR, message)

func critical(message: String) -> void:
	log_entry(Level.CRITICAL, message)

func log_entry(level: Level, message: String) -> void:
	if level < current_level:
		return
	
	var color = color_map[level]
	var level_name = Level.keys()[level].to_upper()
	var stack = get_stack()
	var trace = "%s:%s" % [stack[-1]['source'], stack[-1]['line']]
	var entry = LogEntry.new(color, level_name, trace, message)
	
	print_rich(entry.to_string())
	entry_logged.emit(entry)

