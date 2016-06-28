/*
** Lua binding: MyLuaModule
** Generated automatically by tolua++-1.0.92 on Mon Jun 27 19:26:14 2016.
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

static int tolua_collect_ccBlendFunc (lua_State* tolua_S)
{
 ccBlendFunc* self = (ccBlendFunc*) tolua_tousertype(tolua_S,1,0);
	Mtolua_delete(self);
	return 0;
}

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
 tolua_usertype(tolua_S,"CCPoint");
 tolua_usertype(tolua_S,"CCLayer");
 tolua_usertype(tolua_S,"CCClippingNode");
 tolua_usertype(tolua_S,"CCScene");
 tolua_usertype(tolua_S,"MyClass");
 tolua_usertype(tolua_S,"ccColor4F");
 tolua_usertype(tolua_S,"HelloWorld");
 tolua_usertype(tolua_S,"CCDrawNode");
 tolua_usertype(tolua_S,"CCNode");
 tolua_usertype(tolua_S,"ccBlendFunc");
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

/* method: init of class  HelloWorld */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_HelloWorld_init00
static int tolua_MyLuaModule_HelloWorld_init00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"HelloWorld",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  HelloWorld* self = (HelloWorld*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'init'", NULL);
#endif
  {
   bool tolua_ret = (bool)  self->init();
   tolua_pushboolean(tolua_S,(bool)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'init'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: scene of class  HelloWorld */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_HelloWorld_scene00
static int tolua_MyLuaModule_HelloWorld_scene00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"HelloWorld",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  {
   CCScene* tolua_ret = (CCScene*)  HelloWorld::scene();
    tolua_pushusertype(tolua_S,(void*)tolua_ret,"CCScene");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'scene'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: create of class  HelloWorld */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_HelloWorld_create00
static int tolua_MyLuaModule_HelloWorld_create00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"HelloWorld",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  {
   HelloWorld* tolua_ret = (HelloWorld*)  HelloWorld::create();
    tolua_pushusertype(tolua_S,(void*)tolua_ret,"HelloWorld");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'create'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: create of class  CCClippingNode */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_CCClippingNode_create00
static int tolua_MyLuaModule_CCClippingNode_create00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"CCClippingNode",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  {
   CCClippingNode* tolua_ret = (CCClippingNode*)  CCClippingNode::create();
    tolua_pushusertype(tolua_S,(void*)tolua_ret,"CCClippingNode");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'create'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: setStencil of class  CCClippingNode */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_CCClippingNode_setStencil00
static int tolua_MyLuaModule_CCClippingNode_setStencil00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCClippingNode",0,&tolua_err) ||
     !tolua_isusertype(tolua_S,2,"CCNode",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCClippingNode* self = (CCClippingNode*)  tolua_tousertype(tolua_S,1,0);
  CCNode* pStencil = ((CCNode*)  tolua_tousertype(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'setStencil'", NULL);
#endif
  {
   self->setStencil(pStencil);
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'setStencil'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: isInverted of class  CCClippingNode */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_CCClippingNode_isInverted00
static int tolua_MyLuaModule_CCClippingNode_isInverted00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"const CCClippingNode",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  const CCClippingNode* self = (const CCClippingNode*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'isInverted'", NULL);
#endif
  {
   bool tolua_ret = (bool)  self->isInverted();
   tolua_pushboolean(tolua_S,(bool)tolua_ret);
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'isInverted'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: setInverted of class  CCClippingNode */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_CCClippingNode_setInverted00
static int tolua_MyLuaModule_CCClippingNode_setInverted00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCClippingNode",0,&tolua_err) ||
     !tolua_isboolean(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCClippingNode* self = (CCClippingNode*)  tolua_tousertype(tolua_S,1,0);
  bool bInverted = ((bool)  tolua_toboolean(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'setInverted'", NULL);
#endif
  {
   self->setInverted(bInverted);
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'setInverted'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: create of class  CCDrawNode */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_CCDrawNode_create00
static int tolua_MyLuaModule_CCDrawNode_create00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"CCDrawNode",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  {
   CCDrawNode* tolua_ret = (CCDrawNode*)  CCDrawNode::create();
    tolua_pushusertype(tolua_S,(void*)tolua_ret,"CCDrawNode");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'create'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: drawDot of class  CCDrawNode */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_CCDrawNode_drawDot00
static int tolua_MyLuaModule_CCDrawNode_drawDot00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCDrawNode",0,&tolua_err) ||
     (tolua_isvaluenil(tolua_S,2,&tolua_err) || !tolua_isusertype(tolua_S,2,"const CCPoint",0,&tolua_err)) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     (tolua_isvaluenil(tolua_S,4,&tolua_err) || !tolua_isusertype(tolua_S,4,"const ccColor4F",0,&tolua_err)) ||
     !tolua_isnoobj(tolua_S,5,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCDrawNode* self = (CCDrawNode*)  tolua_tousertype(tolua_S,1,0);
  const CCPoint* pos = ((const CCPoint*)  tolua_tousertype(tolua_S,2,0));
  float radius = ((float)  tolua_tonumber(tolua_S,3,0));
  const ccColor4F* color = ((const ccColor4F*)  tolua_tousertype(tolua_S,4,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'drawDot'", NULL);
#endif
  {
   self->drawDot(*pos,radius,*color);
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'drawDot'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: drawSegment of class  CCDrawNode */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_CCDrawNode_drawSegment00
static int tolua_MyLuaModule_CCDrawNode_drawSegment00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCDrawNode",0,&tolua_err) ||
     (tolua_isvaluenil(tolua_S,2,&tolua_err) || !tolua_isusertype(tolua_S,2,"const CCPoint",0,&tolua_err)) ||
     (tolua_isvaluenil(tolua_S,3,&tolua_err) || !tolua_isusertype(tolua_S,3,"const CCPoint",0,&tolua_err)) ||
     !tolua_isnumber(tolua_S,4,0,&tolua_err) ||
     (tolua_isvaluenil(tolua_S,5,&tolua_err) || !tolua_isusertype(tolua_S,5,"const ccColor4F",0,&tolua_err)) ||
     !tolua_isnoobj(tolua_S,6,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCDrawNode* self = (CCDrawNode*)  tolua_tousertype(tolua_S,1,0);
  const CCPoint* from = ((const CCPoint*)  tolua_tousertype(tolua_S,2,0));
  const CCPoint* to = ((const CCPoint*)  tolua_tousertype(tolua_S,3,0));
  float radius = ((float)  tolua_tonumber(tolua_S,4,0));
  const ccColor4F* color = ((const ccColor4F*)  tolua_tousertype(tolua_S,5,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'drawSegment'", NULL);
#endif
  {
   self->drawSegment(*from,*to,radius,*color);
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'drawSegment'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: drawPolygon of class  CCDrawNode */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_CCDrawNode_drawPolygon00
static int tolua_MyLuaModule_CCDrawNode_drawPolygon00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCDrawNode",0,&tolua_err) ||
     !tolua_isusertype(tolua_S,2,"CCPointArray",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,3,0,&tolua_err) ||
     (tolua_isvaluenil(tolua_S,4,&tolua_err) || !tolua_isusertype(tolua_S,4,"const ccColor4F",0,&tolua_err)) ||
     !tolua_isnumber(tolua_S,5,0,&tolua_err) ||
     (tolua_isvaluenil(tolua_S,6,&tolua_err) || !tolua_isusertype(tolua_S,6,"const ccColor4F",0,&tolua_err)) ||
     !tolua_isnoobj(tolua_S,7,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCDrawNode* self = (CCDrawNode*)  tolua_tousertype(tolua_S,1,0);
  CCPointArray* verts = ((CCPointArray*)  tolua_tousertype(tolua_S,2,0));
  unsigned int count = ((unsigned int)  tolua_tonumber(tolua_S,3,0));
  const ccColor4F* fillColor = ((const ccColor4F*)  tolua_tousertype(tolua_S,4,0));
  float borderWidth = ((float)  tolua_tonumber(tolua_S,5,0));
  const ccColor4F* borderColor = ((const ccColor4F*)  tolua_tousertype(tolua_S,6,0));
     
     static CCPoint triangle[4];
     triangle[0] = verts->getControlPointAtIndex(0);
     triangle[1] = verts->getControlPointAtIndex(1);
     triangle[2] = verts->getControlPointAtIndex(2);
     triangle[3] = verts->getControlPointAtIndex(3);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'drawPolygon'", NULL);
#endif
  {
   self->drawPolygon(triangle,count,*fillColor,borderWidth,*borderColor);
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'drawPolygon'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: clear of class  CCDrawNode */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_CCDrawNode_clear00
static int tolua_MyLuaModule_CCDrawNode_clear00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCDrawNode",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCDrawNode* self = (CCDrawNode*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'clear'", NULL);
#endif
  {
   self->clear();
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'clear'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: getBlendFunc of class  CCDrawNode */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_CCDrawNode_getBlendFunc00
static int tolua_MyLuaModule_CCDrawNode_getBlendFunc00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"const CCDrawNode",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  const CCDrawNode* self = (const CCDrawNode*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'getBlendFunc'", NULL);
#endif
  {
   ccBlendFunc tolua_ret = (ccBlendFunc)  self->getBlendFunc();
   {
#ifdef __cplusplus
    void* tolua_obj = Mtolua_new((ccBlendFunc)(tolua_ret));
     tolua_pushusertype(tolua_S,tolua_obj,"ccBlendFunc");
    tolua_register_gc(tolua_S,lua_gettop(tolua_S));
#else
    void* tolua_obj = tolua_copy(tolua_S,(void*)&tolua_ret,sizeof(ccBlendFunc));
     tolua_pushusertype(tolua_S,tolua_obj,"ccBlendFunc");
    tolua_register_gc(tolua_S,lua_gettop(tolua_S));
#endif
   }
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'getBlendFunc'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: setBlendFunc of class  CCDrawNode */
#ifndef TOLUA_DISABLE_tolua_MyLuaModule_CCDrawNode_setBlendFunc00
static int tolua_MyLuaModule_CCDrawNode_setBlendFunc00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCDrawNode",0,&tolua_err) ||
     (tolua_isvaluenil(tolua_S,2,&tolua_err) || !tolua_isusertype(tolua_S,2,"const ccBlendFunc",0,&tolua_err)) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCDrawNode* self = (CCDrawNode*)  tolua_tousertype(tolua_S,1,0);
  const ccBlendFunc* blendFunc = ((const ccBlendFunc*)  tolua_tousertype(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'setBlendFunc'", NULL);
#endif
  {
   self->setBlendFunc(*blendFunc);
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'setBlendFunc'.",&tolua_err);
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
  tolua_cclass(tolua_S,"HelloWorld","HelloWorld","CCLayer",NULL);
  tolua_beginmodule(tolua_S,"HelloWorld");
   tolua_function(tolua_S,"init",tolua_MyLuaModule_HelloWorld_init00);
   tolua_function(tolua_S,"scene",tolua_MyLuaModule_HelloWorld_scene00);
   tolua_function(tolua_S,"create",tolua_MyLuaModule_HelloWorld_create00);
  tolua_endmodule(tolua_S);
  tolua_cclass(tolua_S,"CCClippingNode","CCClippingNode","CCNode",NULL);
  tolua_beginmodule(tolua_S,"CCClippingNode");
   tolua_function(tolua_S,"create",tolua_MyLuaModule_CCClippingNode_create00);
   tolua_function(tolua_S,"setStencil",tolua_MyLuaModule_CCClippingNode_setStencil00);
   tolua_function(tolua_S,"isInverted",tolua_MyLuaModule_CCClippingNode_isInverted00);
   tolua_function(tolua_S,"setInverted",tolua_MyLuaModule_CCClippingNode_setInverted00);
  tolua_endmodule(tolua_S);
  tolua_cclass(tolua_S,"CCDrawNode","CCDrawNode","CCNode",NULL);
  tolua_beginmodule(tolua_S,"CCDrawNode");
   tolua_function(tolua_S,"create",tolua_MyLuaModule_CCDrawNode_create00);
   tolua_function(tolua_S,"drawDot",tolua_MyLuaModule_CCDrawNode_drawDot00);
   tolua_function(tolua_S,"drawSegment",tolua_MyLuaModule_CCDrawNode_drawSegment00);
   tolua_function(tolua_S,"drawPolygon",tolua_MyLuaModule_CCDrawNode_drawPolygon00);
   tolua_function(tolua_S,"clear",tolua_MyLuaModule_CCDrawNode_clear00);
   tolua_function(tolua_S,"getBlendFunc",tolua_MyLuaModule_CCDrawNode_getBlendFunc00);
   tolua_function(tolua_S,"setBlendFunc",tolua_MyLuaModule_CCDrawNode_setBlendFunc00);
  tolua_endmodule(tolua_S);
 tolua_endmodule(tolua_S);
 return 1;
}


#if defined(LUA_VERSION_NUM) && LUA_VERSION_NUM >= 501
 TOLUA_API int luaopen_MyLuaModule (lua_State* tolua_S) {
 return tolua_MyLuaModule_open(tolua_S);
};
#endif

