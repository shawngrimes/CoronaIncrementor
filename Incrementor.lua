module(..., package.seeall)

local ui=require("ui")

function newIncrementor(params)
	local incrementor
	
	incrementor=display.newGroup()
	
	local valueLabel=display.newText("0", 0, 0, native.systemFont, 48)
	valueLabel.x=0
	valueLabel.y=0
	incrementor:insert(valueLabel)
	
	if ( params.onChange and ( type(params.onChange) == "function" ) ) then
		incrementor._onChange=params.onChange
	end
	
	local increaseButtonPressed = function (event )
			if event.phase == "release" then
				valueLabel.text=valueLabel.text+1
				if(incrementor._onChange) then
					incrementor._onChange(incrementor)
				end
			end
	end
	
	local increaseButton = ui.newButton{
		default = "button.png",
		over = "button-down.png",
		onEvent = increaseButtonPressed,
		id = "btn001",
		text = "+",
		font = native.systemFont,
		textColor = { 255, 255, 255, 255 },
		size = 48,
		emboss = true
	}
	increaseButton.x=-increaseButton.contentWidth
	incrementor:insert(increaseButton)
	
	local decreaseButtonPressed = function (event )
			if event.phase == "release" then
				valueLabel.text=valueLabel.text-1
				if(incrementor._onChange) then
					incrementor._onChange(incrementor)
				end
			end
	end
	
	local decreaseButton = ui.newButton{
		default = "button.png",
		over = "button-down.png",
		onEvent = decreaseButtonPressed,
		id = "btn001",
		text = "-",
		font = native.systemFont,
		textColor = { 255, 255, 255, 255 },
		size = 48,
		emboss = true
	}
	decreaseButton.x=increaseButton.x/2 + valueLabel.contentWidth + increaseButton.contentWidth
	incrementor:insert(decreaseButton)
	
	-- Public methods
	function incrementor:getValue()
		return valueLabel.text
	end

	return incrementor
end