-----------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Moryah
-- Course: ICS2O/3C
-- This program displays objects/balls on the screen falling and boucing
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- load physics
local physics = require("physics")

-- start physics
physics.start()

-----------------------------------------------------------------------------------------
-- OBJECTS
-----------------------------------------------------------------------------------------

-- Ground
local ground = display.newImage("Physics/ground.png", 0, 0)
	
	-- put the ground at the middle of the screen
	-- set the height of the bkg image to be the height of the ipad
	-- Change the width to be the same as the screen
	ground.width = display.contentWidth/2
	
	-- Add to physics
	physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3})

-----------------------------------------------------------------------------------------
	