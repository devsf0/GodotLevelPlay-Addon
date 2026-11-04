# GodotLevelPlay

**Unity LevelPlay (IronSource) integration for the Godot Game Engine.**

GodotLevelPlay provides a GDScript interface to initialize the LevelPlay SDK, request and display ads, receive ad events, and pass privacy-related values to the Android plugin.

---

## ✨ Features

- **SDK initialization** — Initialize LevelPlay with your App Key.
- **Banner ads** — Create and load banner ads and receive banner events.
- **Interstitial ads** — Load and show full-screen interstitial ads.
- **Rewarded ads** — Load and show rewarded ads and receive reward events.
- **Event signals** — Signals for SDK initialization and banner, interstitial, and rewarded ad events.
- **Integration Test Suite** — Launch the LevelPlay Integration Test Suite.
- **Privacy and metadata** — Set metadata and GDPR, CCPA, and COPPA values.

## 📋 Requirements

- Godot Engine project with the GodotLevelPlay addon installed.
- The matching native **Android** plugin configured in your Android export setup.
- A LevelPlay App Key and the relevant ad unit IDs from your LevelPlay dashboard.

> **Platform note:** The supplied GDScript implementation looks for the native singleton on Android. The ad functionality therefore requires an Android build with the native plugin available; running the project in the editor does not provide live ad functionality.

---

## 🛠️ Installation

1. Download or clone this repository.
2. Copy the `addons/GodotLevelPlay` directory into your Godot project's `res://addons/` directory.
3. Confirm that the addon has this basic structure:

   ```text
   res://addons/GodotLevelPlay/
   ├── plugin.cfg
   └── ...
   ```

4. In Godot, open **Project → Project Settings → Plugins**.
5. Enable **GodotLevelPlay**.
6. Configure the native Android plugin and its LevelPlay dependencies in your Android export setup.

---

## 🚀 Quick Start

### 1. Add the node

Add a `GodotLevelPlay` node to a scene. You can then access it through an exported reference or a node path.

### 2. Connect signals and initialize the SDK

Connect the signals you want to handle, then initialize LevelPlay with your App Key:

```gdscript
extends Node

@export var godot_level_play: GodotLevelPlay

func _ready() -> void:
    # Connect SDK initialization signals.
    godot_level_play.on_init_success.connect(_on_init_success)
    godot_level_play.on_init_failed.connect(_on_init_failed)

    # Initialize the LevelPlay SDK.
    godot_level_play.init_sdk("YOUR_LEVELPLAY_APP_KEY")

func _on_init_success() -> void:
    print("LevelPlay initialized successfully.")

func _on_init_failed() -> void:
    print("LevelPlay initialization failed. Check the Android log for details.")
```

Replace `YOUR_LEVELPLAY_APP_KEY` with your app's actual LevelPlay App Key.

---

## 📚 API Reference

### SDK initialization

| Method | Description |
| --- | --- |
| `init_sdk(appKey: String)` | Initializes the LevelPlay SDK using your App Key. |
| `launch_test_suite()` | Launches the LevelPlay Integration Test Suite. |

```gdscript
# Initialize LevelPlay.
godot_level_play.init_sdk("YOUR_LEVELPLAY_APP_KEY")

# Optional: launch the integration test suite.
godot_level_play.launch_test_suite()
```

### Privacy, consent, and metadata

The following methods pass metadata or privacy-related values to the native LevelPlay plugin:

| Method | Parameter | Description |
| --- | --- | --- |
| `set_metadata(metadata, value)` | `metadata`, `value` | Passes a metadata key and value to the SDK. |
| `set_GDPR_Consent(value: bool)` | `value` | Passes a Boolean GDPR consent value to the SDK. |
| `set_CCPA(value: bool)` | `value` | Passes a Boolean CCPA value to the SDK. |
| `set_COPPA(value: bool)` | `value` | Passes a Boolean COPPA value to the SDK. |

```gdscript
# Set metadata.
godot_level_play.set_metadata("YOUR_METADATA_KEY", "YOUR_METADATA_VALUE")

# Set privacy-related values as required by your app's consent flow.
godot_level_play.set_GDPR_Consent(true)
godot_level_play.set_CCPA(true)
godot_level_play.set_COPPA(true)
```

Use values appropriate to your app, users, and applicable privacy requirements. These methods pass values to the SDK; they do not implement a consent form or determine a user's consent for you.

### Banner ads

Create and load a banner using its Banner Ad Unit ID:

```gdscript
godot_level_play.on_banner_ad_loaded.connect(_on_banner_ad_loaded)
godot_level_play.on_banner_ad_load_failed.connect(_on_banner_ad_load_failed)

godot_level_play.create_and_load_banner_ad("YOUR_BANNER_AD_UNIT_ID")

func _on_banner_ad_loaded() -> void:
    print("Banner loaded.")

func _on_banner_ad_load_failed() -> void:
    print("Banner failed to load. Check the Android log for details.")
```

**Available banner events:**

- `on_banner_ad_loaded`
- `on_banner_ad_load_failed`
- `on_banner_ad_displayed`
- `on_banner_ad_display_failed`
- `on_banner_ad_clicked`
- `on_banner_ad_expanded`
- `on_banner_ad_collapsed`
- `on_banner_ad_left_application`

### Interstitial ads

Load an interstitial ad, then call the show method when your game is ready to present it:

