class BaseGUIController extends Interaction
	transient
	native
	config;

var Material DefaultPens[3];
var config string NetworkMsgMenu;
var config string QuestionMenuClass;
//var delegate<OnAdminReply> __OnAdminReply__Delegate;

delegate OnAdminReply(string Reply)
{
	//return;	
}

event bool OpenMenu(string NewMenuName, optional string Param1, optional string Param2)
{
	return false;
	//return;	
}

event AutoLoadMenus()
{
	//return;	
}

event bool ReplaceMenu(string NewMenuName, optional string Param1, optional string Param2, optional bool bCancelled)
{
	return false;
	//return;	
}

event bool CloseMenu(optional bool bCanceled)
{
	return true;
	//return;	
}

event CloseAll(bool bCancel, optional bool bForced)
{
	//return;	
}

function SetControllerStatus(bool On)
{
	bActive = On;
	bVisible = On;
	bRequiresTick = On;
	//return;	
}

event InitializeController()
{
	//return;	
}

event bool NeedsMenuResolution()
{
	//return;	
}

event SetRequiredGameResolution(string GameRes)
{
	//return;	
}

defaultproperties
{
	DefaultPens[0]=Texture'Engine.MenuWhite'
	DefaultPens[1]=Texture'Engine.MenuBlack'
	DefaultPens[2]=Texture'Engine.MenuGray'
	bActive=false
	bNativeEvents=true
}
