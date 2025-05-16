This /lib folder contains:
- https://github.com/echo-lalia/qmi8658-micropython/blob/main/qmi8685.py but given the correct name "qmi8658.py"
- traceback.mpy from https://github.com/micropython/micropython-lib
- https://github.com/glenn20/micropython-esp32-ota/ installed with import mip; mip.install('github:glenn20/micropython-esp32-ota/mip/ota')
- mip.install('github:jonnor/micropython-zipfile')
- mip.install("shutil") for shutil.rmtree('/apps/com.example.files') # for rmtree()

- maybe mip.install("aiohttp") # easy websockets
- maybe mip.install("base64") # for nostr etc
- mip.install("urequests") # otherwise not present on unix target (on esp32 it is present)

