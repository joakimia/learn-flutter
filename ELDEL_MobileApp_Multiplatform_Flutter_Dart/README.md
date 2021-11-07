# ELDEL - MobileApp Multiplatform project written in Dart with the Flutter framework

# Development
## Requirements
- 1 `.env`file with API keys. The file is added to `.gitignore`. Contact another developer for copying the file.

### Usage
1. Run `flutter doctor`.
2. Run `flutter pub get` for a dev server.
3. Run `flutter run`.
4. Start either:
    - An iPhone emulator:
        * Open Xcode. 
        * Run `open -a Simulator` in a terminal.
    - An Android emulator:
        * Open Android studio.
        * On the initial page, click on Configure on the bottom bar.
        * Open AVD Manager.
        * Run an Android phone preferrably with latest version (e.g Nexus);

# Testing
### Usage
- Run `flutter test`.

# Build
## Android:
### Requirements
- 1 `eldel_android_keystore` keystore file to digitally sign the apk bundle, if `--release` flag is on, contact Joakim Amundsen if you need one.

### Usage
- Run `flutter clean`.
- Run `flutter build apk`.
