require "CCBReaderLoad"
local s = CCDirector:sharedDirector():getWinSize()
local unitPos = 
{
	ccp(s.width*(1/4),s.height*(2.5/6)),
	ccp(s.width*(2/4),s.height*(2/6)),
	ccp(s.width*(3/4),s.height*(1.5/6)),
	ccp(s.width*(0.5/4),s.height*(1.5/6)),
	ccp(s.width*(1.5/4),s.height*(1/6)),
	ccp(s.width*(2.5/4),s.height*(0.5/6)),

	ccp(s.width*(1/4),s.height*(4.5/6)),
	ccp(s.width*(2/4),s.height*(4/6)),
	ccp(s.width*(3/4),s.height*(3.5/6)),
	ccp(s.width*(1.5/4),s.height*(5.5/6)),
	ccp(s.width*(2.5/4),s.height*(5/6)),
	ccp(s.width*(3.5/4),s.height*(4.5/6)),
}

BackgroundCCB = BackgroundCCB or {}
ccb["Background"] = BackgroundCCB

Background = class("Background",
    function()
        return CCLayer:create() 
    end
)

Background.__index = Background   -- 用于访问
Background.bgLeft = nil;
Background.bgRight = nil;
Background.objForDelete = nil;

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

    self.bgRight = tolua.cast(BackgroundCCB["background"],"CCSprite")
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

	self.bgLeft = tolua.cast(BackgroundCCB["background"],"CCSprite")
end
  
function Background:create()      --自定义构造函数
    local Background = Background.new()

    Background:createLeftClippingNode();
    Background:createRightClippingNode();

    Background:Init();
    
    return Background
end

function Background:Init()
	self.objForDelete = CCArray:create();

    local function update(fT)
    	print(self.objForDelete:count())
    end 

    local scheduler = CCDirector:sharedDirector():getScheduler()
    local schedulerEntry = nil
    local function onNodeEvent(event)
        if event == "enter" then
        	self.objForDelete:retain();
            schedulerEntry = scheduler:scheduleScriptFunc(update, 1.0, false)
        elseif event == "exit" then
        	self.objForDelete:release();
            scheduler:unscheduleScriptEntry(schedulerEntry)
        end
    end

    self:registerScriptHandler(onNodeEvent)
end

function Background:onHit(target,targetPos)
	if(targetPos==nil)then
		targetPos = unitPos[target]
	end

	local p = CCSprite:create("keng.png")
	p:setScale(0.3)
	if(target<7)then
		self.bgLeft:addChild(p);
		p:setPosition(self.bgLeft:convertToNodeSpace(targetPos))
		self.objForDelete:addObject(p);
	else
		self.bgRight:addChild(p);
		p:setPosition(self.bgRight:convertToNodeSpace(targetPos))
		self.objForDelete:addObject(p);
	end
end

-- function OnBtnClicked()
	-- local animationMgr = tolua.cast(BackgroundCCB["mAnimationManager"],"CCBAnimationManager")
 --    animationMgr:runAnimationsForSequenceNamedTweenDuration("right", 0.1)

    -- local bg = tolua.cast(BackgroundCCB["background"],"CCSprite")
    -- print(bg:getPositionX().." "..bg:getPositionY())
-- end
-- BackgroundCCB["onBtnClick"] = OnBtnClicked
