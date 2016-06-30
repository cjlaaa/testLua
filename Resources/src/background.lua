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
CarMineCCB = CarMineCCB or {}
ccb["car1"] = CarMineCCB

CarEnemyCCB = CarEnemyCCB or {}
ccb["car2"] = CarEnemyCCB

TroopMineCCB = TroopMineCCB or {}
ccb["troop1"] = TroopMineCCB

TroopEnemyCCB = TroopEnemyCCB or {}
ccb["troop2"] = TroopEnemyCCB

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
Background.craterArrayLeft = nil;
Background.craterArrayRight = nil;
Background.craterArrayLeftDeleted = nil;
Background.craterArrayRightDeleted = nil;

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
	self.craterArrayLeft = CCArray:create();
	self.craterArrayRight = CCArray:create();
	self.craterArrayLeftDeleted = CCArray:create();
	self.craterArrayRightDeleted = CCArray:create();
end

function Background:update(fT)
	self.craterArrayLeft:removeObjectsInArray(self.craterArrayLeftDeleted)
	self.craterArrayLeftDeleted:removeAllObjects();
	local i = 0
    local craterArrayLeftLen = self.craterArrayLeft:count()
    if(craterArrayLeftLen>0)then
    	for i = craterArrayLeftLen-1, 0,-1 do
	        local child = tolua.cast(self.craterArrayLeft:objectAtIndex(i), "CCNode")
	        local point = self.bgLeft:convertToWorldSpace(ccp(child:getPosition()))
	        if(point.x<0 or point.x>s.width or point.y<0 or point.y>s.height)then
	        	self.craterArrayLeftDeleted:addObject(child)
	        	self.bgLeft:removeChild(child,true)
	        end
	    end
   	end

   	self.craterArrayRight:removeObjectsInArray(self.craterArrayRightDeleted)
	self.craterArrayRightDeleted:removeAllObjects();
    local craterArrayRightLen = self.craterArrayRight:count()
    if(craterArrayRightLen>0)then   	
	    for i = craterArrayRightLen-1, 0,-1 do
	        local child = tolua.cast(self.craterArrayRight:objectAtIndex(i), "CCNode")
	        local point = self.bgRight:convertToWorldSpace(ccp(child:getPosition()))
	        if(point.x<0 or point.x>s.width or point.y<0 or point.y>s.height)then
	        	self.craterArrayRightDeleted:addObject(child)
	        	self.bgRight:removeChild(child,true)
	        end
	    end
    end
end 

function Background:onNodeEvent(event)
	if event == "enter" then
    	self.craterArrayLeft:retain();
    	self.craterArrayRight:retain();
    	self.craterArrayLeftDeleted:retain()
    	self.craterArrayRightDeleted:retain()
    elseif event == "exit" then
    	self.craterArrayLeft:release();
    	self.craterArrayRight:release();
    	self.craterArrayLeftDeleted:release()
    	self.craterArrayRightDeleted:release()
    end
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
		self.craterArrayLeft:addObject(p);
	else
		self.bgRight:addChild(p);
		p:setPosition(self.bgRight:convertToNodeSpace(targetPos))
		self.craterArrayRight:addObject(p);
	end
end

function Background:onDead(target,targetPos)
	if(targetPos==nil)then
		targetPos = unitPos[target]
	end

	if(target<7)then
		local  proxy = CCBProxy:create()
		local  node  = CCBReaderLoad("ccb/troop1.ccbi",proxy,true,"car1")
	    local  p = tolua.cast(node,"CCLayer")
	    p:setScaleX(0.5)
	    local animationMgr = tolua.cast(TroopMineCCB["mAnimationManager"],"CCBAnimationManager")
	    animationMgr:runAnimationsForSequenceNamed("dead")

	    self.bgLeft:addChild(p);
		p:setPosition(self.bgLeft:convertToNodeSpace(targetPos))
		self.craterArrayLeft:addObject(p);
	else
		local  proxy = CCBProxy:create()
		local  node  = CCBReaderLoad("ccb/troop2.ccbi",proxy,true,"car2")
	    local  p = tolua.cast(node,"CCLayer")
	    p:setScaleX(0.5)
	    local animationMgr = tolua.cast(TroopEnemyCCB["mAnimationManager"],"CCBAnimationManager")
	    animationMgr:runAnimationsForSequenceNamed("dead")

	    self.bgRight:addChild(p);
		p:setPosition(self.bgRight:convertToNodeSpace(targetPos))
		self.craterArrayRight:addObject(p);
	end
end