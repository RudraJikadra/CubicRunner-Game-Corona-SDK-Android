

local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local mydata = require( "mydata" )
local score = require( "score" )



local RevMob = require("revmob")
local banner = RevMob.createBanner({x = display.contentWidth / 2, y = display.contentHeight - 50, width = display.contentWidth, height = 100 })
 
local fullscreen = RevMob.createFullscreen()




function restartGame(event)
     if event.phase == "ended" then
		saveScore()
		storyboard.gotoScene("start")
		fullscreen:hide()
     end
end

function showStart()
	startTransition = transition.to(restart,{time=200, alpha=1})
	scoreTextTransition = transition.to(scoreText,{time=600, alpha=1})
	scoreTextTransition = transition.to(bestText,{time=600, alpha=1})
end




function showScore()
    scoreTransition = transition.to(medal0,{time=400, y=display.contentCenterY + 23})
	scoreTransition = transition.to(scoreBg,{time=400, y=display.contentCenterY,onComplete=showStart})
	
	local prevScore = score.load()	
		if prevScore <= mydata.score then
			scoreTransition = transition.to(medal,{time=400, y=display.contentCenterY + 23})
			new.alpha = 1
			end
	
	
	
end




function showGameOver()
	fadeTransition = transition.to(gameOver,{time=600, alpha=1, onComplete=showScore})
end



function loadScore()
	local prevScore = score.load()	
	
	if prevScore ~= nil then
		if prevScore <= mydata.score then
			score.set(mydata.score)
			
		else 
			score.set(prevScore)	
		end
	
	else 
		score.set(mydata.score)	
		score.save()
		
	end
end

function saveScore()
	score.save()
end

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
  
  
	gameOver = display.newImageRect("gameOver.png",500,120)
	gameOver.anchorX = 0.5
	gameOver.anchorY = 0.5
	gameOver.x = display.contentCenterX 
	gameOver.y = display.contentHeight/4
	gameOver.alpha = 0
	screenGroup:insert(gameOver)
	
	medal0 = display.newImageRect("medal0.png",200,200)
	medal0.anchorX = 0.5
	medal0.anchorY = 0.5
	medal0.x = display.contentCenterX - 94
	medal0.y = display.contentHeight + 500
	medal0.alpha = 1
	screenGroup:insert(medal0)
	
	medal = display.newImageRect("medal.png",200,200)
	medal.anchorX = 0.5
	medal.anchorY = 0.5
	medal.x = display.contentCenterX - 94
	medal.y = display.contentHeight + 500
	medal.alpha = 1
	screenGroup:insert(medal)
	
    scoreBg = display.newImageRect("menuBg.png",480,393)
	scoreBg.anchorX = 0.5
	scoreBg.anchorY = 0.5
    scoreBg.x = display.contentCenterX
    scoreBg.y = display.contentHeight + 500
    screenGroup:insert(scoreBg)
	
	new = display.newImageRect("new.png", 100, 80)
	new.anchorX = 0.5
	new.anchorY = 0.5
	new.x = display.contentCenterX - 94
	new.y = display.contentCenterY - 80
	new.alpha = 0
	screenGroup:insert(new)

	

	restart = display.newImageRect("restart_btn.png",500,100)
	restart.anchorX = 0.5
	restart.anchorY = 1
	restart.x = display.contentCenterX 
	restart.y = display.contentHeight * 0.85
	restart.alpha = 0
	screenGroup:insert(restart)
  
   scoreText = display.newText(mydata.score,display.contentCenterX + 110,
	display.contentCenterY - 60, native.systemFont, 50)
	scoreText:setFillColor(0,0,0)
	scoreText.alpha = 0 
	screenGroup:insert(scoreText)
		
	bestText = score.init({
	fontSize = 50,
	font = "Helvetica",
	x = display.contentCenterX + 70,
	y = display.contentCenterY + 85,
	maxDigits = 7,
	leadingZeros = false,
	filename = "scorefile.txt",
	})
	bestScore = score.get()
	bestText.text = bestScore
	bestText.alpha = 0
	bestText:setFillColor(0,0,0)
	screenGroup:insert(bestText)
	
  
	
end



function scene:enterScene(event)

    banner:show()
	
    fullscreen:show()
	

	storyboard.removeScene("game")
	restart:addEventListener("touch", restartGame)
	showGameOver()
	loadScore()
end

function scene:exitScene(event)
	restart:removeEventListener("touch", restartGame)
	transition.cancel(fadeTransition)
	transition.cancel(scoreTransition)
	transition.cancel(scoreTextTransition)
	transition.cancel(startTransition)
end

function scene:destroyScene(event)

end





local AMAZON_APK = false
local REVMOB_IDS = {
 [REVMOB_ID_IOS] = '55b741c67557d4a166036fc2',
 [REVMOB_ID_ANDROID] = '55b741c67557d4a166036fc2',
 
}

if AMAZON_APK then REVMOB_IDS[REVMOB_ID_ANDROID] = '55b741c67557d4a166036fc2' end

   RevMob.startSession(REVMOB_IDS)
  -- RevMob.setTestingMode(RevMob.TEST_WITH_ADS)
 --  RevMob.showFullscreen()




scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene




