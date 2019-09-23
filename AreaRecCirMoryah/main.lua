-- Title: AreaOfRectangleAndCircle
-- Name: Moryah Dick-Spring
-- Course: ICS2O/3C
-- This program displays a rectangle and shows its area

-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle
local myCircle
local radiusOfCircle = 110
local PI = 3.14
local areaOfCircle

-- set background colour of my screen. Remember that are between 0 and 1.
display.setDefault("background", 0/255, 150/255, 150/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 10

-- set the colour of the rectangle
myRectangle:setFillColor(0, 0, 0)

-- set the colour of the border
myRectangle:setStrokeColor(1, 1, 1)

-- calculate the area 
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels².", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 20
areaText.x = 20
areaText.y = display.contentHeight/2.2

-- set the colour of the newText
areaText:setTextColor(1, 1, 1)

--draw myCircle
myCircle = display.newCircle(100, 100, radiusOfCircle)

-- draw the circle in the middle letf of the screen and set its (x,y) position
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 20
myCircle.y = 380

-- set the width of the border
myCircle.strokeWidth = 10

-- set the colour of the cicle
myCircle:setFillColor( 0 )

-- set the colour of the border
myCircle:setStrokeColor( 1, 1, 1 )

-- calculate the area 
areaOfCircle = PI * radiusOfCircle

-- write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this circle with a radius of \n" ..
	radiusOfCircle .." is " ..
	areaOfCircle .. " pixels².", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = -15
areaText.x = 20
areaText.y = display.contentHeight/1.25

-- set the colour of the newText
areaText:setTextColor(1, 1, 1)
