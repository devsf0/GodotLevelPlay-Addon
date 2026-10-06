# GodotLevelPlay-Addon

An easy-to-use Unity LevelPlay (IronSource) SDK integration plugin for the Godot Game Engine.

---

## 🚀 Features

- **SDK Initialization**: Fast and simple setup using your LevelPlay App Key.
- **Banner Ads**: Load and show banner ads smoothly.
- **Interstitial Ads**: Easily load and show full-screen interstitial ads.
- **Rewarded Ads**: Reward your players by loading and displaying rewarded video ads.
- **Test Suite Integration**: Built-in support to enable and launch the LevelPlay Integration Test Suite for testing ad delivery.

---

## 🛠️ Installation

1. Download or clone this repository.
2. Copy the plugin folder into your Godot project's `res://addons/` directory.
3. Go to **Project > Project Settings > Plugins** in Godot and enable **GodotLevelPlay**.

---

## 📖 Usage & API Reference

### 1. Setup Scene Node
Add the `GodotLevelPlay` node to your scene and get its reference in your GDScript:

```gdscript
extends Node

@export var godot_level_play: GodotLevelPlay
```

### 2. Initialize SDK
Initialize LevelPlay using your App Key (typically inside `_ready()`):

```gdscript
func _ready() -> void:
    godot_level_play.init_sdk("YOUR_LEVELPLAY_APP_KEY")
```

### 3. Integration Test Suite
Use the test suite to verify that ads and mediation adapters are configured properly.

```gdscript
# Enable test suite mode
godot_level_play.enable_test_suite(true)

# Launch the LevelPlay test suite UI
godot_level_play.launch_test_suite()
```

### 4. Banner Ads
Create and display banner ads directly using your Banner Ad Unit ID:

```gdscript
godot_level_play.create_and_load_banner_ad("YOUR_BANNER_AD_UNIT_ID")
```

### 5. Interstitial Ads
Load an interstitial ad prior to displaying it:

```gdscript
# Load Interstitial Ad
godot_level_play.load_interstitial_ad("YOUR_INTERSTITIAL_AD_UNIT_ID")

# Show Interstitial Ad when ready
godot_level_play.show_interstitial_ad()
```

### 6. Rewarded Video Ads
Reward users upon watching completed ads:

```gdscript
# Load Rewarded Ad
godot_level_play.load_rewarded_ad("YOUR_REWARDED_AD_UNIT_ID")

# Show Rewarded Ad
godot_level_play.show_rewarded_ad()
```

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).