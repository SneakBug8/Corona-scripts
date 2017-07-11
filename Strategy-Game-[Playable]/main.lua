-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
money = 1500
turn = 0
traders=1
villagers=5
food = 500
warriors = 0
foodproduce = 5
moneyprod = 25
armor = 0
-- Define interface

local background = display.newImageRect("background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

local buildtext = display.newText ("Build", display.contentCenterX-25, 50, native.systemFont, 16)
local buytext = display.newText ("Buy", display.contentCenterX+25, buildtext.y, native.systemFont, 16)

local turntext = display.newText(turn,25,20, native.systemFont, 16 )
local turn2text = display.newText("Ход",25,0, native.systemFont, 16 )
local moneytext = display.newText(money,75,20, native.systemFont, 16 )
local money2text = display.newText("Деньги",75,0, native.systemFont, 16 )
local foodtext = display.newText(food,150,20, native.systemFont, 16 )
local food2text = display.newText("Еда",150,0, native.systemFont, 16 )
local villagerstext = display.newText(villagers.."+"..traders.."+"..warriors,250,20, native.systemFont, 16 )
local villagers2text = display.newText("Крестьяне + Торговцы + Воины ",250,0, native.systemFont, 8 )

local newTurntext = display.newText ("Next turn", display.contentCenterX, display.contentHeight-50, native.systemFont, 16)

local buyVillagertext = display.newText ("Buy villager - 150", display.contentCenterX, buildtext.y+50, native.systemFont, 16)
local buytradertext = display.newText ("Buy trader - 250", display.contentCenterX, buildtext.y+100, native.systemFont, 16)
local buywarriortext = display.newText ("Buy warrior - 500", display.contentCenterX, buildtext.y+150, native.systemFont, 16)

local updatearmortext = display.newText ("Улучшить замок - 250", display.contentCenterX, buildtext.y+150, native.systemFont, 16)
updatearmortext.x=1000
local updatefoodtext = display.newText ("Улучшить фермы - 650", display.contentCenterX, buildtext.y+100, native.systemFont, 16)
updatefoodtext.x=1000
local updatemoneytext = display.newText ("Улучшить рынки - 530", display.contentCenterX, buildtext.y+50, native.systemFont, 16)
updatemoneytext.x=1000

local raidinfotext = display.newText ("nothing", display.contentCenterX, display.contentHeight, native.systemFont, 16)
-- Functionality
function newTurn()
turn = turn+1 -- general
population = villagers+traders+warriors

money = money + (traders*math.random(moneyprod,moneyprod*2)) -- economics
food = food + (villagers*foodproduce)
food = food - population
money = money - (population*5)
reload()
print ("Turn: "..turn) -- debug
end
newTurntext:addEventListener("tap", newTurn )

function reload ()
if food < 0 then
raidinfotext.text = "=== You lost ==="
end
if turn == raidturn then
raid(raidcount)
end
turntext.text = turn
moneytext.text = money
foodtext.text = food
villagerstext.text = villagers.."+"..traders.."+"..warriors
end

function buyVillager ()
cost = 150
reload()
if money > cost then
money = money-cost
villagers=villagers+1
end
end
buyVillagertext:addEventListener("tap", buyVillager)

function buyTrader ()
cost = 250
reload()
if money > cost then
money = money-cost
traders=traders+1
end
end
buytradertext:addEventListener("tap", buyTrader)

function buyWarrior ()
cost = 500
reload()
if money > cost then
money = money-cost
warriors=warriors+1
end
end
buywarriortext:addEventListener("tap", buyWarrior)

function raid (count)
print ("=== Raid ===")
raidturn = math.random (raidturn+10,raidturn+30)
raidcount = math.random (raidcount+5,raidcount+10)
print ("Raid in "..raidturn.." with "..raidcount)
raidinfotext.text = "Raid in "..raidturn.." with "..raidcount
count = count - (armor*math.random(1,3))
if warriors > count then
print (warriors.."-"..count.."="..warriors-count)
warriors = warriors - count
else
count = count-warriors
-- lose()
raidinfotext.text = "You lost"
end
end
raidturn = math.random (40,50)
raidcount = math.random (10,40)
print ("Raid in "..raidturn.." with "..raidcount)
raidinfotext.text = "Raid in "..raidturn.." with "..raidcount

function updatefood ()
cost = 500+ villagers*30
if money>cost then
foodproduce = foodproduce+5
money = money - cost
reload()
end
updatefoodtext.text = "Улучшить фермы("..foodproduce..") - "..cost
end
updatefoodtext:addEventListener("tap", updatefood)

function updatemoney ()
cost = 500 + traders*30
if money>cost then
moneyprod = moneyprod+5
money = money - cost
reload()
end
updatemoneytext.text = "Улучшить рынки("..moneyprod..") - "..cost
end

function updatearmor ()
cost = armor*250+250
if money>cost then
armor = armor+1
money = money - cost
reload()
end
updatearmortext.text = "Улучшить замок("..armor..") - "..cost

end
updatearmortext:addEventListener("tap", updatearmor)
updatemoneytext:addEventListener("tap", updatemoney)

function build ()
buyVillagertext.x=1000
buytradertext.x=1000
buywarriortext.x=1000

updatearmortext.x=display.contentCenterX
updatefoodtext.x=display.contentCenterX
updatemoneytext.x=display.contentCenterX
end
function buy ()
buyVillagertext.x=display.contentCenterX
buytradertext.x=display.contentCenterX
buywarriortext.x=display.contentCenterX

updatearmortext.x=1000
updatefoodtext.x=1000
updatemoneytext.x=1000
end

buildtext:addEventListener("tap", build)
buytext:addEventListener("tap", buy)