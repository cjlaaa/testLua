collectgarbage("collect")
-- collectgarbage("stop")
collectgarbage("setpause", 100)
collectgarbage("setstepmul", 5000)

require "src/extern"
require "src/background"
require "src/Units"
require "src/Bullet"


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
            schedulerEntry = scheduler:scheduleScriptFunc(update, 0.01, false)
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
