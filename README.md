# Chromium for Windows x64
Stable Chromium builds for Windows 64-bit, nothing fancy.

## Build setup
Built using Visual Studio 2022 v17.5.3 + SDK 10.0.22621.0 on Windows 10 virtual machine.

## General configuration
- H.264, HEVC and other proprietary codecs enabled (`ffmpeg_branding = "Chrome"`)
- Field trials (variations) disabled (`disable_fieldtrial_testing_config = true`)
- Official build (`is_official_build = true`)

### Builds with sync
- Widevine support (`enable_widevine = true`)
- Sync enabled using Google API keys (`use_official_google_api_keys = true`)

### Builds without sync
- No Widevine support (`enable_widevine = false`)
- Sync disabled; no Google API keys
