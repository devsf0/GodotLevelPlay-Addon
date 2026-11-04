@icon("res://addons/GodotLevelPlay/resources/icon.png")
class_name GodotLevelPlay
extends Node

var _plugin = null
var _plugin_name: String = "GodotLevelPlay"
var _os_name: String = "Android"

# MESSAGES

# PLUGIN
var _info_running_in_editor: String = "GodotLevelPlay Running in Editor!"
var _info_connecting_signals: String = "Connecting Signals!"
var _info_plugin_initialized: String = "GodotLevelPlay Plugin Initialized!"
var _err_plugin_not_found: String = "GodotLevelPlay Plugin NOT found!"

# SDK
var _info_sdk_initialized: String = "Godot LevelPlay SDK Initialized Sucessfully!"
var _err_sdk_init_failed: String = "Godot LevelPlay SDK init failed with Error Code: "

# BANNER AD
var _info_banner_ad_loaded: String = "Banner AD Loaded!"
var _err_banner_ad_load_failed: String = "Banner AD Load Failed!"
var _info_banner_ad_displayed: String = "Banner AD Displayed!"
var _err_banner_ad_display_failed: String = "Banner AD Display Failed!"
var _info_banner_ad_clicked: String = "Banner AD Clicked!"
var _info_banner_ad_expanded: String = "Banner AD Expanded!"
var _info_banner_ad_collapsed: String = "Banner AD Collapsed!"
var _info_banner_ad_left_application: String = "Banner AD Left Application!"

# INTERSTITIAL AD
var _info_interstitial_ad_loaded: String = "Interstitial AD Loaded!"
var _err_interstitial_ad_load_failed: String = "Interstitial AD Load Failed!"
var _info_interstitial_ad_displayed: String = "Interstitial AD Displayed!"
var _err_interstitial_ad_display_failed: String = "Interstitial AD Display Failed!"
var _info_interstitial_ad_clicked: String = "Interstitial AD Clicked!"
var _info_interstitial_ad_closed: String = "Interstitial AD Closed!"
var _info_interstitial_ad_info_changed: String = "Interstitial AD Info Changed!"

# REWARDED AD
var _info_rewarded_ad_loaded: String = "Rewarded AD Loaded!"
var _err_rewarded_ad_load_failed: String = "Rewarded AD Load Failed!"
var _info_rewarded_ad_displayed: String = "Rewarded AD Displayed!"
var _info_rewarded_ad_rewarded: String = "Rewarded AD Rewarded!"
var _err_rewarded_ad_display_failed: String = "Rewarded AD Display Failed!"
var _info_rewarded_ad_clicked: String = "Rewarded AD Clicked!"
var _info_rewarded_ad_closed: String = "Rewarded AD Closed!"
var _info_rewarded_ad_info_changed: String = "Rewarded AD Info Changed!"

# [MOCK]

# [MOCK] SDK
var _mock_info_connecting_signals: String = "[MOCK] Connecting Signals!"
var _mock_info_enabled_test_suite: String = "[MOCK] Test Suite Enabled!"
var _mock_info_disabled_test_suite: String = "[MOCK] Test Suite Disabled!"
var _mock_info_launched_test_suite: String = "[MOCK] Launched Test Suite!"
var _mock_info_sdk_initialized: String = "[MOCK] LevelPlay SDK Initialized!"

# [MOCK] BANNER AD
var _mock_info_banner_ad_loaded: String = "[MOCK] Banner AD Loaded!"
var _mock_err_banner_ad_load_failed: String = "[MOCK] Banner AD Load Failed!"
var _mock_info_banner_ad_displayed: String = "[MOCK] Banner AD Displayed!"
var _mock_err_banner_ad_display_failed: String = "[MOCK] Banner AD Display Failed!"
var _mock_info_banner_ad_clicked: String = "[MOCK] Banner AD Clicked!"
var _mock_info_banner_ad_expanded: String = "[MOCK] Banner AD Expanded!"
var _mock_info_banner_ad_collapsed: String = "[MOCK] Banner AD Collapsed!"
var _mock_info_banner_ad_left_application: String = "[MOCK] Banner AD Left Application!"

# [MOCK] INTERSTITIAL AD
var _mock_info_interstitial_ad_loaded: String = "[MOCK] Interstitial AD Loaded!"
var _mock_err_interstitial_ad_load_failed: String = "[MOCK] Interstitial AD Load Failed!"
var _mock_info_interstitial_ad_displayed: String = "[MOCK] Interstitial AD Displayed!"
var _mock_err_interstitial_ad_display_failed: String = "[MOCK] Interstitial AD Display Failed!"
var _mock_info_interstitial_ad_clicked: String = "[MOCK] Interstitial AD Clicked!"
var _mock_info_interstitial_ad_closed: String = "[MOCK] Interstitial AD Closed!"
var _mock_info_interstitial_ad_info_changed: String = "[MOCK] Interstitial AD Info Changed!"

