from robot.libraries.BuiltIn import BuiltIn
import AppiumLibrary


class ElementUltl(object):
    def get_current_driver(self):
        return BuiltIn().get_library_instance('AppiumLibrary')._current_application()

    def get_element_same_id_at_index(self, elementId, index):
        driver = self.get_current_driver()
        List<MobileElement> elementsOne = (List<MobileElement>) driver.findElementsByAccessibilityId(elementId)
        return elementsOne[index]


    


