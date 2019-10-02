-----------------------------------------------------------------------------------------
-- Title: TouchAndDrag
-- Name: Your Name
-- Course: ICS2O/3C
-- This program moves images when you press on them and doesn't stick to others
-- dragged over them
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- loocal variables. i am sill trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/space-2.png", 1660, 1500)