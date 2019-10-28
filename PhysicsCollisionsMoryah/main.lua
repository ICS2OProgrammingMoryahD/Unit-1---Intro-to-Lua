
-----------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Moryah
-- Course: ICS2O/3C
-- This program displays objects/balls on the screen falling and boucing
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local backgroundSound = audio.loadSound("Sounds/backgroundSound.mp3")		  |
-- Setting a VARIABLES                                                 			  |
--																				  |
-- to an mp3 file                                                       	 	  |
--local backgroundSoundChannel                                         			  |

-- backgroundSoundChannel = audio.play(backgroundSound, {loops = -1})

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
	
local ground = display.newImage("Images/ground.png", 512, 768)

	-- Change the width to be the same as the screen
	ground.width = display.contentWidth

	-- Add to physics
	physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3})
-----------------------------------------------------------------------------------------

local beam = display.newImage("Image/beam.jpg", 1600, 400)
	
-- display beam
local beam = display.newImage("Images/beam.jpg")

-- set the x and y pos
	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65
	
-- set the width and height of the beam
	beam.width = display.contentWidth/2
	beam.height = display.contentHeight/10
	
	-- rotate the beam -60 degrees so its on an angle 
	beam:rotate(45)

	-- send it to the back layer
	beam:toBack()

	-- add to physics
	physics.addBody(beam, "static", {friction=0.5, bounce=0.3})
-- create bkg
local bkg = display.newImage("Images/bkg.jpg", 500, 244)

	-- set the x and the y pos
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	bkg = display.contentWidth
	bkg = display.contentHeight

	-- send to back
	--bkg:toBack()

-----------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------

-- create the first ball
local function firstBall()

	-- creating first ball
	local ball1 = display.newImage("Image/ball.png", 50, 50)
		
		ball1.width = 100
		ball1.height = 100

	-- add to physics
	physics:addBody(ball1, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 25})
end
-----------------------------------------------------------------------------------------

--create ball2
local function secondball()
	-- creating second ball
	local ball2 = display.newImage("Image/ball.png", 25, 25)

		ball2.width = 100
		ball2.height = 100

	-- add to physics
	physics:addBody(ball2, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 12.5})
end
-----------------------------------------------------------------------------------------

--create ball3
local function thirdball()
	-- creating third ball
	local ball3 = display.newImage("Image/ball.png", 12.5, 12.5)

		ball3.width = 100
		ball3.height = 100

	-- add to physics
	physics:addBody(ball3, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 6.25})
end
-----------------------------------------------------------------------------------------

--create ball4
local function fourthball()
	-- creating fourth ball
	local ball4 = display.newImage("Image/ball.png", 6.25, 6.25)

		ball4.width = 100
		ball4.height = 100

	-- add to physics
	physics:addBody(ball4, {density = 1.0, friction = 0.5, bounce = 0.3, radius =3.125})
end

-----------------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond
-----------------------------------------------------------------------------------------

timer.performWithDelay( 0, firstBall )
timer.performWithDelay( 500, secondball)
timer.performWithDelay( 1000, thirdball)
timer.performWithDelay( 1500, fourthball)
