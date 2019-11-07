# Chromium for Windows x64
Stable Chromium builds for Windows 64-bit, nothing fancy.

## General build configuration
- Visual Studio 2017
- Propertiary codecs enabled
- H.264 enabled
- Field trials disabled
- Channel unset (this allows for installing extensions outside Web Store)
- thinLTO enabled
- PGO phase 1
- Full WPO
- LLD enabled
- Official Build configuration

### Builds with sync
- Widevine support
- Sync enabled using Google API keys
- H.264 in WebRTC enabled

### Builds without sync
- No Google API keys (set to "no")
- No Widevine support
- H.264 in WebRTC disabled
