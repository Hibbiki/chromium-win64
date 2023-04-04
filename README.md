# Chromium for Windows x64
Stable Chromium builds for Windows 64-bit, nothing fancy.

## General build configuration
- Visual Studio 2022 v17.5.3 + SDK 10.0.22621.0
- Proprietary codecs, H.264 and HEVC enabled
- Field trials disabled
- Channel unset (this allows for installing extensions outside Web Store)
- Official Build configuration

### Builds with sync
- Widevine support
- Sync enabled using Google API keys
- H.264 in WebRTC enabled

### Builds without sync
- No Widevine support
- No Google API keys (set to "no")
- H.264 in WebRTC disabled
