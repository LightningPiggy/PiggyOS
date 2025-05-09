# START OF COPY-PASTE FROM https://sim.lvgl.io/v9.0/micropython/ports/webassembly/

# Initialize

import display_driver
import lvgl as lv

# Create a button with a label

scr = lv.obj()
btn = lv.button(scr)
btn.align(lv.ALIGN.CENTER, 0, 0)
label = lv.label(btn)
label.set_text('Hello World!')
lv.screen_load(scr)

# END OF COPY-PASTE FROM https://sim.lvgl.io/v9.0/micropython/ports/webassembly/

# Added: wait until the user navigates away instead of stopping immediately.
while lv.screen_active() == scr:
    import time
    time.sleep_ms(100)
print("User navigated away from the HelloWorld app. Bye bye!")
