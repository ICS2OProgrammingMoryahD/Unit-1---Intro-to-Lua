-----------------------------------------------------------------------------------------
--
-- Title: NumericTextFields
-- Name: MoryaH
-- Course: ICS2O/3C
-- This program displays a math question and ask the user to answer in a numeric textfield.
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

-- create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer = 0
local incorrectObject
local numIncorrect = 0
local points = 0
local win
local lose

-----------------------------------------------------------------------------------------
-- LOCAL FUNTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random number between a max. and a min. number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0,10)

	correctAnswer = randomNumber1 + randomNumber2	

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

end

local function HideCorrect()
	correctObject.isVisible = false
	incorrectObject.isVisible = false
	loseObject.isVisible = false
	winObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then
		
		-- when the answer is submitted (enter key is pressed) set user input to user's
	elseif (event.phase == "submitted") then

		-- answer
		userAnswer = tonumber(event.target.text)

		-- if the user answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			-- show the correct object
			correctObject.isVisible = true

			-- give a point if user gets the correct answer
			points = points + 1
			-- update it in the display object
			pointsText.text = "points = " .. points
			-- add timer
			timer.performWithDelay(2000, HideCorrect)
			-- show "you win!" after 5 points		
			if (points == 5) then
				correctObject.isVisible = false
				winObject.isVisible = true
				timer.performWithDelay(2000, HideWin)
			end
		-- user answer is incorrect
		else
			-- display incorrectObject when user gets answer wrong
			incorrectObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
			-- everytime user gets answer wrong add 1 to numIncorrect
			numIncorrect = numIncorrect + 1
			-- display game over after 3 wrong answers
			if (numIncorrect == 3) then
				incorrectObject.isVisible = false
				loseObject.isVisible = true
				timer.performWithDelay(2000, HideLose)
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
 nil, 50 )
questionObject:setTextColor(155/255, 44/255, 198/255)

-- create the correct text object object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, 
	display.contentHeight
*2/3, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

-- create the incorrect text object object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, 
	display.contentHeight
*2/3, nil, 50 )
incorrectObject:setTextColor(155/255, 42/255, 198/255)
incorrectObject.isVisible = false

-- create the win text object object and make it invisible
winObject = display.newImageRect("Images/win.png", 550, 400)
winObject.x =  display.contentWidth/2
winObject.y = display.contentHeight/2
winObject.isVisible = false

-- create the lose text object object and make it invisible
loseObject = display.newImageRect("Images/lose.png", 850, 490)
loseObject.x =  display.contentWidth/2
loseObject.y = display.contentHeight/2
loseObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150,
 80 )
numericField.inputType = "number"

-- add the event listen for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-- display the amount of points as a text object
pointsText = display.newText("point = " .. points, display.contentWidth/3, display.
	contentHeight/3, nil, 50)

-----------------------------------------------------------------------------------------
-- FUNTION CALLS
-----------------------------------------------------------------------------------------

--call the function to ask the question
AskQuestion()
