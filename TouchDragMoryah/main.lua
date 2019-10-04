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
local backgroundImage = display.newImageRect("Images/space-2.png", 2480, 1536)
local ship = display.newImageRect("Images/spaceship.png", 350, 300)
local shipWidth = ship.width
local shipHeight = ship.shipHeight

local astro = display.newImageRect("Images/astronaut.png", 250, 250)
local astroWidth = astro.width
local astroHeight = astro.shipHeight

-- my boolean variables to keep track of which object i touched first
local alreadyTouchedAstro = false
local alreadyTouchedShip = false

-- set the initial x and y  position of myImage
astro.x = 300
astro.y = 500

ship.x = 700
ship.y = 300

-- function: astroListener
-- Input: touch listener
-- Output: none
-- Description: when astronaut is touched, move initial
local function astroListener(touch)

	if (touch.phrase == "began") then
		if (alreadyTouchedShip == false) then
			alreadyTouchedAstro = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedAstro == true) ) then
		astro.x = touch.x
		astro.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedAstro = false
		alreadyTouchedShip = false
	end
end

-- add the respective listeners to each object
astro:addEventListener("touch", astroListener)