
-----------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Moryah
-- Course: ICS2O/3C
-- This program displays objects/balls on the screen falling and boucing
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require ("physics")

-- start physics
physics.start()

-----------------------------------------------------------------------------------------
-- OBJECTS
-----------------------------------------------------------------------------------------
-- ground
local ground = display.newImage("Images/ground.png", 0, 0)

	-- set the x and y location of the ground
	ground.x = display.contentWidth/2
	ground.y = 750

	-- change the width to be the same as the screen
	ground.width = display.contentWidth

	-- aad to physics
	physica.addBody(ground, "ststic", {friction = 0.5, bounce = 0. 3})

-----------------------------------------------------------------------------------------
-- beam
local beam = display.newImage("Images/beam.png", 0, 0)
	-- set the x and y pos
	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65

	--change the width to be half of the ipad width
	beam.width = display.contentWidth/2
	beam.height = display.contentHeight*1/10

	-- rotate the beam -60 degrees so its on an angle
	beam:rotate(45)

	-- send it to the back layer
	beam:toBack()

	-- add to physics
	physics.addBody(beam, "static", {frict = 0.5, bounce = 0.3})