0.0.5
=====
- Improve focus group handling while in deskop keyboard mode
- Add filesystem driver for LVGL
- Implement CTRL-V to paste on desktop
- Implement Escape key for back button on desktop
- WiFi: increase size of on-screen keyboard for easier password entry
- WiFi: prevent concurrent operation of auto-connect and Wifi app

0.0.4
=====
- Add left edge swipe gesture for back screen action
- Add animations
- Add support for QR decoding by porting quirc
- Add support for Nostr by porting python-nostr
- Add support for Websockets by porting websocket-client's WebSocketApp 
- Add support for secp256k1 with ecdh by porting and extending secp256k1-embedded
- Change theme from dark to light
- Improve display refresh rate
- Fix aiohttp_ws bug that caused partial websocket data reception
- Add support for on Linux desktop
- Add support for VideoForLinux2 devices (webcams etc) on Linux
- Improve builtin apps: Launcher, WiFi, AppStore and OSUpdate

0.0.3
=====
- appstore: add 'update' button if a new version of an app is available
- appstore: add 'restore' button to restore updated built-in apps to their original built-in version
- launcher: don't show launcher apps and sort alphabetically
- osupdate: show info about update and 'Start OS Update' before updating
- wificonf: scan and connect to wifi in background thread so app stays responsive
- introduce MANIFEST.JSON format for apps
- improve notification bar behavior

0.0.2
=====
- Handle IO0 "BOOT button" so long-press starts bootloader mode for updating firmware over USB

0.0.1
=====
- Initial release

