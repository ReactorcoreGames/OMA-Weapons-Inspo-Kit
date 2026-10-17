class KeyBindEdit extends GUIEditBox
	editinlinenew
	instanced;

var byte keyCode;
var string KeyStr;
var bool bCapturing;
//var delegate<OnInitKey> __OnInitKey__Delegate;
//var delegate<OnKeyChanged> __OnKeyChanged__Delegate;

delegate OnInitKey(out byte Key)
{
	Key = 0;
	//return;	
}

delegate OnKeyChanged(byte Key)
{
	//return;	
}

function InitComponent(GUIController InController, GUIComponent InOwner)
{
	OnInitKey(keyCode);
	KeyStr = Class'Engine.Interactions'.static.GetFriendlyName(keyCode);
	// End:0x63
	if((InStr(KeyStr, "Unknown") != -1) || KeyStr == "Escape")
	{
		KeyStr = "None";
	}
	Caption = KeyStr;
	bReadOnly = true;
	super.InitComponent(InController, InOwner);
	//return;	
}

function MenuStateChange(GUI.eMenuState NewState)
{
	super(GUIComponent).MenuStateChange(NewState);
	// End:0x2E
	if(int(NewState) == int(0))
	{
		bCapturing = false;
		Caption = KeyStr;
	}
	//return;	
}

function bool MouseClick(GUIComponent Sender)
{
	bCapturing = true;
	Caption = "";
	return true;
	//return;	
}

function bool InternalOnKeyType(out byte Key, optional string Unicode)
{
	return false;
	//return;	
}

function bool InternalOnKeyEvent(out byte Key, out byte State, float Delta)
{
	local string KeyName;

	// End:0x1C
	if((int(State) != 1) || !bCapturing)
	{
		return false;
	}
	KeyName = Class'Engine.Interactions'.static.GetFriendlyName(Key);
	// End:0x7B
	if((InStr(KeyName, "Unknown") != -1) || KeyName == "Escape")
	{
		keyCode = 0;
		KeyStr = "None";		
	}
	else
	{
		keyCode = Key;
		KeyStr = KeyName;
	}
	Caption = KeyStr;
	OnKeyChanged(keyCode);
	bCapturing = false;
	return true;
	//return;	
}

defaultproperties
{
	bCaptureMouse=true
	OnClick=KeyBindEdit.MouseClick
}
