# Copyright (c) 2026 DevSF
# Distributed under the terms of the MIT License.

@icon("res://addons/GodotLevelPlay/resources/icon.png")
class_name GodotLevelPlay
extends Node

var _plugin = null
var _plugin_name: String = "GodotLevelPlay"

# LEVELPLAY SDK INIT
signal on_init_success
signal on_init_failed

# BANNER AD
signal on_banner_ad_loaded
signal on_banner_ad_load_failed
signal on_banner_ad_displayed
signal on_banner_ad_display_failed
signal on_banner_ad_clicked
signal on_banner_ad_expanded
signal on_banner_ad_collapsed
signal on_banner_ad_left_application

# INTERSTITIAL AD
signal on_interstitial_ad_loaded
signal on_interstitial_ad_load_failed
signal on_interstitial_ad_displayed
signal on_interstitial_ad_display_failed
signal on_interstitial_ad_clicked
signal on_interstitial_ad_closed
signal on_interstitial_ad_info_changed

# REWARDED AD
signal on_rewarded_ad_loaded
signal on_rewarded_ad_load_failed
signal on_rewarded_ad_displayed
signal on_rewarded_ad_rewarded
signal on_rewarded_ad_display_failed
signal on_rewarded_ad_clicked
signal on_rewarded_ad_closed
signal on_rewarded_ad_info_changed

func _ready():
	if OS.get_name() == "Android":
		if Engine.has_singleton(_plugin_name):
			_plugin = Engine.get_singleton(_plugin_name)
			_connect_signals()
			
			print("GodotLevelPlay Plugin Initialized!")
		else:
			printerr("Plugin GodotLevelPlay NOT found!")
	else:
		print("GodotLevelPlay Running in Editor")

func _connect_signals():
	if not _plugin:
		return
	
	# LEVELPLAY SDK INIT
	_plugin.connect("on_init_success", _on_init_success)
	_plugin.connect("on_init_failed", _on_init_failed)
	
	# BANNER AD
	_plugin.connect("on_banner_ad_loaded", _on_banner_ad_loaded)
	_plugin.connect("on_banner_ad_load_failed", _on_banner_ad_load_failed)
	_plugin.connect("on_banner_ad_displayed", _on_banner_ad_displayed)
	_plugin.connect("on_banner_ad_display_failed", _on_banner_ad_display_failed)
	_plugin.connect("on_banner_ad_clicked", _on_banner_ad_clicked)
	_plugin.connect("on_banner_ad_expanded", _on_banner_ad_expanded)
	_plugin.connect("on_banner_ad_collapsed", _on_banner_ad_collapsed)
	_plugin.connect("on_banner_ad_left_application", _on_banner_ad_left_application)
	
	# INTERSTITIAL AD
	_plugin.connect("on_interstitial_ad_loaded", _on_interstitial_ad_loaded)
	_plugin.connect("on_interstitial_ad_load_failed", _on_interstitial_ad_load_failed)
	_plugin.connect("on_interstitial_ad_displayed", _on_interstitial_ad_displayed)
	_plugin.connect("on_interstitial_ad_display_failed", _on_interstitial_ad_display_failed)
	_plugin.connect("on_interstitial_ad_clicked", _on_interstitial_ad_clicked)
	_plugin.connect("on_interstitial_ad_closed", _on_interstitial_ad_closed)
	_plugin.connect("on_interstitial_ad_info_changed", _on_interstitial_ad_info_changed)
	
	# REWARDED AD
	_plugin.connect("on_rewarded_ad_loaded", _on_rewarded_ad_loaded)
	_plugin.connect("on_rewarded_ad_load_failed", _on_rewarded_ad_load_failed)
	_plugin.connect("on_rewarded_ad_displayed", _on_rewarded_ad_displayed)
	_plugin.connect("on_rewarded_ad_rewarded", _on_rewarded_ad_rewarded)
	_plugin.connect("on_rewarded_ad_display_failed", _on_rewarded_ad_display_failed)
	_plugin.connect("on_rewarded_ad_clicked", _on_rewarded_ad_clicked)
	_plugin.connect("on_rewarded_ad_closed", _on_rewarded_ad_closed)
	_plugin.connect("on_rewarded_ad_info_changed", _on_rewarded_ad_info_changed)

# METHODS

# TEST SUITE
func enable_test_suite(value: bool):
	_plugin.enableTestSuite(value)

func launch_test_suite():
	_plugin.launchTestSuite()

# LEVELPLAY SDK INIT
func init_sdk(appKey: String):
	if _plugin:
		_plugin.levelPlayInit(appKey)
	else:
		print("[MOCK]: init_sdk called with key: ")

