require "CCBReaderLoad"
local s = CCDirector:sharedDirector():getWinSize()

CarMineCCB = CarMineCCB or {}
ccb["car1"] = CarMineCCB

CarEnemyCCB = CarEnemyCCB or {}
ccb["car2"] = CarEnemyCCB

TroopMineCCB = TroopMineCCB or {}
ccb["troop1"] = TroopMineCCB

TroopEnemyCCB = TroopEnemyCCB or {}
ccb["troop2"] = TroopEnemyCCB

local UnitType =
{
	UnitTypeCarMine = 0,
	UnitTypeCarEnemy = 1,
	UnitTypeTroopMine = 2,
	UnitTypeTroopEnemy = 3,
}

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

Unit = class("Unit",
    function()
        return CCLayer:create() 
    end
)

Unit.__index = Unit
Unit.Type = nil;
Unit.animationMgr = nil;

function Unit:create(unitType) 
    local Unit = Unit.new()
    Unit:Init(unitType);

    return Unit
end

function Unit:Init(unitType)
	self.Type = unitType

	local strFile = "";
	local strName = "";
	if unitType==UnitType.UnitTypeCarMine then
		strFile = "ccb/car1.ccbi";
		strName = "car1"
	elseif unitType==UnitType.UnitTypeCarEnemy then
		strFile = "ccb/car2.ccbi";
		strName = "car2"
	elseif unitType==UnitType.UnitTypeTroopMine then
		strFile = "ccb/troop1.ccbi";
		strName = "troop1"
	elseif unitType==UnitType.UnitTypeTroopEnemy then
		strFile = "ccb/troop2.ccbi";
		strName = "troop2"
	end

	local  proxy = CCBProxy:create()
	local  node  = CCBReaderLoad(strFile,proxy,true,strName)
    local  layer = tolua.cast(node,"CCLayer")
    self:addChild(layer)

    self.animationMgr = nil;
    if(self.Type==UnitType.UnitTypeCarMine)then
		self.animationMgr = tolua.cast(CarMineCCB["mAnimationManager"],"CCBAnimationManager")
	elseif(self.Type==UnitType.UnitTypeCarEnemy)then
		self.animationMgr = tolua.cast(CarEnemyCCB["mAnimationManager"],"CCBAnimationManager")
	elseif(self.Type==UnitType.UnitTypeTroopMine)then
		self.animationMgr = tolua.cast(TroopMineCCB["mAnimationManager"],"CCBAnimationManager")
    elseif(self.Type==UnitType.UnitTypeTroopEnemy)then
		self.animationMgr = tolua.cast(TroopEnemyCCB["mAnimationManager"],"CCBAnimationManager")
	end
end

function Unit:onHit()
	self.animationMgr:runAnimationsForSequenceNamed("hit")
end

function Unit:shoot(target)
	self.animationMgr:runAnimationsForSequenceNamed("fire")
	self:getParent():onShoot(self:getTag(),target);
end

UnitsLayer = class("UnitsLayer",
    function()
        return CCLayer:create() 
    end
)

UnitsLayer.__index = UnitsLayer
UnitsLayer.unit = {};
UnitsLayer.numShoot = 0;

function UnitsLayer:create() 
    local UnitsLayer = UnitsLayer.new()
    UnitsLayer:Init();

    return UnitsLayer
end

function UnitsLayer:Init()
	for i=1,6 do
		self.unit[i] = Unit:create(UnitType.UnitTypeTroopMine)
		self.unit[i]:setPosition(unitPos[i])
	    self:addChild(self.unit[i])
	    self.unit[i]:setTag(i);
	end

	for i=7,12 do
		self.unit[i] = Unit:create(UnitType.UnitTypeTroopEnemy)
		self.unit[i]:setPosition(unitPos[i])
	    self:addChild(self.unit[i])
	    self.unit[i]:setTag(i);
	end	
end

function UnitsLayer:update(fT)
	local shooter = math.random(1,12);
	if(shooter<7)then
		target = shooter + 6;
	else
		target = shooter - 6;
	end

	print(self.numShoot.." "..shooter.." "..target)
	self.numShoot = self.numShoot + 1;
	self.unit[shooter]:shoot(target)
	print(collectgarbage("count"))
end

function UnitsLayer:onNodeEvent(event)
    if event == "enter" then
    elseif event == "exit" then
    end
end

function UnitsLayer:onHit(shooter,target)
	self.unit[target]:onHit()
end

function UnitsLayer:onShoot(shooter,target)
	self:getParent():onShoot(shooter,target);
end