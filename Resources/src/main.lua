print "helloworld"

local sceneGame = CCScene:create()
local hellworld = HelloWorld:scene()
sceneGame:addChild(hellworld)

CCDirector:sharedDirector():runWithScene(sceneGame)