# BANNER AD
func create_and_load_banner_ad(addUnitId: String):
	_plugin.createAndLoadBannerAd(addUnitId)

# INTERSTITIAL AD
func load_interstitial_ad(addUnitId: String):
	_plugin.loadInterstitialAd(addUnitId)

func show_interstitial_ad():
	_plugin.showInterstitialAd()

# REWARDED AD
func load_rewarded_ad(adUnitId: String):
	_plugin.loadRewardedAd(adUnitId)

func show_rewarded_ad():
	_plugin.showRewardedAd()

# SIGNALS

# SDK INIT
func _on_init_success():
	print("Godot LevelPlay SDK Initialized Sucessfully!")
	on_init_success.emit()

func _on_init_failed(error_code: int, error_message: String):
	printerr("Godot LevelPlay SDK init failed with Error Code: ", error_code, " Error Message: " , error_message)
	on_init_failed.emit()

# BANNER AD
func _on_banner_ad_loaded():
	print("Banner Ad Loaded!")
	on_banner_ad_loaded.emit()

func _on_banner_ad_load_failed(error_code: int, error_message: String):
	printerr("Banner Ad load failed with Error Code: ", error_code, " Error Message: " , error_message)
	on_banner_ad_load_failed.emit()

func _on_banner_ad_displayed():
	print("Banner Ad Displayed!")
	on_banner_ad_displayed.emit()

func _on_banner_ad_display_failed(error_code: int, error_message: String):
	printerr("Banner Ad display failed with Error Code: ", error_code, " Error Message: " , error_message)
	on_banner_ad_display_failed.emit()

func _on_banner_ad_clicked():
	print("Banner Ad Clicked!")
	on_banner_ad_clicked.emit()

func _on_banner_ad_expanded():
	print("Banner Ad Expanded!")
	on_banner_ad_expanded.emit()

func _on_banner_ad_collapsed():
	print("Banner Ad Collapsed!")
	on_banner_ad_collapsed.emit()

func _on_banner_ad_left_application():
	print("Banner Ad Left Application!")
	on_banner_ad_left_application.emit()

# INTERSTITIAL AD
func _on_interstitial_ad_loaded():
	print("Interstitial Ad Loaded!")
	on_interstitial_ad_loaded.emit()

func _on_interstitial_ad_load_failed(error_code: int, error_message: String):
	printerr("Interstitial Ad load failed with Error Code: ", error_code, " Error Message: " , error_message)
	on_interstitial_ad_load_failed.emit()

func _on_interstitial_ad_displayed():
	print("Interstitial Ad Displayed!")
	on_interstitial_ad_displayed.emit()

func _on_interstitial_ad_display_failed(error_code: int, error_message: String):
	printerr("Interstitial Ad display failed with Error Code: ", error_code, " Error Message: " , error_message)
	on_interstitial_ad_display_failed.emit()

func _on_interstitial_ad_clicked():
	print("Interstitial Ad Clicked!")
	on_interstitial_ad_clicked.emit()

func _on_interstitial_ad_closed():
	print("Interstitial Ad Closed!")
	on_interstitial_ad_closed.emit()

func _on_interstitial_ad_info_changed():
	print("Interstitial Ad Info Changed!")
	on_interstitial_ad_info_changed.emit()

# REWARDED AD
func _on_rewarded_ad_loaded():
	print("Rewarded Ad Loaded!")
	on_rewarded_ad_loaded.emit()

func _on_rewarded_ad_load_failed(error_code: int, error_message: String):
	printerr("Rewarded Ad load failed with Error Code: ", error_code, " Error Message: " , error_message)
	on_rewarded_ad_load_failed.emit()

func _on_rewarded_ad_displayed():
	print("Rewarded Ad Displayed!")
	on_rewarded_ad_displayed.emit()

func _on_rewarded_ad_rewarded(amount: int, reward_name: String):
	print("Rewarded Ad Rewarded You With ", amount, " amount of ", reward_name)
	on_rewarded_ad_rewarded.emit()

func _on_rewarded_ad_display_failed(error_code: int, error_message: String):
	printerr("Rewarded Ad display failed with Error Code: ", error_code, " Error Message: " , error_message)
	on_rewarded_ad_display_failed.emit()

func _on_rewarded_ad_clicked():
	print("Rewarded Ad Clicked!")
	on_rewarded_ad_clicked.emit()

func _on_rewarded_ad_closed():
	print("Rewarded Ad Closed!")
	on_rewarded_ad_closed.emit()

func _on_rewarded_ad_info_changed():
	print("Rewarded Ad Info Changed!")
	on_rewarded_ad_info_changed.emit()
