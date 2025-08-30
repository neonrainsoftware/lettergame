extends Node
class_name DialogueSystem


const ALPHABET : Array = ["A", "B", "C", "D", "E", 
"F" , "G", "H", "I", "J", "K", "L", "M", 
"N" , "O", "P", "Q", "R", "S", "T", "U", 
"V" , "W" , "X" , "Y", "Z" ]
var ready_letters : Dictionary = {"A" : 0, "B" : 0, "C" : 0, "D" : 0, "E" : 0, 
"F" : 0, "G" : 0, "H" : 0, "I" : 0, "J" : 0, "K" : 0, "L" : 0, "M" : 0, 
"N" : 0, "O" : 0, "P" : 0, "Q" : 0, "R" : 0, "S" : 0, "T" : 0, "U" : 0, 
"V" : 0, "W" : 0, "X" : 0, "Y" : 0, "Z" : 0 }

@export var sample_dialogue : String

var dialogue_box

func _ready() -> void:
	dialogue_box = get_node("DialogueBox")
	# dialogue_box.dialogue_tree = load_from_json("res://assets/json/dialogue.json")

func load_from_json(dialogue_file : String) -> Variant:
	var json_as_text : String = FileAccess.get_file_as_string(dialogue_file)
	var dialogue_text : Variant = JSON.parse_string(json_as_text)
	for word in dialogue_text["npc"]["convo_one"]:
		print(word)

	return dialogue_text
