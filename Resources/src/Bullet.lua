local bulletRunTime = 0.5
local bulletWaitTime = bulletRunTime*2

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

Bullet = class("Bullet",
    function()
        return CCLayer:create() 
    end
)

Bullet.__index = Bullet

function Bullet:create() 
    local Bullet = Bullet.new()
    Bullet:Init();

    return Bullet
end

function Bullet:Init()
	local sp = CCSprite:create("dandao_00000.png");
	self:addChild(sp);
	-- sp:setAnchorPoint(ccp(0.5,0.5))	
	sp:setRotation(-30);
end

BulletsLayer = class("BulletsLayer",
    function()
        return CCLayer:create() 
    end
)

BulletsLayer.__index = BulletsLayer
BulletsLayer.clippingNodeLeft = nil;
BulletsLayer.clippingNodeRight = nil;

function BulletsLayer:create() 
    local BulletsLayer = BulletsLayer.new()
    BulletsLayer:Init();

    return BulletsLayer
end

function BulletsLayer:Init()
	self:createClippingNode();

	self:shoot(2,8)
end

function BulletsLayer:shoot(shooter,target,shooterPos)
	if(shooterPos==nil)then
		shooterPos = unitPos[shooter]
	end

	local b = Bullet:create();
	self.clippingNodeLeft:addChild(b);
	self.clippingNodeLeft:retain()
	b:setPosition(shooterPos);
	b:setTag(target)

	local function BulletTargetCallback(sender)
		self:getParent():onHit(shooter,target);
		sender:removeFromParentAndCleanup(true);
	end

	local function BulletShootCallback(sender)
		local target = sender:getTag()
		sender:removeFromParentAndCleanup(true);

		local b = Bullet:create();
		self.clippingNodeRight:addChild(b);
		b:setPosition(ccp(0,unitPos[target].y-unitPos[target].x*0.7));

		local move = CCMoveTo:create(bulletRunTime, unitPos[target])
		local arr = CCArray:create()
	    arr:addObject(move)
	    arr:addObject(CCCallFuncN:create(BulletTargetCallback))
	    b:runAction(CCSequence:create(arr))
	end

    local arr = CCArray:create()
    local pMove = CCMoveBy:create(bulletRunTime, ccp(s.width-b:getPositionX(),(s.width-b:getPositionX())*0.7))
    arr:addObject(pMove)
    arr:addObject(CCDelayTime:create(bulletWaitTime))
    arr:addObject(CCCallFuncN:create(BulletShootCallback))
    b:runAction(CCSequence:create(arr))
end

function BulletsLayer:createClippingNode()
    self.clippingNodeLeft = CCClippingNode:create();
	local stencil = CCDrawNode:create()
	local points = CCPointArray:create(3)
	points:addControlPoint(ccp(s.width,s.height))
	points:addControlPoint(ccp(0,s.height))
	points:addControlPoint(ccp(0,s.height*(2/3)))
	points:addControlPoint(ccp(s.width,s.height*(1/3)))
	stencil:drawPolygon(points,4,ccColor4F:new(),0,ccColor4F:new());
	self.clippingNodeLeft:setStencil(stencil);
	self.clippingNodeLeft:setInverted(true)
	self:addChild(self.clippingNodeLeft);

    self.clippingNodeRight = CCClippingNode:create();
	local stencil = CCDrawNode:create()
	local points = CCPointArray:create(3)
	points:addControlPoint(ccp(0,0))
	points:addControlPoint(ccp(s.width,0))
	points:addControlPoint(ccp(s.width,s.height*(1/3)))
	points:addControlPoint(ccp(0,s.height*(2/3)))
	stencil:drawPolygon(points,4,ccColor4F:new(),0,ccColor4F:new());
	self.clippingNodeRight:setStencil(stencil);
	self.clippingNodeRight:setInverted(true)
	self:addChild(self.clippingNodeRight);
end