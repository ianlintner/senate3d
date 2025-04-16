extends "res://Scripts/Characters/NPCInteraction.gd"

# This script extends NPCInteraction to add dialog functionality

@export_group("Dialog Settings")
@export var npc_name : String = "NPC"
@export var dialog_lines : Array[String] = ["Hello there!", "Nice weather today, isn't it?"]
@export var dialog_ui_path : NodePath  # Path to the NPCDialog UI control

var dialog_ui : Control = null
var can_interact : bool = true

func _ready():
	super._ready()  # Call the parent _ready function
	
	# Find the dialog UI
	await get_tree().process_frame
	
	if dialog_ui_path:
		dialog_ui = get_node(dialog_ui_path)
	else:
		# Try to find it in the scene
		var dialog_uis = get_tree().get_nodes_in_group("dialog_ui")
		if dialog_uis.size() > 0 and dialog_uis[0] is Control:
			dialog_ui = dialog_uis[0]

# Override the player entered function to show dialog
func _on_player_entered():
	super._on_player_entered()  # Call the parent function
	
	if can_interact and dialog_ui != null:
		# Start dialog when player enters interaction radius
		start_dialog()

# Override the player exited function
func _on_player_exited():
	super._on_player_exited()  # Call the parent function
	
	# Additional functionality can be added here

# Function to start the dialog
func start_dialog():
	if dialog_ui != null and dialog_ui.has_method("start_dialog"):
		can_interact = false  # Prevent multiple interactions
		
		# Connect to the dialog_finished signal if not already connected
		if not dialog_ui.is_connected("dialog_finished", Callable(self, "_on_dialog_finished")):
			dialog_ui.connect("dialog_finished", Callable(self, "_on_dialog_finished"))
		
		# Start the dialog
		dialog_ui.start_dialog(dialog_lines, npc_name)

# Called when dialog is finished
func _on_dialog_finished():
	# Add a cooldown before allowing interaction again
	await get_tree().create_timer(2.0).timeout
	can_interact = true
