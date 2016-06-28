extern "C" {
#include "tolua++.h"
}

#include "MyClass.h"
#include "HelloWorldScene.h"
#include "CCClippingNode.h"
#include "CCDrawNode.h"

USING_NS_CC;

TOLUA_API int tolua_MyLuaModule_open(lua_State* tolua_S);
