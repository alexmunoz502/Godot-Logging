extends Node

@onready var logLabel: RichTextLabel = %LogOutput

func _ready():
	# Hook into the logging API
	Logging.entry_logged.connect(_on_entry_logged)
	
	# Methods for logging
	Logging.debug("Debug Message")
	Logging.info("Info Message")
	Logging.warning("Warning Message")
	Logging.error("Error Message")
	Logging.critical("Critical Message")
	
	# Filter out lower-level messages
	Logging.set_level(Logging.Level.ERROR)
	
	# Here only Error and Critical are logged:
	Logging.debug("Debug Message")
	Logging.info("Info Message")
	Logging.warning("Warning Message")
	Logging.error("Error Message")
	Logging.critical("Critical Message")


func _on_entry_logged(entry: LogEntry) -> void:
	# Access Entry attributes such as color_code, level_name, trace, message and
	# timestamp. Or, convert to string to view in bbcode format
	logLabel.append_text(entry.to_string() + "\n")

