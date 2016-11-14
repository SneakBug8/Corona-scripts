-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local location = 1
local background = display.newImageRect("background.png",570,360)
local description = "none"
local descriptiontext = display.newText(description, display.contentCenterX,40,display.contentWidth-20,0, native.systemfont, 18)
descriptiontext.align = "left"
local act1 = "act1"
local act1text = display.newText(act1, display.contentCenterX, display.contentCenterY+40, native.systemfont, 40)
local act2 = "act2"
local act2text = display.newText(act2, display.contentCenterX, display.contentCenterY+80, native.systemfont, 40)
local act3 ="act3"
local act3text = display.newText(act3, display.contentCenterX, display.contentCenterY+120, native.systemfont, 40)
background.x = display.contentCenterX
background.y = display.contentCenterY
function onframe ()
        if (location==1) then
        description="Вы видите большой и просторный корабль. /n Вам здесь нравится."
        descriptiontext.text=description
            function action1 ()
            end
            act1text:addEventListener( "tap", action1)
            function action2 ()
            end
            act2text:addEventListener( "tap", action2 )
            function action3 ()
            end
            act3text:addEventListener( "tap", action3 )
        elseif (location==2) then
        end
    end
Runtime:addEventListener( "enterFrame", onframe)