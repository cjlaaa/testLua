require "src/extern"   --导入模板，作用调用其class函数
require "src/background"

MainScene = class("MainScene",
    function()
        return CCLayer:create() 
    end
)
 
MainScene.__index = MainScene   -- 用于访问
 
MainScene.type = 0    -- 自定义属性
 
function MainScene:createMS(fileName,_type)      --自定义构造函数
    local MainScene = MainScene.new()

    local sp = CCSprite:create("Default-568h@2x.png")
	MainScene:addChild(sp)

	local fontT = CCLabelTTF:create("HelloWorld", "Verdana-BoldItalic", 20)
	-- fontT:setPosition( ccp(s.width/2,s.height*0.9))
	MainScene:addChild(fontT,1)

    MainScene:myInit(_type)
    print("MainScene Pos"..MainScene:getPositionX().." "..MainScene:getPositionY())
    return MainScene
end
 
function MainScene:myInit(_type)    --自定义函数
    self.type =_type
end

local sceneGame = CCScene:create()

-- local sp = MainScene:createMS("Default-568h@2x.png",1)
-- sp:setPosition( ccp(s.width/2,s.height/2))
-- sceneGame:addChild( sp,0)

-- local hellworld = HelloWorld:scene()
-- sceneGame:addChild(hellworld)

local ccbLayer = Background:create();
-- ccbLayer:setPosition(ccp(s.width/2,s.height/2))
sceneGame:addChild(ccbLayer)

-- local clippingNode = CCClippingNode:create();
-- sceneGame:addChild(clippingNode);
-- local bg = CCSprite:create("Default-568h@2x.png");
-- bg:setPosition(ccp(s.width/2,s.height/2))
-- clippingNode:addChild(bg);
-- local stencil = CCSprite:create("Icon-144.png")
-- stencil:setPosition(ccp(s.width/2,s.height/2))
-- clippingNode:setStencil(stencil);
-- clippingNode:setInverted(true)

CCDirector:sharedDirector():runWithScene(sceneGame)
