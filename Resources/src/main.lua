collectgarbage("collect")
-- collectgarbage("stop")
collectgarbage("setpause", 100)
collectgarbage("setstepmul", 5000)

require "src/extern"
require "src/background"
require "src/Units"
require "src/Bullet" 

local cjson = require "cjson"
local jsonData = "{\"report\":{\"p\":[[1,6,0],[\"fgggg\",10,1]],\"t\":[[[\"a10001\",7],[\"a10011\",6],[\"a10011\",8],[\"a10001\",6],[\"a10001\",7],[\"a10001\",7]],[[\"a10032\",5],{},{},{},{},{}]],\"h\":[{},{}],\"r\":-1,\"d\":[[\"240-6\",\"192-4\",\"192-6\",\"240-5\",\"240-6\",\"240-6\"],[\"193-5\"],[\"189-4\"],[\"283-4\"],[\"161-3\"],[\"193-3\"],[\"193-2\"],[\"96-5\",\"77-3\",\"77-5\",\"96-4\",\"96-5\",\"96-5\"],[\"161-2\"],[\"142-1\"],[\"236-1\"],[\"129-0\"]]},\"aey\":[[0,[0,0,0,0]],{}],\"rp\":[0,0],\"resource\":{},\"type\":1,\"info\":{\"defenserName\":\"\",\"AttackerPlace\":[247,211],\"attackerLevel\":10,\"aLandform\":4,\"islandLevel\":6,\"islandType\":1,\"AAName\":\"\",\"defenser\":0,\"attackerName\":\"fgggg\",\"attacker\":9000010,\"reputation\":0,\"DAName\":\"\",\"isVictory\":0,\"dLandform\":1,\"ts\":1417975617,\"place\":[251,213],\"islandOwner\":0,\"defenserLevel\":0},\"destroy\":{\"defenser\":{\"a10001\":8,\"a10011\":6},\"attacker\":{\"a10032\":5}},\"hh\":[[{},0],[{},0]]}"
local data = cjson.decode(jsonData)
print(data.report.p[2][1]) 
for key, value in pairs(data) do  
    print(key.." "..value)  
end 

MainLayer = class("MainLayer",
    function()
        return CCLayer:create() 
    end
)
 
MainLayer.__index = MainLayer
MainLayer.bg = nil;
MainLayer.unitsLayer = nil;
MainLayer.bulletsLayer = nil;
  
function MainLayer:createMainLayer()
    local MainLayer = MainLayer.new()

    MainLayer:myInit()
    return MainLayer
end
 
function MainLayer:myInit()
    self.bg = Background:create();
	self:addChild(self.bg)

	self.unitsLayer = UnitsLayer:create();
	self:addChild(self.unitsLayer)

	self.bulletsLayer = BulletsLayer:create();
	self:addChild(self.bulletsLayer);

	local function update(fT)
		self.bg:update()
		self.unitsLayer:update()
		self.bulletsLayer:update()
	end

	local scheduler = CCDirector:sharedDirector():getScheduler()
    local schedulerEntry = nil
    local function onNodeEvent(event)
    	self.bg:onNodeEvent(event)
		self.unitsLayer:onNodeEvent(event)
		self.bulletsLayer:onNodeEvent(event)
        if event == "enter" then
            -- schedulerEntry = scheduler:scheduleScriptFunc(update, 0.01, false)
        elseif event == "exit" then
            scheduler:unscheduleScriptEntry(schedulerEntry)
        end
    end

    self:registerScriptHandler(onNodeEvent)
end

function MainLayer:onHit(shooter,target)
	self.unitsLayer:onHit(shooter,target)
	self.bg:onHit(target)
end

function MainLayer:onShoot(shooter,target)
	self.bulletsLayer:shoot(shooter,target);
end

-- RunScene
local MainScene = CCScene:create()
local mainLayer = MainLayer:createMainLayer()
MainScene:addChild(mainLayer)
CCDirector:sharedDirector():runWithScene(MainScene)
