require "CCBReaderLoad"
local s = CCDirector:sharedDirector():getWinSize()

-- CarMineCCB = CarMineCCB or {}
-- ccb["car1"] = CarMineCCB

-- CarEnemyCCB = CarEnemyCCB or {}
-- ccb["car2"] = CarEnemyCCB

-- TroopMineCCB = TroopMineCCB or {}
-- ccb["car2"] = TroopMineCCB

-- TroopEnemyCCB = TroopEnemyCCB or {}
-- ccb["car2"] = TroopEnemyCCB

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

function Unit:create(unitType) 
    local Unit = Unit.new()
    Unit:Init(unitType);

    return Unit
end

function Unit:Init(unitType)
	local strFile = "";
	local strName = "";
	if unitType==UnitType.UnitTypeCarMine then
		strFile = "ccb/car1.ccbi";
		strName = "car1"
	elseif unitType==UnitType.UnitTypeCarEnemy then
		strFile = "ccb/car2.ccbi";
		strName = "car2"
	end

	local  proxy = CCBProxy:create()
	local  node  = CCBReaderLoad(strFile,proxy,true,strName)
    local  layer = tolua.cast(node,"CCLayer")
    self:addChild(layer)
end

UnitsLayer = class("UnitsLayer",
    function()
        return CCLayer:create() 
    end
)

function UnitsLayer:create() 
    local UnitsLayer = UnitsLayer.new()
    UnitsLayer:Init();

    return UnitsLayer
end

function UnitsLayer:Init()
	for i=1,6 do
		local unit = Unit:create(UnitType.UnitTypeCarMine)
		unit:setPosition(unitPos[i])
	    self:addChild(unit)
	end

	for i=7,12 do
		local unit = Unit:create(UnitType.UnitTypeCarEnemy)
		unit:setPosition(unitPos[i])
	    self:addChild(unit)
	end
end