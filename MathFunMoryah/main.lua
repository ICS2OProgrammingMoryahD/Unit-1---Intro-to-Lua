-----------------------------------------------------------------------------------------
-- Title: MathFun
-- Name: Moryah
-- Course: ICS2O/3C
-- This program creates math problems with random operators
-- (*,-,+,/)
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 1/255, 1/255, 55/255)
 
-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local randomOperator
local num1
local num2
local num3
local questionObject
local userAns
local correctAnswer
local correctObject
local incorrectObject
local numericField

local correct = audio.loadSound("correct.mp3") -- Setting a variable
local correctChannel

local incorrect = audio.loadSound("incorrect.mp3") -- Setting a variable
local incorrectChannel

local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

local lives = 3
local heart
local heart2
local heart3

-----------------------------------------------------------------------------------------
-- LOCAL FUNTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()

	StartTimer()

	-- chose a random operators
	randomOperator = math.random(1,4)
	
	if (randomOperator == 1) then
		-- generate 2 random number between a max. and a min. number
		num1 = math.random(0, 10)
		num2 = math.random(0, 10)
		correctAnswer = num1 + num2
		-- create question in text object
		questionObject.text = num1 .. "+" .. num2 .. " = "
	elseif (randomOperator == 2) then
		-- generate 2 random number between a max. and a min. number
		num1 = math.random(0, 10)
		num2 = math.random(0, 10)

		if (num1 < num2) then
			correctAnswer = num2 - num1
		else
			correctAnswer = num1 - num2	
		end
		-- create question in text object
		questionObject.text = num1 .. "-" .. num2 .. " = "
	elseif (randomOperator == 3) then
		-- generate 2 random number between a max. and a min. number
		num1 = math.random(0, 10)
		num2 = math.random(0, 10)

		if (num1 < num2) then
			correctAnswer = num2 * num1
		else
			correctAnswer = num1 * num2		
		end
		-- create question in text object
		questionObject.text = num1 .. "*" .. num2 .. " = "
	elseif (randomOperator == 4) then
		-- generate 2 random number between a max. and a min. number
		num1 = math.random(10, 100)
		num2 = math.random(1, 10)
		num3 = num1 * num2
		correctAnswer = num3/num1

		
		-- create question in text object
		questionObject.text = num3.. "/" .. num2 .. " = "
	end
end

local function UpdateTime()
	
	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then
		-- reset the number of seconds left

		secondsLeft = totalSeconds

		lives = lives - 1

		-- *** IF THERE ARE NO MORE LIVEES LEFT, PLAY LOSE SOUND, SHOW IMAGE
		-- AND CHANGE THE TIMER REMOVE THE THIRD HEART BY MAKING IT invisible

		if (lives == 2) then

			heart.isVisible = true
			heart2.isVisible = true
			heart3.isVisible = false


		elseif (lives == 1) then

			heart.isVisible = true
			heart2.isVisible = false
			heart3.isVisible = false

		elseif (lives == 0) then

			heart.isVisible = false
			heart2.isVisible = false
			heart3.isVisible = false
			questionObject.isVisible = false
			numericField.isVisible = false
			clockText.isVisible = false
			loseObject.isVisible = true

		end
	end
end

-- functions that calls the timer
function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

local function HideCorrect()
	correctObject.isVisible = false
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event ) -- User begins typing in "numericField"
	
	if ( event.phase == "began" ) then
	
	-- when the answer is submitted (enter key is pressed) set user input to user's
	elseif (event.phase == "submitted") then

		-- changes the user's answer into numbers
		userAnswer = tonumber(event.target.text)

		-- if the user answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			
			correctChannel = audio.play(correct)
			
			-- show the correct object
			correctObject.isVisible = true
			
			-- add timer
			timer.performWithDelay(2000, HideCorrect)
		
		else -- user answer is incorrect
			
			lives = lives - 1

			incorrectChannel = audio.play(incorrect)

			-- display incorrectObject when user gets answer wrong
			incorrectObject.text = ("Incorrect! The correct answer was " .. correctAnswer
			 .. ".")
			incorrectObject.isVisible = true
			
			timer.performWithDelay(2000, HideCorrect)

			if (lives == 2) then

				heart.isVisible = true
				heart2.isVisible = true
				heart3.isVisible = false

			elseif (lives == 1) then

				heart.isVisible = true
				heart2.isVisible = false
				heart3.isVisible = false

			elseif (lives == 0) then

				heart.isVisible = false
				heart2.isVisible = false
				heart3.isVisible = false
				questionObject.isVisible = false
				numericField.isVisible = false
				clockText.isVisible = false
				incorrectObject.isVisible = false
				correctObject.isVisible = false
				loseObject.isVisible = true

			end
		end
		-- clear text field
		event.target.text = ""
	end
end

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2,
 nil, 60 )
questionObject:setTextColor(55/255, 55/255, 255/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, 
	display.contentHeight
*2/3, nil, 77 )
correctObject:setTextColor(55/255, 255/255, 55/255)
correctObject.isVisible = false

-- create the incorrect text object object and make it invisible
incorrectObject = display.newText( "Incorrect!" , display.contentWidth/2, 
	display.contentHeight
*2/3, nil, 60 )
incorrectObject:setTextColor(255/255, 55/255, 55/255)
incorrectObject.isVisible = false

-- create the incorrect text object object and make it invisible
loseObject = display.newText( "GAME OVER!" , display.contentWidth/2, 
	display.contentHeight/2, nil, 111 )
loseObject:setTextColor(255/255, 55/255, 55/255)
loseObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150,
 80 )
numericField.inputType = "number"

-- add the event listen for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

clockText = display.newText("" .. secondsLeft, 100, 100, nil, 99)
clockText:setTextColor(1, 0, 0)

-- create the lives to display on the screen
heart = display.newImageRect("Images/heart.png", 100, 100)
heart.x = display.contentWidth *7/8
heart.y = display.contentHeight *1/7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth *6/8
heart2.y = display.contentHeight *1/7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth *5/8
heart3.y = display.contentHeight *1/7
-----------------------------------------------------------------------------------------
-- FUNTION CALLS
-----------------------------------------------------------------------------------------
-- *** CALL THE FUNCTION TO ASK A NEW QUESTION
AskQuestion()
