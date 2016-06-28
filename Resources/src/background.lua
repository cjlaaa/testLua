require "CCBReaderLoad"
local s = CCDirector:sharedDirector():getWinSize()

BackgroundCCB = BackgroundCCB or {}
ccb["Background"] = BackgroundCCB

Background = class("Background",
    function()
        return CCLayer:create() 
    end
)

Background.__index = Background   -- 用于访问

function Background:createLeftClippingNode()
	local  proxy = CCBProxy:create()
    local  node  = CCBReaderLoad("ccb/background.ccbi",proxy,true,"Background")
    local  layer = tolua.cast(node,"CCLayer")
    local clippingNode = CCClippingNode:create();
	local stencil = CCDrawNode:create()
	local points = CCPointArray:create(3)
	points:addControlPoint(ccp(0,0))
	points:addControlPoint(ccp(s.width,0))
	points:addControlPoint(ccp(s.width,s.height*(1/3)))
	points:addControlPoint(ccp(0,s.height*(2/3)))
	stencil:drawPolygon(points,4,ccColor4F:new(),0,ccColor4F:new());
	clippingNode:setStencil(stencil);
	clippingNode:setInverted(true)
	clippingNode:addChild(layer);
	self:addChild(clippingNode);

	local animationMgr = tolua.cast(BackgroundCCB["mAnimationManager"],"CCBAnimationManager")
    animationMgr:runAnimationsForSequenceNamedTweenDuration("right", 0.01)
end

function Background:createRightClippingNode()
	local  proxy = CCBProxy:create()
    local  node  = CCBReaderLoad("ccb/background.ccbi",proxy,true,"Background")
    local  layer = tolua.cast(node,"CCLayer")
    local clippingNode = CCClippingNode:create();
	local stencil = CCDrawNode:create()
	local points = CCPointArray:create(3)
	points:addControlPoint(ccp(s.width,s.height))
	points:addControlPoint(ccp(0,s.height))
	points:addControlPoint(ccp(0,s.height*(2/3)))
	points:addControlPoint(ccp(s.width,s.height*(1/3)))
	stencil:drawPolygon(points,4,ccColor4F:new(),0,ccColor4F:new());
	clippingNode:setStencil(stencil);
	clippingNode:setInverted(true)
	clippingNode:addChild(layer);
	self:addChild(clippingNode);

	local animationMgr = tolua.cast(BackgroundCCB["mAnimationManager"],"CCBAnimationManager")
    animationMgr:runAnimationsForSequenceNamedTweenDuration("left", 0.01)
end
  
function Background:create()      --自定义构造函数
    local Background = Background.new()

    Background:createLeftClippingNode();
    Background:createRightClippingNode();
    
    return Background
end

-- function OnBtnClicked()
	-- local animationMgr = tolua.cast(BackgroundCCB["mAnimationManager"],"CCBAnimationManager")
 --    animationMgr:runAnimationsForSequenceNamedTweenDuration("right", 0.1)

    -- local bg = tolua.cast(BackgroundCCB["background"],"CCSprite")
    -- print(bg:getPositionX().." "..bg:getPositionY())
-- end
-- BackgroundCCB["onBtnClick"] = OnBtnClicked
