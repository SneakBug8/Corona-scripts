-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local physics = require( "physics")
physics.start()
local background = display.newImageRect("background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect( "platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight - 25

local balloon = display.newImageRect( "balloon.png", 112, 112)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8
plcoord = {3,5,8,10,14,15}
local x=0
local fps = 0
local count = 0
local loop=0
local first=0
local platforms = display.newGroup()
local tapText = display.newText(x, display.contentCenterX, 20, native.systemFont, 40 )
physics.addBody(platform, "static")
physics.addBody(balloon, "dynamic", { radius=50, bounce=0.3 })

local function pushBalloon()
    balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
end
local function run()
-- balloon:applyLinearImpulse( 1, 0, balloon.x, balloon.y )
fps = fps + 1
count = count + 1
balloon.x = display.contentCenterX
if (fps== 2*60) then
platform:removeSelf()
end
if (count==60) then
count=0
x=x+1
tapText.text = x
end
if (fps%120==0) then
local newplatform = display.newImageRect(platforms, "platform.png", 300, 50 )
newplatform.x = display.contentWidth+180
if (first==0) then
newplatform.y = display.contentHeight - 25
first=1
else
newplatform.y = math.random(prevy-200, prevy+200)
if (newplatform.y>display.contentHeight) then
newplatform.y = display.contentHeight
end
if (newplatform.y<0) then
newplatform.y = 0
end
end
physics.addBody(newplatform, "kinematic")
newplatform:setLinearVelocity( -100, 0 )
prevy = newplatform.y
end
end
Runtime:addEventListener( "enterFrame", run )
balloon:addEventListener( "tap", pushBalloon )