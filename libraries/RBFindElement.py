from robot.libraries.BuiltIn import BuiltIn
from appium.webdriver.common.touch_action import TouchAction
import AppiumLibrary


class RBFindElement(object):
    def get_current_driver(self):
        return BuiltIn().get_library_instance('AppiumLibrary')._current_application()

    def find_element_by_id_or_xpath(self, element):
        driver = self.get_current_driver()
        if "//" in element:
            return driver.find_element_by_xpath(element)
        else:
            return driver.find_element_by_id(element)

    def wait_until_element_appear_in_parrent(self, parrent, element):
        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        parrent = self.find_element_by_id_or_xpath(parrent)
        driver.implicitly_wait(30)
        child = self.find_element_by_id_or_xpath(element)
        return child

    def find_text_in_list_view_android(self,listView,element,director):
        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        parrent = self.find_element_by_id_or_xpath(listView)
        loop = True
        driver.implicitly_wait(30)
        while(loop):
            childs = driver.find_elements_by_class_name('android.widget.TextView')
            for child in childs:
                if element in child.text:
                    loop = False
                    return child
            if loop:
                self.scroll_with_director(parrent, director)
        assert False, element + ' not appear after timeout'


    

    def scroll_with_director(self,element, director):
        rect = element.rect
        x = element.location.get('x')+10
        y = element.location.get('y')
        width = element.size.get('width')/2
        height = element.size.get('height')/2 + 500

        driver = self.get_current_driver()
        actions = TouchAction(driver)
        p1 = [x, y]
        p2 = [width, height]
        if director == 'up':
            p2[0] = width/2
            p2[1] = height + y
            actions.press(x=p1[0],y=p1[1])
            for i in range(20,1):
                actions.move_to(x=width/2,y=int(height/i + y)).wait(100)
            actions.release().perform()
            #actions.press(x=p1[0],y=p1[1]).move_to(x=p2[0],y=p2[1]).wait(1000).release().wait(1000).perform()
        elif director == 'down':
            p1[0] = width/2
            p1[1] = height + y
            actions.press(x=p1[0],y=p1[1])
            for i in range(1,20):
                actions.move_to(x=width/2,y=int(p1[1]/i)).wait(100)
            actions.release().perform()
        elif director == 'right':
            p1[0] = x + width
            p1[1] = y
            p2[0] = x
            p2[1] = y
            actions.press(x=p1[0],y=p1[1]).move_to(x=p2[0],y=p2[1]).wait(1000).release().wait(1000).perform()
        elif director == 'left':
            p1[0] = x 
            p1[1] = y
            p2[0] = x + width
            p2[1] = y
            actions.press(x=p1[0],y=p1[1]).move_to(x=p2[0],y=p2[1]).wait(1000).release().wait(1000).perform()

        
        
    def find_elements_from_parent(self,rootElement,element, validExistItems):
        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        parrent = self.find_element_by_id_or_xpath(rootElement)
        childs = parrent.find_elements_by_id(element)

        for child in childs:
            for validId in validExistItems:
                validElement = child.find_element_by_id(validId)

	
#Send Gift - Section favorit numbers


    def find_text_in_section_android(self,section,text):
        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        parrent = self.find_element_by_id_or_xpath(section)
        childs = parrent.find_elements_by_class_name('android.widget.TextView')
        found = False
        for child in childs:
            if text in child.text:
                found = True
                break
        assert found == True

    def find_element_in_section_android(self,rootElement,element):
        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        parrent = self.find_element_by_id_or_xpath(rootElement)
        childs = parrent.find_elements_by_id(element)

        for child in childs:
            for validId in validExistItems:
                validElement = child.find_element_by_id(validId)


    def find_text_not_in_section_android(self,section,text):
        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        parrent = self.find_element_by_id_or_xpath(section)
        childs = parrent.find_elements_by_class_name('android.widget.TextView')
        found = False
        for child in childs:
            if text in child.text:
                found = True
                break
        assert found == False


    def drag_element_with_director(self,element, director, lenghtToMove):

        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        bottomsheet = self.find_element_by_id_or_xpath(element)
        rect = bottomsheet.rect
        x = bottomsheet.location.get('x')
        y = bottomsheet.location.get('y')
       
       

        driver = self.get_current_driver()
        actions = TouchAction(driver)
        length = int(lenghtToMove)
        p1 = [x, y]
        p2 = [x, length]
        if director == 'up':
            p2[0] = x
            p2[1] = length + y
            actions.press(x=p1[0],y=p1[1])
            for i in range(1,20):
                actions.move_to(x=p2[0],y=(length/i + y)).wait(100)
            actions.release().perform()
  
        elif director == 'down':
            p2[0] = x
            p2[1] = length + y
            actions.press(x=p1[0],y=p1[1])
            for i in range(1,20):
                actions.move_to(x=p2[0],y=(length/i)).wait(100)
            actions.release().perform()

    

    def count_element_by_class_name(self,section,listView): 
        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        parrent = self.find_element_by_id_or_xpath(section)
        elements = parrent.find_elements_by_class_name(listView)
        return len(elements)

    def find_child_elements_from_parent(self,rootElement,element):
        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        parrent = self.find_element_by_id_or_xpath(rootElement)
        childs = parrent.find_elements_by_id(element)
        return childs 

    def click_child_elements_from_parent(self,rootElement,element):
        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        parrent = self.find_element_by_id_or_xpath(rootElement)
        childs = parrent.find_elements_by_id(element)
        for child in childs:
            child.click()

    def find_element_in_list_view_android(self,listView,element,element1,director):
        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        parrent = self.find_element_by_id_or_xpath(listView)
        childs = driver.find_elements_by_class_name('androidx.cardview.widget.CardView')
        while (child):
            childs = driver.find_elements_by_class_name('androidx.cardview.widget.CardView')
            for child in childs:
                if child == element:
                    element1.click()
                    break
            if child != element:
                self.scroll_with_director(parrent, director)
    

    def click_text_in_section_android(self,section,text,element):
        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        parrent = self.find_element_by_id_or_xpath(section)
        childs = parrent.find_elements_by_class_name('android.widget.TextView')
        childs2 = parrent.find_elements_by_id(element)
        for child in childs:
            if text in child.text:
                for element in childs2:
                    element.click()

    def click_element_active(self,rootElement,element):
        driver = self.get_current_driver()
        driver.implicitly_wait(30)
        parrent = self.find_element_by_id_or_xpath(rootElement)
        childs = parrent.find_elements_by_id(element)
        Atri = childs.get_attribute("enabled")
        for child in childs:
            if Atri == True:
                child.click()
            

