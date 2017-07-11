-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local background = display.newImageRect("background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY
local form = display.newImage("level.png", 5, 5)
form.x = display.contentCenterX
form.y = 5
local level=1
local xp = 0
local xplabel=xp*1,2
local nextlevel=100
local temp1=0
local temp2 = 0
local adding=0
local xptext = display.newText(xp,100,-8,native.systemFont,15)
local nextleveltext = display.newText(" /"..nextlevel,125,-8,native.systemFont,15)
local leveltext = display.newText("Уровень: "..level,200,-8,native.systemFont,15)
local xprect = display.newRect (49+temp1,15,xplabel,15)
local answer1 = display.newText(ans1, 100,-8,native.systemFont,15)
function translate ()
xptext.text=xp
if (adding>0) then
xp = xp+1
adding=adding-1
temp2 = 240/nextlevel
xplabel = xp*temp2
temp1 = xplabel/2
xprect.x = 49 + temp1
xprect.width = xplabel
recount()
end
end
Runtime:addEventListener( "enterFrame", translate )
local button= display.newText("БОЛЬШЕ ОПЫТА!", display.contentCenterX, display.contentCenterY, native.systemFont, 30)

function buttontap ()
adding = adding + 10
nextleveltext.text=" /"..nextlevel
if (xp>nextlevel or xp==nextlevel) then
local tonext = xp-nextlevel
level = level+1
leveltext.text="Уровень: "..level
if (level==1) then
nextlevel = 100
elseif (level==2) then
nextlevel = 200
elseif (level==3) then
nextlevel = 300
elseif (level==4) then
nextlevel = 400
end

xp = tonext

end
end
button:addEventListener( "touch", buttontap )
function recount()
nextleveltext.text=" /"..nextlevel
if (xp>nextlevel or xp==nextlevel) then
local tonext = xp-nextlevel
level = level+1
leveltext.text="Уровень: "..level
if (level==1) then
nextlevel = 100
elseif (level==2) then
nextlevel = 200
elseif (level==3) then
nextlevel = 300
elseif (level==4) then
nextlevel = 400
end

xp = tonext

end
end