-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local incrementor=require("Incrementor")

local function incrementorChanged(incrementorThatChanged)
	print("value changed to:"..incrementorThatChanged:getValue())
end

--Create a new incrementor and tell it to call the "incrementorChanged" 
--function above when the incrementor changes
local testIncrementor=incrementor.newIncrementor{onChange=incrementorChanged}

testIncrementor.x=display.contentWidth/2
testIncrementor.y=display.contentHeight/2