# GodotLevelPlay-Addon

An easy-to-use Unity LevelPlay (IronSource) SDK integration plugin for the Godot Game Engine.

---

## 🚀 Features

- **SDK Initialization**: Fast and simple setup using your LevelPlay App Key.
- **Banner Ads**: Load, display, and listen to banner events.
- **Interstitial Ads**: Easily load, show, and handle full-screen interstitial ads.
- **Rewarded Ads**: Reward your players by handling completion signals for video ads.
- **Event Callbacks**: Complete set of signals for SDK state, banner, interstitial, and rewarded ad events.
- **Test Suite Integration**: Built-in support to enable and launch the LevelPlay Integration Test Suite.

---

## 🛠️ Installation

1. Download or clone this repository.
2. Copy the plugin folder into your Godot project's `res://addons/` directory.
3. Go to **Project > Project Settings > Plugins** in Godot and enable **GodotLevelPlay**.

---

## 📖 Usage & API Reference

### 1. Setup Scene Node & Connecting Signals
Add the `GodotLevelPlay` node to your scene and connect to its signals in your GDScript:

```gdscript
extends Node

@export var godot_level_play: GodotLevelPlay

func _ready() -> void:
    # LevelPlay SDK Init Callbacks
    godot_level_play.connect("on_init_success", _on_init_success)
    godot_level_play.connect("on_init_failed", _on_init_failed)
    
    # Initialize SDK
    godot_level_play.init_sdk("YOUR_LEVELPLAY_APP_KEY")
```

---

### 2. Integration Test Suite
Use the test suite to verify that ads and mediation adapters are configured properly:

```gdscript
# Enable test suite mode
godot_level_play.enable_test_suite(true)

# Launch the LevelPlay test suite UI
godot_level_play.launch_test_suite()
```

---

### 3. Banner Ads
Create and display banner ads using your Banner Ad Unit ID:

```gdscript
# Load and display banner
godot_level_play.create_and_load_banner_ad("YOUR_BANNER_AD_UNIT_ID")

# Banner Callbacks
godot_level_play.connect("on_banner_ad_loaded", _on_banner_ad_loaded)
godot_level_play.connect("on_banner_ad_load_failed", _on_banner_ad_load_failed)
godot_level_play.connect("on_banner_ad_displayed", _on_banner_ad_displayed)
godot_level_play.connect("on_banner_ad_display_failed", _on_banner_ad_display_failed)
godot_level_play.connect("on_banner_ad_clicked", _on_banner_ad_clicked)
godot_level_play.connect("on_banner_ad_expanded", _on_banner_ad_expanded)
godot_level_play.connect("on_banner_ad_collapsed", _on_banner_ad_collapsed)
godot_level_play.connect("on_banner_ad_left_application", _on_banner_ad_left_application)
```

---

### 4. Interstitial Ads
Load and present full-screen interstitial ads:

```gdscript
# Load Interstitial Ad
godot_level_play.load_interstitial_ad("YOUR_INTERSTITIAL_AD_UNIT_ID")

# Show Interstitial Ad when ready
godot_level_play.show_interstitial_ad()

# Interstitial Callbacks
godot_level_play.connect("on_interstitial_ad_loaded", _on_interstitial_ad_loaded)
godot_level_play.connect("on_interstitial_ad_load_failed", _on_interstitial_ad_load_failed)
godot_level_play.connect("on_interstitial_ad_displayed", _on_interstitial_ad_displayed)
godot_level_play.connect("on_interstitial_ad_display_failed", _on_interstitial_ad_display_failed)
godot_level_play.connect("on_interstitial_ad_clicked", _on_interstitial_ad_clicked)
godot_level_play.connect("on_interstitial_ad_closed", _on_interstitial_ad_closed)
godot_level_play.connect("on_interstitial_ad_info_changed", _on_interstitial_ad_info_changed)
```

---

### 5. Rewarded Video Ads
Reward users upon watching completed ads:

```gdscript
# Load Rewarded Ad
godot_level_play.load_rewarded_ad("YOUR_REWARDED_AD_UNIT_ID")

# Show Rewarded Ad
godot_level_play.show_rewarded_ad()

# Rewarded Callbacks
godot_level_play.connect("on_rewarded_ad_loaded", _on_rewarded_ad_loaded)
godot_level_play.connect("on_rewarded_ad_load_failed", _on_rewarded_ad_load_failed)
godot_level_play.connect("on_rewarded_ad_displayed", _on_rewarded_ad_displayed)
godot_level_play.connect("on_rewarded_ad_rewarded", _on_rewarded_ad_rewarded)
godot_level_play.connect("on_rewarded_ad_display_failed", _on_rewarded_ad_display_failed)
godot_level_play.connect("on_rewarded_ad_clicked", _on_rewarded_ad_clicked)
godot_level_play.connect("on_rewarded_ad_closed", _on_rewarded_ad_closed)
godot_level_play.connect("on_rewarded_ad_info_changed", _on_rewarded_ad_info_changed)
```

---

## 📡 Available Signals Reference

Below is the complete list of signals emitted by the plugin:

| Category | Signal Name | Description |
| :--- | :--- | :--- |
| **SDK Init** | `on_init_success` | Emitted when LevelPlay SDK initializes successfully. |
| | `on_init_failed` | Emitted when SDK initialization fails. |
| **Banner** | `on_banner_ad_loaded` | Banner ad is loaded and ready. |
| | `on_banner_ad_load_failed` | Banner ad failed to load. |
| | `on_banner_ad_displayed` | Banner ad is currently visible on screen. |
| | `on_banner_ad_display_failed` | Banner ad failed to present. |
| | `on_banner_ad_clicked` | User clicked the banner ad. |
| | `on_banner_ad_expanded` | Banner opened full-screen view. |
| | `on_banner_ad_collapsed` | Banner returned to normal size. |
| | `on_banner_ad_left_application` | User left the app after clicking banner. |
| **Interstitial**| `on_interstitial_ad_loaded` | Interstitial ad loaded successfully. |
| | `on_interstitial_ad_load_failed` | Interstitial ad failed to load. |
| | `on_interstitial_ad_displayed` | Interstitial ad displayed on screen. |
| | `on_interstitial_ad_display_failed`| Interstitial ad failed to show. |
| | `on_interstitial_ad_clicked` | User clicked on interstitial ad. |
| | `on_interstitial_ad_closed` | User closed the interstitial ad. |
| | `on_interstitial_ad_info_changed` | Interstitial ad info/impression updated. |
| **Rewarded** | `on_rewarded_ad_loaded` | Rewarded ad loaded successfully. |
| | `on_rewarded_ad_load_failed` | Rewarded ad failed to load. |
| | `on_rewarded_ad_displayed` | Rewarded ad displayed on screen. |
| | `on_rewarded_ad_rewarded` | User earned the reward after completion. |
| | `on_rewarded_ad_display_failed` | Rewarded ad failed to show. |
| | `on_rewarded_ad_clicked` | User clicked on rewarded ad. |
| | `on_rewarded_ad_closed` | User closed rewarded ad. |
| | `on_rewarded_ad_info_changed` | Rewarded ad info/impression updated. |

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).