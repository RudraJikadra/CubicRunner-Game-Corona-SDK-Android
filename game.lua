
local storyboard = require ("storyboard")

local physics = require "physics"
physics.start()
physics.setGravity( 0, 0)
--physics.setDrawMode( "hybrid" )


local mydata = require( "mydata" )

local scene = storyboard.newScene()
	
mydata.score = 0


function scene:createScene(event)

   local screenGroup = self.view

     
  elements = display.newGroup()
  elements.anchorChildren = true
  elements.anchorX = 0
  elements.anchorY = 0 --1
  elements.x = 0
  elements.y = 0
  screenGroup:insert(elements)

   
   	
  red1 = display.newImageRect("red0.png", 25, display.contentHeight + 50)
  red1.anchorX = 0.5
  red1.anchorY = 0.5
  red1.x = 0
  red1.y = display.contentCenterY
  screenGroup:insert(red1)
  
  
  red2 = display.newImageRect("red0.png", 12.5, display.contentHeight + 50)
  red2.anchorX = 1
  red2.anchorY = 0.5
  red2.x = display.contentWidth * 0.25 - 5
  red2.y = display.contentCenterY
  screenGroup:insert(red2)


  green1 = display.newImageRect("green0.png", 25, display.contentHeight + 50)
  green1.anchorX = 0.5
  green1.anchorY = 0.5
  green1.x = display.contentWidth
  green1.y = display.contentCenterY
  screenGroup:insert(green1)
  
  green2 = display.newImageRect("green0.png", 12.5, display.contentHeight + 50)
  green2.anchorX = 0
  green2.anchorY = 0.5
  green2.x = display.contentWidth * 0.75 + 5
  green2.y = display.contentCenterY
  screenGroup:insert(green2)
  
  
  yello1 = display.newImageRect("yello0.png", 12.5, display.contentHeight + 50)
  yello1.anchorX = 0
  yello1.anchorY = 0.5
  yello1.x = display.contentWidth * 0.25 + 5
  yello1.y = display.contentCenterY
  screenGroup:insert(yello1)
  
  
  yello2 = display.newImageRect("yello0.png", 12.5, display.contentHeight + 50)
  yello2.anchorX = 1
  yello2.anchorY = 0.5
  yello2.x = display.contentWidth * 0.5 - 5
  yello2.y = display.contentCenterY
  screenGroup:insert(yello2)
  
  
  
  blue1 = display.newImageRect("blue0.png", 12.5, display.contentHeight + 50)
  blue1.anchorX = 0
  blue1.anchorY = 0.5
  blue1.x = display.contentWidth * 0.5 + 5
  blue1.y = display.contentCenterY
  screenGroup:insert(blue1)
  
  blue2 = display.newImageRect("blue0.png", 12.5, display.contentHeight + 50)
  blue2.anchorX = 1
  blue2.anchorY = 0.5
  blue2.x = display.contentWidth * 0.75 - 5
  blue2.y = display.contentCenterY
  screenGroup:insert(blue2)
  
  
  cube = display.newImageRect("square.png", 100, 100)
  cube.anchorX = 0.5
  cube.anchorY = 0.5
  cube.x = display.contentWidth * 0.125
  cube.y = display.contentHeight * 0.75
  physics.addBody(cube, "dynamic", {density=.1, bounce=0.1, friction=.2})
  screenGroup:insert(cube)
  

  
    scoreText = display.newText(mydata.score,display.contentWidth - 100,
	100, "pixelmix", 100)
	scoreText:setFillColor(1,1,1)
	scoreText.alpha = 0
	screenGroup:insert(scoreText)
	
    instructions = display.newImageRect("instructions.png",800,1200)
	instructions.anchorX = 0.5
	instructions.anchorY = 0.5
	instructions.x = display.contentCenterX
	instructions.y = display.contentCenterY
	screenGroup:insert(instructions)
  
  
   		
    instructions2 = display.newImageRect("getready.png",700,219)
	instructions2.anchorX = 0.5
	instructions2.anchorY = 0.5
	instructions2.x = display.contentCenterX
	instructions2.y = display.contentHeight/4
	screenGroup:insert(instructions2)
	
	
	
	right = display.newImageRect("rt.png", 900, 2700)
    right.anchorX = 0
	right.anchorY = 0.5
	right.x = display.contentCenterX
	right.y = display.contentCenterY
	screenGroup:insert(right)



	left = display.newImageRect("lt.png", 900, 2700)
	left.anchorX = 1
	left.anchorY = 0.5
	left.x = display.contentCenterX
	left.y = display.contentCenterY
	screenGroup:insert(left)
	
	
   
   end
   
   
function onCollision( event )
 
 
	if ( event.phase == "began" ) then
	  
   storyboard.gotoScene( "restart" )	

	end
	
	
end



function rtTouch(event)
  if event.phase == "began" then
 --print(event.x)
		
		    if ( cube.x <= display.contentWidth * 0.75 ) then
            transition.to(cube, {time=100, x=cube.x + display.contentWidth * 0.25})  --display.contentWidth * 0.625
			
	        end	
		
	
   end
end


function ltTouch(event)


  if event.phase == "began" then
 --print(event.x)
	     	if ( cube.x >= display.contentWidth * 0.25 ) then
			transition.to(cube, {time=100, x=cube.x - display.contentWidth * 0.25})
			end
 
			
   end 
