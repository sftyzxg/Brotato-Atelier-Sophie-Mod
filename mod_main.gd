extends Node


const AUTHORNAME_MODNAME_DIR := "sftyzxg-AtelierSophie/"
const AUTHORNAME_MODNAME_LOG_NAME := "sftyzxg-AtelierSophie"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""

# Before v6.1.0
func _init() -> void:
	ModLoaderLog.info("Init Start", AUTHORNAME_MODNAME_LOG_NAME)
	mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(AUTHORNAME_MODNAME_DIR)
	extensions_dir_path = mod_dir_path + "extensions/"
	translations_dir_path = mod_dir_path + "translations/"

	# Add extensions
	install_script_extensions()
	# Add translations
	add_translations()

	add_extensions_content()


func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.plus_file("content/")
	# extensions_dir_path = mod_dir_path.path_join("extensions") # Godot 4

func add_translations() -> void:
	translations_dir_path = mod_dir_path.plus_file("translations")
		# ModLoaderMod.add_translation(translations_dir_path.plus_file(...))

func add_extensions_content():
	
	pass

	#var ContentLoader = get_node("./ContentLoader")

	#ContentLoader.load_data("./extensions/extensions_content.tres")


	# ModLoaderLog.info("Load Atelier Sophie Content Start", AUTHORNAME_MODNAME_LOG_NAME)
	
	# var mod_data = load("res://singletons/item_service.tscn") as ModInit
	# print("✅ 资源加载成功:", mod_data)

	#ProgressData._append_without_duplicates(ItemService.characters, mod_data.characters)
	#ProgressData._append_without_duplicates(ItemService.items, mod_data.items)
	#ProgressData._append_without_duplicates(ItemService.weapons, mod_data.weapons)


func _ready() -> void:
	ModLoaderLog.info("Ready!", AUTHORNAME_MODNAME_LOG_NAME)

	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")
	var content_dir = "res://mods-unpacked/sftyzxg-AtelierSophie/content_data/"
	var mod_log = "sftyzxg-AtelierSophie"

	# Add content. These .tres files are ContentData resources
	ContentLoader.load_data(content_dir + "atelier_sophie_content.tres", mod_log)
