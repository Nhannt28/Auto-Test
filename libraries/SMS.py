from robot.libraries.BuiltIn import BuiltIn
import AppiumLibrary


class SMS(object):
    def get_current_driver(self):
        return BuiltIn().get_library_instance('AppiumLibrary')._current_application()

    def get_otp_from_notification_android(self, text):
        driver = self.get_current_driver()
        driver.open_notifications()

        try:
            driver.implicitly_wait(60)
            otpElement = driver.find_element_by_xpath('//android.widget.TextView[contains(@text, \''+text+'\')]')
            text = otpElement.text
            listText = text.split(sep=" ")
            el = driver.find_element_by_xpath('//android.widget.Button[contains(@text,\'Mark as read\')]')
            el.click()
            driver.press_keycode(4)
            return listText[-1]
        except:
            driver.press_keycode(4)
        
        
        


    


