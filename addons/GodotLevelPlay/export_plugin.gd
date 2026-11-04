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
	
	var dependencies: PackedStringArray = [
		# AppLovin
		"com.unity3d.ads-mediation:applovin-adapter:5.11.0",

		# Amazon Publisher Services (APS)
		"com.unity3d.ads-mediation:aps-adapter:5.4.0",

		# BidMachine
		"com.unity3d.ads-mediation:bidmachine-adapter:5.9.0",

		# BIGO Ads
		"com.unity3d.ads-mediation:bigo-adapter:5.15.0",

		# Chartboost
		"com.unity3d.ads-mediation:chartboost-adapter:5.12.0",

		# DT Exchange
		"com.unity3d.ads-mediation:fyber-adapter:5.13.0",

		# Google AdMob + Google Ad Manager
		"com.unity3d.ads-mediation:admob-adapter:5.19.0",

		# HyprMX
		"com.unity3d.ads-mediation:hyprmx-adapter:5.5.0",

		# InMobi
		"com.unity3d.ads-mediation:inmobi-adapter:5.12.0",

		# Liftoff Monetize
		"com.unity3d.ads-mediation:vungle-adapter:5.17.0",

		# LINE Ads Network (LY Ads)
		"com.unity3d.ads-mediation:line-adapter:5.6.0",

		# Meta Audience Network
		"com.unity3d.ads-mediation:facebook-adapter:5.5.0",
		"com.facebook.android:audience-network-sdk:6.21.0",

		# Mintegral
		"com.unity3d.ads-mediation:mintegral-adapter:5.25.0",

		# MobileFuse
		"com.unity3d.ads-mediation:mobilefuse-adapter:5.6.0",

		# Moloco
		"com.unity3d.ads-mediation:moloco-adapter:5.21.0",

		# Ogury
		"com.unity3d.ads-mediation:ogury-adapter:5.6.0",

		# Pangle
		"com.unity3d.ads-mediation:pangle-adapter:5.27.0",

		#PubMatic
		"com.unity3d.ads-mediation:pubmatic-adapter:5.13.0",

		#Smaato
		"com.unity3d.ads-mediation:smaato-adapter:5.8.0",

		#SuperAwesome
		"com.unity3d.ads-mediation:superawesome-adapter:5.9.0",

		# Unity Ads
		"com.unity3d.ads-mediation:unityads-adapter:5.15.0",

		# Unity Ads Quality SDK
		"com.unity3d.ads-mediation:adquality-sdk:9.3.1",

		# Unity Mediation SDK
		"com.unity3d.ads-mediation:mediation-sdk:9.7.0",

		# Verve
		"com.unity3d.ads-mediation:verve-adapter:5.10.0",

		# Yandex Ads
		"com.unity3d.ads-mediation:yandex-adapter:5.18.0",

		# Google Play Services
		"com.google.android.gms:play-services-appset:16.1.0",
		"com.google.android.gms:play-services-ads-identifier:18.3.0",
		"com.google.android.gms:play-services-basement:18.12.0",

		# Android UI
		"com.google.android.material:material:1.14.0",
		"androidx.appcompat:appcompat:1.8.0",
	]

	var mavem_repos: PackedStringArray = [
			# BidMachine
			"https://artifactory.bidmachine.io/bidmachine",

			# Chartboost
			"https://cboost.jfrog.io/artifactory/chartboost-ads/",

			# Mintegral
			"https://dl-maven-android.mintegral.com/repository/mbridge_android_sdk_oversea",

			# Ogury
			"https://maven.ogury.co",

			# Pangle
			"https://artifact.bytedance.com/repository/pangle",

			# PubMatic
			"https://repo.pubmatic.com/artifactory/public-repos",

			# Smaato
			"https://s3.amazonaws.com/smaato-sdk-releases/",

			# SuperAwesome
			"https://aa-sdk.s3-eu-west-1.amazonaws.com/android_repo",

			# Verve
			"https://verve.jfrog.io/artifactory/verve-gradle-release",
		]

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
			return PackedStringArray(dependencies)
		else:
			return PackedStringArray(dependencies)

	func _get_android_dependencies_maven_repos(_platform: EditorExportPlatform, _debug: bool) -> PackedStringArray:
		return PackedStringArray(mavem_repos)

	func _get_name():
		return _plugin_name
