from ij import IJ
from ij.plugin.frame import RoiManager
from ij.gui import Roi
from java.awt import Color


RM = RoiManager()
rm = RM.getRoiManager()


rois = rm.getCount()

red_rev = 240
green_rev = 127
blue_rev = 154


for roi in range(9): 
    roi_obj = rm.getRoi(roi)
    roi_obj.setStrokeColor(Color(red_rev,green_rev,blue_rev))
    print(Color(red_rev,green_rev,blue_rev))
    green_rev -= 13
    red_rev -= 10
    blue_rev -= 16
    

red = 150
green = 10
blue = 10


for roi in range(10):
    roi_obj = rm.getRoi(roi+9)
    roi_obj.setStrokeColor(Color(red,green,blue))
    print(Color(red,green,blue))
    green += 13
    red += 10
    blue += 16

red_for = 240
green_for = 127
blue_for = 154

for roi in range(rois-19):
    green_for += 2
    blue_for += 1
    roi_obj = rm.getRoi(roi+19)
    roi_obj.setStrokeColor(Color(red_for, green_for, blue_for))
    print(Color(red_for,green_for,blue_for))



    
