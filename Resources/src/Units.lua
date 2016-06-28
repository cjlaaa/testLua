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
    self:play("fire")
end

function Unit:play(strStatus)
	if(self.Type==UnitType.UnitTypeCarMine)then
		local animationMgr = tolua.cast(CarMineCCB["mAnimationManager"],"CCBAnimationManager")
	    animationMgr:runAnimationsForSequenceNamed(strStatus)
	elseif(self.Type==UnitType.UnitTypeCarEnemy)then
		local animationMgr = tolua.cast(CarEnemyCCB["mAnimationManager"],"CCBAnimationManager")
	    animationMgr:runAnimationsForSequenceNamed(strStatus)
	elseif(self.Type==UnitType.UnitTypeTroopMine)then
		local animationMgr = tolua.cast(TroopMineCCB["mAnimationManager"],"CCBAnimationManager")
	    animationMgr:runAnimationsForSequenceNamed(strStatus)
    elseif(self.Type==UnitType.UnitTypeTroopEnemy)then
		local animationMgr = tolua.cast(TroopEnemyCCB["mAnimationManager"],"CCBAnimationManager")
	    animationMgr:runAnimationsForSequenceNamed(strStatus)
	end
end

UnitsLayer = class("UnitsLayer",
    function()
        return CCLayer:create() 
    end
)

UnitsLayer.__index = UnitsLayer
UnitsLayer.unit = {};

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
	end

	for i=7,12 do
		self.unit[i] = Unit:create(UnitType.UnitTypeTroopEnemy)
		self.unit[i]:setPosition(unitPos[i])
	    self:addChild(self.unit[i])
	end
end