# [MOCK] REWARDED AD
var _mock_info_rewarded_ad_loaded: String = "[MOCK] Rewarded AD Loaded!"
var _mock_err_rewarded_ad_load_failed: String = "[MOCK] Rewarded AD Load Failed!"
var _mock_info_rewarded_ad_displayed: String = "[MOCK] Rewarded AD Displayed!"
var _mock_info_rewarded_ad_rewarded: String = "[MOCK] Rewarded AD Rewarded!"
var _mock_err_rewarded_ad_display_failed: String = "[MOCK] Rewarded AD Display Failed!"
var _mock_info_rewarded_ad_clicked: String = "[MOCK] Rewarded AD Clicked!"
var _mock_info_rewarded_ad_closed: String = "[MOCK] Rewarded AD Closed!"
var _mock_info_rewarded_ad_info_changed: String = "[MOCK] Rewarded AD Info Changed!"

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

func _ready() -> void:
	_initialize()

func _initialize():
	if OS.get_name() == _os_name:
		if Engine.has_singleton(_plugin_name):
			_plugin = Engine.get_singleton(_plugin_name)
			_connect_signals()
			print(_info_plugin_initialized)
		else:
			printerr(_err_plugin_not_found)
	else:
		print(_info_running_in_editor)
		_connect_signals()

func _connect_signals():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_connecting_signals)
			
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
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_connecting_signals)

# METHODS

# LevelPlay Set MetaData
func set_metadata(metadata, value):
	if OS.get_name() == _os_name:
		if _plugin:
			_plugin.setMetaData(metadata, value)

# LevelPlay Set GDPR Consent
func set_GDPR_Consent(value: bool):
	if OS.get_name() == _os_name:
		if _plugin:
			_plugin.setGDPRConsent(value)

# LevelPlay Set CCPA
func set_CCPA(value: bool):
	if OS.get_name() == _os_name:
		if _plugin:
			_plugin.setCCPA(value)

# LevelPlay Set COPPA
func set_COPPA(value: bool):
	if OS.get_name() == _os_name:
		if _plugin:
			_plugin.setCOPPA(value)

func launch_test_suite():
	if OS.get_name() == _os_name:
		if _plugin:
			_plugin.launchTestSuite()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_launched_test_suite)

# LEVELPLAY SDK INIT
func init_sdk(appKey: String):
	if OS.get_name() == _os_name:
		if _plugin:
			_plugin.levelPlayInit(appKey)
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#_on_init_success()

# BANNER AD
func create_and_load_banner_ad(addUnitId: String):
	if OS.get_name() == _os_name:
		if _plugin:
			_plugin.createAndLoadBannerAd(addUnitId)
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#_on_banner_ad_loaded()
		#_on_banner_ad_displayed()

# INTERSTITIAL AD
func load_interstitial_ad(addUnitId: String):
	if OS.get_name() == _os_name:
		if _plugin:
			_plugin.loadInterstitialAd(addUnitId)
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#_on_interstitial_ad_loaded()

func show_interstitial_ad():
	if OS.get_name() == _os_name:
		if _plugin:
			_plugin.showInterstitialAd()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#_on_interstitial_ad_displayed()

# REWARDED AD
func load_rewarded_ad(adUnitId: String):
	if OS.get_name() == _os_name:
		if _plugin:
			_plugin.loadRewardedAd(adUnitId)
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#_on_rewarded_ad_loaded()

func show_rewarded_ad():
	if OS.get_name() == _os_name:
		if _plugin:
			_plugin.showRewardedAd()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#_on_rewarded_ad_displayed()

# SIGNALS

# SDK INIT
func _on_init_success():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_sdk_initialized)
			on_init_success.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_sdk_initialized)
		#on_init_success.emit()

func _on_init_failed(error_code: int, error_message: String):
	if OS.get_name() == _os_name:
		if _plugin:
			printerr(_err_sdk_init_failed, error_code, " Error Message: " , error_message)
			on_init_failed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#printerr(_err_sdk_init_failed, error_code, " Error Message: " , error_message)
		#on_init_failed.emit()

# BANNER AD
func _on_banner_ad_loaded():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_banner_ad_loaded)
			on_banner_ad_loaded.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_banner_ad_loaded)
		#on_banner_ad_loaded.emit()

func _on_banner_ad_load_failed(error_code: int, error_message: String):
	if OS.get_name() == _os_name:
		if _plugin:
			printerr(_err_banner_ad_load_failed, error_code, " Error Message: " , error_message)
			on_banner_ad_load_failed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#printerr(_mock_err_banner_ad_load_failed, error_code, " Error Message: " , error_message)
		#on_banner_ad_load_failed.emit()

func _on_banner_ad_displayed():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_banner_ad_displayed)
			on_banner_ad_displayed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_banner_ad_displayed)
		#on_banner_ad_displayed.emit()

func _on_banner_ad_display_failed(error_code: int, error_message: String):
	if OS.get_name() == _os_name:
		if _plugin:
			printerr(_err_banner_ad_display_failed, error_code, " Error Message: " , error_message)
			on_banner_ad_display_failed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#printerr(_mock_err_banner_ad_display_failed, error_code, " Error Message: " , error_message)
		#on_banner_ad_display_failed.emit()

