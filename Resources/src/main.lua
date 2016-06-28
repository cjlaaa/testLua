require "src/extern"
require "src/background"
require "src/Units"

MainLayer = class("MainLayer",
    function()
        return CCLayer:create() 
    end
)
 
MainLayer.__index = MainLayer
MainLayer.bg = nil;
MainLayer.unitsLayer = nil;
  
function MainLayer:createMainLayer()
    local MainLayer = MainLayer.new()

    MainLayer:myInit()
    return MainLayer
end
 
function MainLayer:myInit()
    bg = Background:create();
	self:addChild(bg)

	unitsLayer = UnitsLayer:create();
	self:addChild(unitsLayer)
end

-- RunScene
local MainScene = CCScene:create()
local mainLayer = MainLayer:createMainLayer()
MainScene:addChild(mainLayer)
CCDirector:sharedDirector():runWithScene(MainScene)
