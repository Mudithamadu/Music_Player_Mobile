# Music Player 🎵

A simple and lightweight music player application built with Flutter, designed to play local audio files with a clean and intuitive user interface.

---

## 📑 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)

---

## 📖 Overview

The **music_player** app is a Flutter-based application that allows users to play audio files stored locally on their device. It leverages the [`audioplayers`](https://pub.dev/packages/audioplayers) package for audio playback and [`provider`](https://pub.dev/packages/provider) for state management, offering a seamless music listening experience on Android and iOS.

---

## ✨ Features

- 🎧 **Audio Playback**: Play, pause, stop, and seek through audio tracks.
- 📂 **Local Audio Support**: Play audio files stored in the `assets/audios/` directory or from device storage.
- ⚙️ **State Management**: Uses the `provider` package for efficient state handling.
- 🎨 **Material Design**: Responsive and modern UI built with Flutter's Material Design components.
- 🖼️ **Custom Assets**: Supports custom images and audio files in the `assets/` directory.

---

## 📋 Requirements

- **Flutter**: Version `3.7.2` or higher  
- **Dart SDK**: Compatible with `^3.7.2`  
- **Supported Platforms**:
  - Android (API 21+)
  - iOS (12.0+)

> 🔒 **Permissions Required (for device storage access)**  
> - Android: Storage access  
> - iOS: Media Library access  

---

## 🛠️ Installation

1. **Clone the Repository**

```bash 
git clone https://github.com/your-username/music-player.git
cd music-player
```

2. **Install Dependencies**
```bash 
flutter pub get
```
3. **Add Audio Assets** (Storage access still not working)
- Place your audio files in the `assets/audios/` directory and include them in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/audios/
```
4. **Run the App**
- Connect a device or emulator/simulator and run:
```bash
flutter run
```
5. **Build for Release**
- To generate a release build:
```bash
flutter build apk   # Android
flutter build ios   # iOS
```
## ▶️ Usage
- Launch the app on your device.
- Grant storage/media access if prompted.
- Select an audio file via the UI to begin playback.
- Use the playback controls to play, pause, stop, or seek.

## 📁 Project Structure
```plain text
music_player/
├── android/              # Android-specific files
├── ios/                  # iOS-specific files
├── lib/                  # Main Flutter source code
│   ├── models/           # Data models (e.g., Song)
│   ├── screens/          # UI screens (e.g., HomeScreen, PlayerScreen)
│   ├── providers/        # State management with Provider
│   ├── widgets/          # Reusable UI components
│   └── main.dart         # App entry point
├── assets/               # Static assets
│   ├── images/           # Image assets for UI
│   ├── audios/           # Audio files for playback
├── pubspec.yaml          # Flutter configuration and dependencies
└── README.md             # Project documentation
```
## 📦 Dependencies
**Main Packages**
- audioplayers: ^6.5.0: For audio playback.
- provider: ^6.1.5: For state management.
- flutter: Flutter SDK.

**Dev Dependencies**
- flutter_test: For unit/widget testing.
- flutter_lints: ^5.0.0: Linting and code best practices.

📋 Full list available in `pubspec.yaml`.
