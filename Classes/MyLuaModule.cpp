/*
** Lua binding: MyLuaModule
** Generated automatically by tolua++-1.0.92 on Mon Jun 13 12:24:25 2016.
*/

#ifndef __cplusplus
#include "stdlib.h"
#endif
#include "string.h"

#include "tolua++.h"

/* Exported function */
TOLUA_API int  tolua_MyLuaModule_open (lua_State* tolua_S);

#include "MyLuaModule.h"

/* function to release collected object via destructor */
#ifdef __cplusplus

static int tolua_collect_MyClass (lua_State* tolua_S)
{
 MyClass* self = (MyClass*) tolua_tousertype(tolua_S,1,0);
	Mtolua_delete(self);
	return 0;
}
#endif


/* function to register type */
static void tolua_reg_types (lua_State* tolua_S)
{
 tolua_usertype(tolua_S,"MyClass");
}

/* method: new of class  MyClass */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_MyClass_new00
static int tolua_MyLuaModule_MyClass_new00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"MyClass",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  {
   MyClass* tolua_ret = (MyClass*)  Mtolua_new((MyClass)());
    tolua_pushusertype(tolua_S,(void*)tolua_ret,"MyClass");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'new'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: new_local of class  MyClass */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_MyClass_new00_local
static int tolua_MyLuaModule_MyClass_new00_local(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"MyClass",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  {
   MyClass* tolua_ret = (MyClass*)  Mtolua_new((MyClass)());
    tolua_pushusertype(tolua_S,(void*)tolua_ret,"MyClass");
    tolua_register_gc(tolua_S,lua_gettop(tolua_S));
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'new'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: foo of class  MyClass */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_MyClass_foo00
static int tolua_MyLuaModule_MyClass_foo00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"MyClass",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  MyClass* self = (MyClass*)  tolua_tousertype(tolua_S,1,0);
  int i = ((int)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'foo'", NULL);
#endif
  {
   int tolua_ret = (int)  self->foo(i);
   tolua_pushnumber(tolua_S,(lua_Number)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'foo'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* Open function */
TOLUA_API int tolua_MyLuaModule_open (lua_State* tolua_S)
{
 tolua_open(tolua_S);
 tolua_reg_types(tolua_S);
 tolua_module(tolua_S,NULL,0);
 tolua_beginmodule(tolua_S,NULL);
  #ifdef __cplusplus
  tolua_cclass(tolua_S,"MyClass","MyClass","",tolua_collect_MyClass);
  #else
  tolua_cclass(tolua_S,"MyClass","MyClass","",NULL);
  #endif
  tolua_beginmodule(tolua_S,"MyClass");
   tolua_function(tolua_S,"new",tolua_MyLuaModule_MyClass_new00);
   tolua_function(tolua_S,"new_local",tolua_MyLuaModule_MyClass_new00_local);
   tolua_function(tolua_S,".call",tolua_MyLuaModule_MyClass_new00_local);
   tolua_function(tolua_S,"foo",tolua_MyLuaModule_MyClass_foo00);
  tolua_endmodule(tolua_S);
 tolua_endmodule(tolua_S);
 return 1;
}


#if defined(LUA_VERSION_NUM) && LUA_VERSION_NUM >= 501
 TOLUA_API int luaopen_MyLuaModule (lua_State* tolua_S) {
 return tolua_MyLuaModule_open(tolua_S);
};
#endif