end





local gameStarted = false

function flyUp(event)
   if event.phase == "began" then
       
		if gameStarted == false then
		    right.alpha = 1
			left.alpha = 1
			 instructions.alpha = 0
			 instructions2.alpha = 0
			 scoreText.alpha = 1
			
		
			 addColumnTimer1 = timer.performWithDelay(math.random(2000, 3000), addColumns1, -1)
			 addColumnTimer2 = timer.performWithDelay(math.random(3500, 5000), addColumns2, -1)
			 addColumnTimer3 = timer.performWithDelay(math.random(1500, 3200), addColumns3, -1)
			 addColumnTimer4 = timer.performWithDelay(math.random(2700, 4700), addColumns4, -1)

			 moveColumnTimer = timer.performWithDelay(1, moveColumns, -1)
			 gameStarted = true
			
		else 
       right.alpha = 1
	   left.alpha = 1
	   --bird:applyForce(0, -900, bird.x, bird.y)
	
      end
	end
	

end





function moveColumns()
				for a = elements.numChildren,1,-1  do
		--	if(elements[a].y > ball1.y) then 
		
			if(elements[a].y > cube.y) then 
			   
				if elements[a].scoreAdded == false then

					mydata.score = mydata.score + 1
					scoreText.text = mydata.score
					elements[a].scoreAdded = true
					
				
				end
			end

	
		
			if(elements[a].y < display.contentHeight + 100) then  --2900
				elements[a].y = elements[a].y + 20
				
				if mydata.score >= 5 then 
				elements[a].y = elements[a].y + 2              
				end

				if mydata.score >= 10 then 
				elements[a].y = elements[a].y + 5              
				end
				
				if mydata.score >= 20 then 
				elements[a].y = elements[a].y + 5  				
				end
				
				if mydata.score >= 25 then 
				elements[a].y = elements[a].y + 2  				
				end
				
				if mydata.score >= 30 then 
				elements[a].y = elements[a].y + 2  				
				end
				
				if mydata.score >= 35 then 
				elements[a].y = elements[a].y + 3  				
				end
				
				if mydata.score >= 40 then 
				elements[a].y = elements[a].y + 3 				
				end
				
				if mydata.score >= 45 then 
				elements[a].y = elements[a].y + 2 				
				end
			
			
			else 
				elements:remove(elements[a])
			end	
		end
		

end




function addColumns1() --add columns is in part 5

  h1 = display.newImageRect("h1.png", display.contentWidth/4 - 10 , 150)
  h1.anchorX = 1
  h1.anchorY = 0.5
  h1.x = display.contentWidth / 4 - 5
  h1.y = - 200
  h1.scoreAdded = false
  physics.addBody(h1, "dynamic", {density=.1, bounce=0.1, friction=.2})
  elements:insert(h1)
	

end	



function addColumns2()

 
  h2 = display.newImageRect("h2.png", display.contentWidth/4 - 10 , 150)
  h2.anchorX = 1
  h2.anchorY = 0.5
  h2.x = display.contentWidth / 2 - 5
  h2.y = - 200
  h2.scoreAdded = false
  physics.addBody(h2, "dynamic", {density=.1, bounce=0.1, friction=.2})
elements:insert(h2)

end


function addColumns3()
  h3 = display.newImageRect("h3.png", display.contentWidth/4 - 10 , 150)
  h3.anchorX = 1
  h3.anchorY = 0.5
  h3.x = display.contentWidth * 0.75 - 5
  h3.y = - 200
  h3.scoreAdded = false
  physics.addBody(h3, "dynamic", {density=.1, bounce=0.1, friction=.2})
  elements:insert(h3)
  
end



function addColumns4()


  h4 = display.newImageRect("h4.png", display.contentWidth/4 - 10 , 150)
  h4.anchorX = 1
  h4.anchorY = 0.5
  h4.x = display.contentWidth - 5
  h4.y = - 200
  h4.scoreAdded = false
  physics.addBody(h4, "dynamic", {density=.1, bounce=0.1, friction=.2})
  elements:insert(h4)

end
   

local function checkMemory()
   collectgarbage( "collect" )
   local memUsage_str = string.format( "MEMORY = %.3f KB", collectgarbage( "count" ) )
  -- print( memUsage_str, "TEXTURE = "..(system.getInfo("textureMemoryUsed") / (1024 * 1024) ) )
end


function scene:enterScene(event)

 storyboard.removeScene("start")
  Runtime:addEventListener("touch", flyUp)


  Runtime:addEventListener("collision", onCollision)
  
   right:addEventListener("touch", rtTouch)
	left:addEventListener("touch", ltTouch)
  
 
  memTimer = timer.performWithDelay( 1000, checkMemory, 0 )
  
  
end


function scene:exitScene(event)
    
Runtime:removeEventListener("touch", flyUp)

	Runtime:removeEventListener("collision", onCollision)
	timer.cancel(addColumnTimer1)
    timer.cancel(addColumnTimer2)
	timer.cancel(addColumnTimer3)
	timer.cancel(addColumnTimer4)
	timer.cancel(moveColumnTimer)
	timer.cancel(memTimer)
end


function scene:destroyScene(checkMemory)

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)




return scene

   
   
   
   
   