CoronaIncrementor
=================

This is a project to implement a basic incrementor control in Corona SDK.

To Implement:

1. Copy ui.lua and Incrementor.lua into your project folder.
2. Add the library to your project's main.lua:
````
local incrementor=require("Incrementor")
````

3. Create a function to handle when the incrementor changes value:
````
local function incrementorChanged(incrementorThatChanged)
	print("value changed to:"..incrementorThatChanged:getValue())
end
````

4. Create a new incrementor and tell it which function to call when the value changes:
````
local testIncrementor=incrementor.newIncrementor{onChange=incrementorChanged}
````

5. The incrementor is a display group so you can move it like any other display object:
````
testIncrementor.x=display.contentWidth/2
testIncrementor.y=display.contentHeight/2
````