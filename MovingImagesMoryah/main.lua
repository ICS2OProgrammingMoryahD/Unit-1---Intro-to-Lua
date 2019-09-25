-----------------------------------------------------------------------------------------
-- Title: MovingObjects
-- Name: Moryah
-- Course: ICS2O/3C
-- This program moves a spaceship across the screen and then makes it fade out.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/space-2.png", 2048, 1536)

-- character image with widdth and height
local spaceship = display.newImageRect("Images/spaceship.png", 200,200)

-- set the image to be transparent
spaceship.alpha = 0

-- set the inital x and y position of spaceship
spaceship.x = 50
spaceship.y = 40

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scrool speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	spaceship.x = spaceship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	spaceship.alpha = spaceship.alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterframe", MoveShip)

-- character image with widdth and height
local astronaut = display.newImageRect("Images/astronaut.png", 200,200)

-- set the image to be transparent
astronaut.alpha = 0

-- set the inital x and y position of astronaut
astronaut.x = 50
astronaut.y = 40
-- Function: MoveMan
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scrool speed to the x-value of the astronaut
local function MoveMan(event)
	-- add the scroll speed to the x-value of the astronaut
	astronaut.x = astronaut.x + scrollSpeed
	-- change the transparency of the astronaut every time it moves so that it fades in
	astronaut.alpha = astronaut.alpha - 0.01
end

-- MoveMan will be called over and over again
Runtime:addEventListener("enterframe", MoveMan)