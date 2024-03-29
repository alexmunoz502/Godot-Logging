# Godot Logging

![Godot Logging Screenshot](/assets/image.png)

The Godot Logging plugin adds an autoloaded object called Logging to your Godot project.

### How to log with Logging

There are 5 levels of logging:

1. DEBUG
2. INFO
3. WARNING
4. ERROR
5. CRITICAL

The colors for each level can be configured by going into the addons > logging > Logging.tscn node and updating the exported variables for each color. Here, you can also set a default logging level.

To use the Logging object, call the corresponding logging function for the level you want to use to log an entry.

```
# DEBUG
Logging.debug("This is a debugging message!")

# INFO
Logging.info("This is a info message!")

# WARNING
Logging.warning("This is a warning message!")

# ERROR
Logging.error("This is a error message!")

# CRITICAL
Logging.critical("This is a critical message!")
```

A log entry's output is in the following format:

`[TIMESTAMP] LEVEL (TRACE): MESSAGE`

Example:

```
[2024-03-29T08:32:20] INFO (res://example.gd:11): Hello, world!
```

You can specify the logging level using the method `Logging.set_level(new_level: Logging.Level)`

To use it, pass in the Logging.Level enum value for the level you want to set the logger to. By setting the logger level, any levels lower than the selected level will not have their entries logged.

For example, if you set the log level to INFO, and try to call Logging.debug, nothing will be logged because the level of DEBUG is lower than INFO.

### Logging Entry API

There is a signal `Logging.entry_logged` which can be connected to to receive notifications when an entry is logged. The object returned by the signal is a `LogEntry` object.

The LogEntry object makes available the information in the log entry, as well as a method for viewing it as a [BBCode-Encoded](https://www.bbcode.org/how-to-use-bbcode-a-complete-guide.php) string.

The attributes available on the LogEntry object are:

```
# The log-level color of the entry, as an html color-code
# (e.g. white > ffffff)
LogEntry.color_code

# The log-level name of the entry
# example output: 'DEBUG'
LogEntry.level_name

# The stack trace of the entry, including line number
# example output: 'res://main.gd:11'
LogEntry.trace

# The message of the entry
# example output: 'Hello, world!'
LogEntry.message

# The system timestamp given to the entry, as a string
# example output: '2024-03-29T08:32:20'
LogEntry.timestamp
```

The method exposed by the LogEntry api to get the BBCode-Encoded string:

```
# example output: '[color=dc143cff] [2024-03-29T08:52:46] CRITICAL (res://example.gd:24): Critical Message'
LogEntry.to_string()
```
