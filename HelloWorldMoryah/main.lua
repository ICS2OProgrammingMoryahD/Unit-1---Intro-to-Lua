-----------------------------------------------------------------------------------------
--
-- main.lua
-- Title: HelloWorld
-- Name: Moryah Dick-Spring
-- Course: ICS2O/3C
-- This program displays Hello to the simulator and to the command terminal.
-----------------------------------------------------------------------------------------

-- print "Hello, World" to the command terminal
print ("***Hellooooooooooooo")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 150/255, 150/255, 250/255)

-- create a local variable
local textObject

-- displays text on the screen at position x = 500 and y = 500 with
-- a deafult font style and font size of 50
textObject = display.newText( "Hello, World", 500, 400, nil, 80 )

-- sets the color of the text
textObject:setTextColor(0/255, 0/255, 0/255)

-- create a new local variable
local textObjectSignature

-- displays anothe text on the screen
textObjectSignature = display.newText("By Moryah", 500, 500, nil, 50)
