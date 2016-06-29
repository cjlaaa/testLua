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

	local b = Bullet:create();
	self.clippingNodeLeft:addChild(b);
	b:setPosition(unitPos[1]);
	b:runAction(CCMoveBy:create(2, ccp(s.width-b:getPositionX(),(s.width-b:getPositionX())*0.6)));
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