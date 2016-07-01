require "CCBReaderLoad"
local s = CCDirector:sharedDirector():getWinSize()

local cjson = require "cjson"
local jsonData = "{\"report\":{\"p\":[[1,6,0],[\"fgggg\",10,1]],\"t\":[[[\"a10001\",7],[\"a10011\",6],[\"a10011\",8],[\"a10001\",6],[\"a10001\",7],[\"a10001\",7]],[[\"a10032\",5],{},{},{},{},{}]],\"h\":[{},{}],\"r\":-1,\"d\":[[\"240-6\",\"192-4\",\"192-6\",\"240-5\",\"240-6\",\"240-6\"],[\"193-5\"],[\"189-4\"],[\"283-4\"],[\"161-3\"],[\"193-3\"],[\"193-2\"],[\"96-5\",\"77-3\",\"77-5\",\"96-4\",\"96-5\",\"96-5\"],[\"161-2\"],[\"142-1\"],[\"236-1\"],[\"129-0\"]]},\"aey\":[[0,[0,0,0,0]],{}],\"rp\":[0,0],\"resource\":{},\"type\":1,\"info\":{\"defenserName\":\"\",\"AttackerPlace\":[247,211],\"attackerLevel\":10,\"aLandform\":4,\"islandLevel\":6,\"islandType\":1,\"AAName\":\"\",\"defenser\":0,\"attackerName\":\"fgggg\",\"attacker\":9000010,\"reputation\":0,\"DAName\":\"\",\"isVictory\":0,\"dLandform\":1,\"ts\":1417975617,\"place\":[251,213],\"islandOwner\":0,\"defenserLevel\":0},\"destroy\":{\"defenser\":{\"a10001\":8,\"a10011\":6},\"attacker\":{\"a10032\":5}},\"hh\":[[{},0],[{},0]]}"
local data = cjson.decode(jsonData)

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
Unit.index = 0;
Unit.id = "";
Unit.num = 0;

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

function Unit:update(fT)

end

function Unit:onHit()
	self.animationMgr:runAnimationsForSequenceNamed("hit")
end

function Unit:onDead()
	self:getParent():onDead(self:getTag());
	self:removeFromParentAndCleanup(true);
end

function Unit:shootAll()
	local curTarget = 0;
	
	if(self:getTag()<7)then
		curTarget = 7
	else
		curTarget = 1
	end

	function shootAllCallback()
		self:shoot(curTarget)
		curTarget = curTarget + 1;
	end

	local arr = CCArray:create()
    for i=1,6 do
    	arr:addObject(CCCallFunc:create(shootAllCallback))
	    arr:addObject(CCDelayTime:create(0.2))
    end
    self:runAction(CCSequence:create(arr))
end

function Unit:shoot(target)
	if(target==nil)then
		if(self:getTag()<7)then
			target = self:getTag() + 6;
		else
			target = self:getTag() - 6;
		end
	end

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
UnitsLayer.ShooterQueue = {}

function UnitsLayer:create() 
    local UnitsLayer = UnitsLayer.new()
    UnitsLayer:Init();

    return UnitsLayer
end

function UnitsLayer:Init()
	for i=1,6 do
		if(data.report.t[1][i][1]~=nil)then
			self.unit[i] = Unit:create(UnitType.UnitTypeTroopMine)
			self.unit[i]:setPosition(unitPos[i])
		    self:addChild(self.unit[i])
		    self.unit[i]:setTag(i);
		end
	end

	for i=7,12 do
		if(data.report.t[2][i-6][1]~=nil)then
			self.unit[i] = Unit:create(UnitType.UnitTypeTroopEnemy)
			self.unit[i]:setPosition(unitPos[i])
		    self:addChild(self.unit[i])
		    self.unit[i]:setTag(i);
		end
	end	

	self:setActionQueue();
end

function UnitsLayer:setActionQueue()
	self:initShooterQueue();

	local curShooter = 0;
	function getCurShooter()
		curShooter = curShooter + 1;
		if(curShooter > #self.ShooterQueue)then
			curShooter = 1;
		end
		return self.ShooterQueue[curShooter];
	end

	function setQueueCallbackShootAll()
		self.unit[getCurShooter()]:shootAll();
	end

	function setQueueCallbackShoot()
		self.unit[getCurShooter()]:shoot();
	end

	local arr = CCArray:create()
    for i=1,#data.report.d do
		if(#data.report.d[i]==6)then
			arr:addObject(CCCallFunc:create(setQueueCallbackShootAll))
		    arr:addObject(CCDelayTime:create(4))
		else
			arr:addObject(CCCallFunc:create(setQueueCallbackShoot))
		    arr:addObject(CCDelayTime:create(2))
		end
	end
    self:runAction(CCSequence:create(arr))
end

function UnitsLayer:initShooterQueue()
	local first,second,value1,velue2 = 0,0,0,0
	if(data.report.p[1][3]==1)then
		first,second,value1,value2 = 1,2,0,6
	else
		first,second,value1,value2 = 2,1,6,0
	end

	for i=1,6 do
		if(data.report.t[first][i][1]~=nil)then
			table.insert(self.ShooterQueue,i+value1)
		end

		if(data.report.t[second][i][1]~=nil)then
			table.insert(self.ShooterQueue,i+value2)
		end
	end
end

function UnitsLayer:update(fT)
	for i=1,#self.unit do
		self.unit[i]:update(fT);
	end
end

function UnitsLayer:onNodeEvent(event)
    if event == "enter" then
    elseif event == "exit" then
    end
end

function UnitsLayer:onHit(shooter,target)
	if(self.unit[target]~=nil)then
		self.unit[target]:onHit()
	end
end

function UnitsLayer:onShoot(shooter,target)
	self:getParent():onShoot(shooter,target);
end

function UnitsLayer:onDead(target)
	self:getParent():onDead(target);
end

function UnitsLayer:testDead()
	-- test dead in Init
	function testCallback()
		self.unit[2]:onDead();
		self.unit[7]:onDead();
	end
	local arr = CCArray:create()
    arr:addObject(CCDelayTime:create(1))
    arr:addObject(CCCallFuncN:create(testCallback))
    self:runAction(CCSequence:create(arr))
end

function UnitsLayer:testShoot()
	-- test shoot in update
	local shooter = math.random(1,12);
	if(shooter<7)then
		target = shooter + 6;
	else
		target = shooter - 6;
	end
	-- print(self.numShoot.." "..shooter.." "..target)
	self.numShoot = self.numShoot + 1;
	self.unit[shooter]:shoot(target)
	-- print(collectgarbage("count"))
end