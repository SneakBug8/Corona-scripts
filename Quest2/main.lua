-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local background = display.newImageRect("background.png",720,1280)
local location=1
local description="Добро пожаловать в наш Квест!"
local button="Начать"
local image= display.newImage("39.png",display.contentCenterX,50)
local descriptiontext = native.newTextBox(display.contentCenterX, display.contentCenterY+75,300,150)
descriptiontext.size=16
local buttonimage= display.newImage("button.png",display.contentCenterX,display.contentHeight)
local buttontext=display.newText(button,display.contentCenterX,display.contentHeight,native.systemfont,30)
local question = native.newTextField( display.contentCenterX, 206, display.contentCenterX+100, 50 )
local ans1 = display.newText(button,display.contentCenterX,display.contentHeight-60,native.systemfont,30)
local ans2 = display.newText(button,display.contentCenterX,display.contentHeight-40,native.systemfont,30)
local ans3 = display.newText(button,display.contentCenterX,display.contentHeight-20,native.systemfont,30)
local answer=0
function onpress ()
fadeout()
             if (location==1) then
       loc3()
       reload()
        elseif (location==2) then
        if answer==1 then
        loc3()
        reload()
        else
        question.text="Неверно"
        end
        elseif (location==3) then
        if answer==1 then
       loc4()
       reload()
         else
        question.text="Неверно"
       end
       elseif (location==4) then
        if string.find(question.text, "алягин")~=nil then
       loc5()
       reload()
         else
        question.text="Неверно"
       end
        elseif (location==5) then
        if string.find(question.text, "енин")~=nil then
       loc6()
       reload()
         else
        question.text="Неверно"
       end
         elseif (location==6) then
        if string.find(question.text, "ита")~=nil then
       loc7()
       reload()
         else
        question.text="Неверно"
       end
         elseif (location==7) then
        if string.find(question.text, "енин")~=nil then
       loc8()
       reload()
         else
        question.text="Неверно"
       end
         end
fadein()
    end
function reload ()
question.text=""
descriptiontext.text=description
end
function fadein ()
-- transition.fadeIn(descriptiontext, { time=200 } )
-- transition.fadeIn(buttonimage, { time=200 } )
-- transition.fadeIn(buttontext, { time=200 } )
-- transition.fadeIn(image, { time=200 } )
end
function fadeout ()
-- transition.fadeOut(descriptiontext, { time=200 } )
-- transition.fadeOut(buttonimage, { time=200 } )
-- transition.fadeOut(buttontext, { time=200 } )
-- transition.fadeOut(image, { time=200 } ) 
end
function loc1 ()
          description="Добро пожаловать в наш Квест!"
        question.x=10000
            end
function loc2()
location = 2
         buttontext.text="Далее"
        question.x=display.contentCenterX
        description="Выходите из метро Чистые Пруды в сторону Чистых Прудов?"
        local image= display.newImage("grib.png",display.contentCenterX,50)
        answer = "рибоедов"
            end

        function loc3()
               location = 3
        question.x=display.contentCenterX
        description="Какой номер дома у Центрального Почтамта справа от памятника Грибоедову?"
        answer = "26"
        local image= display.newImage("rrd.png",display.contentCenterX,50)
            end

             function loc4()
             location = 4
        question.x=display.contentCenterX
        description="Пройдите к театру Et Cetera. Кто художественный руководитель театра?"
        answer = "алягин"
        local image= display.newImage("rrd.png",display.contentCenterX,50)
            end

             function loc5()
             location = 5
        question.x=display.contentCenterX
        description="Пройдите к памятнику Надежде Констанитиновны Крупской. Чьм соратником, другом и женой она была?"
        answer = "алягин"
        local image= display.newImage("rrd.png",display.contentCenterX,50)
            end

               function loc6()
             location = 6
        question.x=display.contentCenterX
        description="Перед приездом делегации какой страны был построен Китайский дом около почтампта?"
        answer = "ита"
        local image= display.newImage("china.png",display.contentCenterX,50)
            end

               function loc7()
             location = 7
        question.x=display.contentCenterX
        description="Пройдите к памятнику Надежде Констанитиновны Крупской. Чьм соратником, другом и женой она была?"
        answer = "алягин"
        local image= display.newImage("rrd.png",display.contentCenterX,50)
            end
            loc1()
            reload()
           buttonimage:addEventListener( "tap", onpress)
           
           function answer1()
           answer=1
           onpress()
           end
           function answer2()
           answer=2
           onpress()
           end
           function answer3()
           answer=3
           onpress()
           end
           ans1:addEventListener( "tap", answer1)
           ans2:addEventListener( "tap", answer2)
           ans3:addEventListener( "tap", answer3)