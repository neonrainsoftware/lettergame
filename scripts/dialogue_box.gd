extends Node
class_name DialogueBox

@onready var game_manager 

@onready var dialogue_text : RichTextLabel = get_node("DialogueText")
@onready var dialogue_responce : TextEdit = get_node("RespText")
@onready var dialogue_button : Button = get_node("RespButton")

@onready var sample_text : String = "this is some sample text, with some commas and stuff!"

var dialogue_tree : Dictionary = {}

func init_npc() -> void:
	dialogue_text.text = ""
	dialogue_responce.text = ""
	dialogue_button.disabled = true

func _on_resp_button_pressed() -> void:
	dialogue_text.text = ""
	dialogue_responce.text = ""
	# await write_to_textbox(sample_text)
	# write_to_dialogue_text("Hmm... i dont think it works")
	await write_to_box(sample_text, dialogue_text)
	write_to_box("Hmmm, dont think this worked", dialogue_responce)

func _on_player_talk() -> void:
	dialogue_responce.text = "Hmm..."
	dialogue_button.disabled = true

func _on_npc_talk(npc_dialogue : String) -> void:
	dialogue_text.text = npc_dialogue
	dialogue_button.disabled = false


func write_to_box(text : String, location : Variant) -> void:
	var new_text : PackedStringArray = text.split(" ")
	for word in new_text:
		location.text += word + " "
		await get_tree().create_timer(0.2).timeout