```gdscript
godot_level_play.on_interstitial_ad_loaded.connect(_on_interstitial_ad_loaded)
godot_level_play.on_interstitial_ad_load_failed.connect(_on_interstitial_ad_load_failed)
godot_level_play.on_interstitial_ad_closed.connect(_on_interstitial_ad_closed)

godot_level_play.load_interstitial_ad("YOUR_INTERSTITIAL_AD_UNIT_ID")

func _on_interstitial_ad_loaded() -> void:
    print("Interstitial loaded.")
    # Call show_interstitial_ad() at the appropriate point in your game.

func _on_interstitial_ad_load_failed() -> void:
    print("Interstitial failed to load. Check the Android log for details.")

func _on_interstitial_ad_closed() -> void:
    print("Interstitial closed.")

# Call this after the ad has loaded and when you want to show it.
# godot_level_play.show_interstitial_ad()
```

**Available interstitial methods:**

- `load_interstitial_ad(addUnitId: String)`
- `show_interstitial_ad()`

**Available interstitial events:**

- `on_interstitial_ad_loaded`
- `on_interstitial_ad_load_failed`
- `on_interstitial_ad_displayed`
- `on_interstitial_ad_display_failed`
- `on_interstitial_ad_clicked`
- `on_interstitial_ad_closed`
- `on_interstitial_ad_info_changed`

### Rewarded ads

Load a rewarded ad and show it when the player chooses to watch an ad:

```gdscript
godot_level_play.on_rewarded_ad_loaded.connect(_on_rewarded_ad_loaded)
godot_level_play.on_rewarded_ad_load_failed.connect(_on_rewarded_ad_load_failed)
godot_level_play.on_rewarded_ad_rewarded.connect(_on_rewarded_ad_rewarded)

godot_level_play.load_rewarded_ad("YOUR_REWARDED_AD_UNIT_ID")

func _on_rewarded_ad_loaded() -> void:
    print("Rewarded ad loaded.")
    # Show it when the player requests the reward.

func _on_rewarded_ad_load_failed() -> void:
    print("Rewarded ad failed to load. Check the Android log for details.")

func _on_rewarded_ad_rewarded() -> void:
    print("The player completed the rewarded ad.")
    # Grant your in-game reward here.

# Call this after the ad has loaded and the player chooses to watch it.
# godot_level_play.show_rewarded_ad()
```

**Available rewarded methods:**

- `load_rewarded_ad(adUnitId: String)`
- `show_rewarded_ad()`

**Available rewarded events:**

- `on_rewarded_ad_loaded`
- `on_rewarded_ad_load_failed`
- `on_rewarded_ad_displayed`
- `on_rewarded_ad_rewarded`
- `on_rewarded_ad_display_failed`
- `on_rewarded_ad_clicked`
- `on_rewarded_ad_closed`
- `on_rewarded_ad_info_changed`

---

## 📡 Complete Signals Reference

Connect these signals to receive events from the plugin.

| Category | Signal | Description |
| --- | --- | --- |
| SDK | `on_init_success` | SDK initialization succeeded. |
| SDK | `on_init_failed` | SDK initialization failed. |
| Banner | `on_banner_ad_loaded` | Banner ad loaded. |
| Banner | `on_banner_ad_load_failed` | Banner ad failed to load. |
| Banner | `on_banner_ad_displayed` | Banner ad was displayed. |
| Banner | `on_banner_ad_display_failed` | Banner ad failed to display. |
| Banner | `on_banner_ad_clicked` | Banner ad was clicked. |
| Banner | `on_banner_ad_expanded` | Banner ad expanded. |
| Banner | `on_banner_ad_collapsed` | Banner ad collapsed. |
| Banner | `on_banner_ad_left_application` | User left the application after interacting with the banner. |
| Interstitial | `on_interstitial_ad_loaded` | Interstitial ad loaded. |
| Interstitial | `on_interstitial_ad_load_failed` | Interstitial ad failed to load. |
| Interstitial | `on_interstitial_ad_displayed` | Interstitial ad was displayed. |
| Interstitial | `on_interstitial_ad_display_failed` | Interstitial ad failed to display. |
| Interstitial | `on_interstitial_ad_clicked` | Interstitial ad was clicked. |
| Interstitial | `on_interstitial_ad_closed` | Interstitial ad was closed. |
| Interstitial | `on_interstitial_ad_info_changed` | Interstitial ad information changed. |
| Rewarded | `on_rewarded_ad_loaded` | Rewarded ad loaded. |
| Rewarded | `on_rewarded_ad_load_failed` | Rewarded ad failed to load. |
| Rewarded | `on_rewarded_ad_displayed` | Rewarded ad was displayed. |
| Rewarded | `on_rewarded_ad_rewarded` | Reward event was received after ad completion. |
| Rewarded | `on_rewarded_ad_display_failed` | Rewarded ad failed to display. |
| Rewarded | `on_rewarded_ad_clicked` | Rewarded ad was clicked. |
| Rewarded | `on_rewarded_ad_closed` | Rewarded ad was closed. |
| Rewarded | `on_rewarded_ad_info_changed` | Rewarded ad information changed. |

> **Signal arguments:** The GDScript wrapper currently emits these public signals without arguments. Error codes/messages and rewarded amount/name are received internally from the native plugin, but are not forwarded as arguments by the wrapper's public signals.

---

## 💡 Important Notes

- Use your own LevelPlay App Key and ad unit IDs; do not publish private project credentials.
- Connect the signals you need before triggering the related SDK or ad operation.
- Load interstitial and rewarded ads before attempting to show them.
- Grant an in-game reward from your `on_rewarded_ad_rewarded` handler, according to your game's reward logic.
- Test ad integration on an Android device/build with the native plugin configured.
- Privacy-related methods only pass values to the SDK. Make sure your app's consent and privacy flow is implemented appropriately.

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