func _on_banner_ad_clicked():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_banner_ad_clicked)
			on_banner_ad_clicked.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_banner_ad_clicked)
		#on_banner_ad_clicked.emit()

func _on_banner_ad_expanded():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_banner_ad_expanded)
			on_banner_ad_expanded.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_banner_ad_expanded)
		#on_banner_ad_expanded.emit()

func _on_banner_ad_collapsed():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_banner_ad_collapsed)
			on_banner_ad_collapsed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_banner_ad_collapsed)
		#on_banner_ad_collapsed.emit()

func _on_banner_ad_left_application():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_banner_ad_left_application)
			on_banner_ad_left_application.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_banner_ad_left_application)
		#on_banner_ad_left_application.emit()

# INTERSTITIAL AD
func _on_interstitial_ad_loaded():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_interstitial_ad_loaded)
			on_interstitial_ad_loaded.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_interstitial_ad_loaded)
		#on_interstitial_ad_loaded.emit()

func _on_interstitial_ad_load_failed(error_code: int, error_message: String):
	if OS.get_name() == _os_name:
		if _plugin:
			printerr(_err_interstitial_ad_load_failed, error_code, " Error Message: " , error_message)
			on_interstitial_ad_load_failed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#printerr(_mock_err_interstitial_ad_load_failed, error_code, " Error Message: " , error_message)
		#on_interstitial_ad_load_failed.emit()

func _on_interstitial_ad_displayed():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_interstitial_ad_displayed)
			on_interstitial_ad_displayed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_interstitial_ad_displayed)
		#on_interstitial_ad_displayed.emit()

func _on_interstitial_ad_display_failed(error_code: int, error_message: String):
	if OS.get_name() == _os_name:
		if _plugin:
			printerr(_err_interstitial_ad_display_failed, error_code, " Error Message: " , error_message)
			on_interstitial_ad_display_failed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#printerr(_mock_err_interstitial_ad_display_failed, error_code, " Error Message: " , error_message)
		#on_interstitial_ad_display_failed.emit()

func _on_interstitial_ad_clicked():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_interstitial_ad_clicked)
			on_interstitial_ad_clicked.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_interstitial_ad_clicked)
		#on_interstitial_ad_clicked.emit()

func _on_interstitial_ad_closed():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_interstitial_ad_closed)
			on_interstitial_ad_closed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_interstitial_ad_closed)
		#on_interstitial_ad_closed.emit()

func _on_interstitial_ad_info_changed():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_interstitial_ad_info_changed)
			on_interstitial_ad_info_changed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_interstitial_ad_info_changed)
		#on_interstitial_ad_info_changed.emit()

# REWARDED AD
func _on_rewarded_ad_loaded():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_rewarded_ad_loaded)
			on_rewarded_ad_loaded.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_rewarded_ad_loaded)
		#on_rewarded_ad_loaded.emit()

func _on_rewarded_ad_load_failed(error_code: int, error_message: String):
	if OS.get_name() == _os_name:
		if _plugin:
			printerr(_err_rewarded_ad_load_failed, error_code, " Error Message: " , error_message)
			on_rewarded_ad_load_failed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#printerr(_mock_err_rewarded_ad_load_failed, error_code, " Error Message: " , error_message)
		#on_rewarded_ad_load_failed.emit()

func _on_rewarded_ad_displayed():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_err_rewarded_ad_display_failed)
			on_rewarded_ad_displayed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_rewarded_ad_displayed)
		#on_rewarded_ad_displayed.emit()

func _on_rewarded_ad_rewarded(amount: int, reward_name: String):
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_rewarded_ad_rewarded, amount, " amount of ", reward_name)
			on_rewarded_ad_rewarded.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_rewarded_ad_rewarded, amount, " amount of ", reward_name)
		#on_rewarded_ad_rewarded.emit()

func _on_rewarded_ad_display_failed(error_code: int, error_message: String):
	if OS.get_name() == _os_name:
		if _plugin:
			printerr(_err_rewarded_ad_display_failed, error_code, " Error Message: " , error_message)
			on_rewarded_ad_display_failed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#printerr(_mock_err_rewarded_ad_display_failed, error_code, " Error Message: " , error_message)
		#on_rewarded_ad_display_failed.emit()

func _on_rewarded_ad_clicked():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_rewarded_ad_clicked)
			on_rewarded_ad_clicked.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_rewarded_ad_clicked)
		#on_rewarded_ad_clicked.emit()

func _on_rewarded_ad_closed():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_rewarded_ad_closed)
			on_rewarded_ad_closed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_rewarded_ad_closed)
		#on_rewarded_ad_closed.emit()

func _on_rewarded_ad_info_changed():
	if OS.get_name() == _os_name:
		if _plugin:
			print(_info_rewarded_ad_info_changed)
			on_rewarded_ad_info_changed.emit()
		#else:
			#printerr(_err_plugin_not_found)
	#else:
		#print(_mock_info_rewarded_ad_info_changed)
		#on_rewarded_ad_info_changed.emit()
