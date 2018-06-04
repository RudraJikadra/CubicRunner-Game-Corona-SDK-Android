local storyboard = require ("storyboard")
local physics = require "physics"
physics.start()
physics.setGravity( 0, 0)

local mydata = require( "mydata" )

local scene = storyboard.newScene()

mydata.score = 0



function scene:createScene(event)

   local screenGroup = self.view
   
   
   	
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


  h1 = display.newImageRect("h1.png", display.contentWidth/4 - 10 , 150)
  h1.anchorX = 1
  h1.anchorY = 0.5
  h1.x = display.contentWidth / 4 - 5
  h1.y = display.contentCenterY - 50
  h1.scoreAdded = false
 -- physics.addBody(h1, "dynamic", {density=.1, bounce=0.1, friction=.2})
  screenGroup:insert(h1)



 
  h2 = display.newImageRect("h2.png", display.contentWidth/4 - 10 , 150)
  h2.anchorX = 1
  h2.anchorY = 0.5
  h2.x = display.contentWidth / 2 - 5
  h2.y = display.contentCenterY + 200
  h2.scoreAdded = false
 -- physics.addBody(h2, "dynamic", {density=.1, bounce=0.1, friction=.2})
 screenGroup:insert(h2)


  h3 = display.newImageRect("h3.png", display.contentWidth/4 - 10 , 150)
  h3.anchorX = 1
  h3.anchorY = 0.5
  h3.x = display.contentWidth * 0.75 - 5
  h3.y = 60
  h3.scoreAdded = false
 -- physics.addBody(h3, "dynamic", {density=.1, bounce=0.1, friction=.2})
  screenGroup:insert(h3)
  


  h4 = display.newImageRect("h4.png", display.contentWidth/4 - 10 , 150)
  h4.anchorX = 1
  h4.anchorY = 0.5
  h4.x = display.contentWidth - 5
  h4.y = 200
  h4.scoreAdded = false
 -- physics.addBody(h4, "dynamic", {density=.1, bounce=0.1, friction=.2})
  screenGroup:insert(h4)

  
    title = display.newImageRect("title.png",800,650)
	title.anchorX = 0.5
	title.anchorY = 0.5
	title.x = display.contentCenterX
	title.y = display.contentHeight/3
	screenGroup:insert(title)
   
    start = display.newImageRect("start_btn.png",500,100)
	start.anchorX = 0.5
	start.anchorY = 1
	start.x = display.contentCenterX 
	start.y = display.contentHeight * 0.85
	screenGroup:insert(start)
  
  cube = display.newImageRect("square.png", 100, 100)
  cube.anchorX = 0.5
  cube.anchorY = 0.5
  cube.x = display.contentWidth * 0.625
  cube.y = display.contentHeight/2
 -- physics.addBody(cube, "dynamic", {density=.1, bounce=0.1, friction=.2})
  screenGroup:insert(cube)
  

  
  
  
end



function startGame(event)
     if event.phase == "ended" then
	
	 storyboard.gotoScene("game")
     end
end


function scene:enterScene(event)
  
  	storyboard.removeScene("restart")
	start:addEventListener("touch", startGame)
  
end


function scene:exitScene(event)

	start:removeEventListener("touch", startGame)
  
end


function scene:destroyScene(event)

end







scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)


return scene

