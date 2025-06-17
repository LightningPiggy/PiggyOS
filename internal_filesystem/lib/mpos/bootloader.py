from mpos.apps import Activity
import lvgl as lv

class ResetIntoBootloader(Activity):
    message = "Bootloader mode activated.\nYou can now install firmware over USB.\n\nReset the device to cancel."

    def onCreate(self):
        print(self.message)
        screen = lv.obj()
        label = lv.label(screen)
        label.set_text(self.message)
        label.center()
        self.setContentView(screen)

    def onResume(self, screen):
        # Use a timer, otherwise the UI won't have time to update:
        timer = lv.timer_create(self.start_bootloader, 1000, None) # give it some time (at least 500ms) for the new screen animation
        timer.set_repeat_count(1)

    def start_bootloader(self, timer):
        try:
            import machine
            machine.bootloader()
        except Exception as e:
            print(f"Could not reset into bootloader because: {e}")
