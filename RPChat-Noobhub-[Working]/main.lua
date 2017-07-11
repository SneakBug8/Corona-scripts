-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- display.setDefault( "anchorX", 0.5 )
-- display.setDefault( "anchorY", 0.5 )
crypto = require("crypto")
require("noobhub")

-- variables
location = "City"
local packet={}
local nickname="Player"

-- interface
log = native.newTextBox( display.contentCenterX, 200, display.contentWidth-10, 350)
chat = native.newTextField( display.contentCenterX, 400, 300, 25 )
sendbutton = display.newImage ("send.png",chat.x+100, chat.y+32)
reconnectbutton = display.newImage ("reconnect.png",32+5, chat.y+32)
clearbutton = display.newImage ("clear.png",reconnectbutton.x+32+16+5, chat.y+32)
locationtext = display.newText(location, display.contentCenterX, 0, native.systemFont, 16 )
--log.anchorX = 0.5
--og.anchorY = 0.5
--log.x= display.contentCenterX
--log.y=display.ContentCenterY


function reader(message)
if message.action[3]==location then
log.text = log.text.."\n"..message.action[2]
end
end
function sender()
if string.match (chat.text, "/me") ~= nil then
message = nickname.." "..string.sub(chat.text, 5) 
else
message = nickname..": "..chat.text
end
packet[1]=nickname
packet[2]=message
if chat.text == "goto forest" then
location = "forest"
end
packet[3]=location
   hub:publish({
            message = {
                action  =  packet,
                timestamp = system.getTimer()
            }
        });
        chat.text = ""
        reload()
end
sendbutton:addEventListener("tap", sender)
function clear()
log.text=""
end
function reload()
locationtext.text = location
end

clearbutton:addEventListener("tap", clear)
function connect ()
hub = nil
hub = noobhub.new({ server = "46.4.76.236"; port = 1337; });
    hub:subscribe({
          channel = "chat";
            callback = reader
        });
   log.text = log.text.."\n".."Connected"     
end
reconnectbutton:addEventListener("tap", connect)
        connect()