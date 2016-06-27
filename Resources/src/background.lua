require "CCBReaderLoad"

Background = Background or {}
ccb["Background"] = Background

local function OnBtnClicked()
	local animationMgr = tolua.cast(Background["mAnimationManager"],"CCBAnimationManager")
    animationMgr:runAnimationsForSequenceNamedTweenDuration("right", 0.1)
end
Background["onBtnClick"] = OnBtnClicked

function BackgroundLayer()
    local  proxy = CCBProxy:create()
    local  node  = CCBReaderLoad("ccb/background.ccbi",proxy,true,"Background")
    local  layer = tolua.cast(node,"CCLayer")
    
    return layer
end