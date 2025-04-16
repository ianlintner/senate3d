extends Control

# This script handles displaying dialog from NPCs

@export var dialog_box_path : NodePath
@export var dialog_text_path : NodePath
@export var dialog_name_path : NodePath

@onready var dialog_box : Control = get_node(dialog_box_path) if dialog_box_path else $DialogBox
@onready var dialog_text : Label = get_node(dialog_text_path) if dialog_text_path else $DialogBox/DialogText
@onready var dialog_name : Label = get_node(dialog_name_path) if dialog_name_path else $DialogBox/NameLabel

var is_dialog_active : bool = false
var current_dialog_index : int = 0
var current_dialog_data : Array = []

signal dialog_finished

func _ready():
	# Hide dialog box initially
	if dialog_box:
		dialog_box.visible = false

func _input(event):
	if is_dialog_active and event.is_action_pressed("ui_accept"):
		advance_dialog()

# Start displaying a dialog sequence
func start_dialog(dialog_data: Array, npc_name: String = "NPC"):
	if dialog_data.size() == 0:
		return
	
	current_dialog_data = dialog_data
	current_dialog_index = 0
	is_dialog_active = true
	
	# Show dialog box
	if dialog_box:
		dialog_box.visible = true
	
	# Set NPC name
	if dialog_name:
		dialog_name.text = npc_name
	
	# Display first dialog line
	display_current_dialog()

# Display the current dialog line
func display_current_dialog():
	if current_dialog_index < current_dialog_data.size():
		if dialog_text:
			dialog_text.text = current_dialog_data[current_dialog_index]

# Advance to the next dialog line or end dialog
func advance_dialog():
	current_dialog_index += 1
	
	if current_dialog_index >= current_dialog_data.size():
		end_dialog()
	else:
		display_current_dialog()

# End the dialog sequence
func end_dialog():
	is_dialog_active = false
	
	# Hide dialog box
	if dialog_box:
		dialog_box.visible = false
	
	# Emit signal that dialog is finished
	emit_signal("dialog_finished")