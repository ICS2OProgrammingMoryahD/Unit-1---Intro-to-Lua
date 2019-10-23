
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
local ground = display.newImageRect("Image/ground.png", 1024, 768)

	-- change the width to be the same as the screen
	ground.width = 1024
	
	-- Add to physics
	ground.addBody(physics, "static", {friction = 0.5, bounce = 0.3})

-----------------------------------------------------------------------------------------

local beam = display.newImage("Image/beam.png", 1600, 400)