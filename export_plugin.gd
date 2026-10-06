# Copyright (c) 2026 DevSF
# Distributed under the terms of the MIT License.

@tool
extends EditorPlugin

# A class member to hold the editor export plugin during its lifecycle.
var export_plugin : AndroidExportPlugin

func _enter_tree():
	# Initialization of the plugin goes here.
	export_plugin = AndroidExportPlugin.new()
	add_export_plugin(export_plugin)


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_export_plugin(export_plugin)
	export_plugin = null


class AndroidExportPlugin extends EditorExportPlugin:
	# TODO: Update to your plugin's name.
	var _plugin_name = "GodotLevelPlay"

	func _supports_platform(platform):
		if platform is EditorExportPlatformAndroid:
			return true
		return false

	func _get_android_libraries(platform, debug):
		if debug:
			return PackedStringArray([_plugin_name + "/bin/debug/" + _plugin_name + "-debug.aar"])
		else:
			return PackedStringArray([_plugin_name + "/bin/release/" + _plugin_name + "-release.aar"])

	func _get_android_dependencies(platform, debug):
		# TODO: Add remote dependices here.
		if debug:
			return PackedStringArray([
				"com.unity3d.ads-mediation:mediation-sdk:9.6.0",
				"com.unity3d.ads:unity-ads:4.21.0",
				"com.unity3d.ads-mediation:unityads-adapter:5.13.0",
				"com.yandex.android:mobileads:8.5.0",
				"com.unity3d.ads-mediation:yandex-adapter:5.15.0",
    			"com.google.android.gms:play-services-appset:16.0.0",
    			"com.google.android.gms:play-services-ads-identifier:18.1.0",
    			"com.google.android.gms:play-services-basement:18.1.0",
    			"com.google.android.material:material:1.11.0",
    			"androidx.appcompat:appcompat:1.6.1"
			])
		else:
			return PackedStringArray([
				"com.unity3d.ads-mediation:mediation-sdk:9.6.0",
				"com.unity3d.ads:unity-ads:4.21.0",
				"com.unity3d.ads-mediation:unityads-adapter:5.13.0",
				"com.yandex.android:mobileads:8.5.0",
				"com.unity3d.ads-mediation:yandex-adapter:5.15.0",
    			"com.google.android.gms:play-services-appset:16.0.0",
    			"com.google.android.gms:play-services-ads-identifier:18.1.0",
    			"com.google.android.gms:play-services-basement:18.1.0",
    			"com.google.android.material:material:1.11.0",
    			"androidx.appcompat:appcompat:1.6.1"
			])

	func _get_name():
		return _plugin_name
