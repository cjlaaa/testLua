extern "C" {
#include "tolua++.h"
}

#include "MyClass.h"

TOLUA_API int tolua_MyLuaModule_open(lua_State* tolua_S);