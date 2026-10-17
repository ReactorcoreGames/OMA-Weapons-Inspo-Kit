class BC_GUICheckListMulti extends GUIList
	editinlinenew
	instanced;

struct CheckStruct
{
	var byte Checks[3];
};

var() Material CheckMat;
var() Material CheckBackMat;
var byte MaxChecks;
var array<Color> CheckColors;
var array<CheckStruct> CheckStore;
var int LastCheckChanged;
var int LastColumnChanged;
var bool LastClickWasCheck;

function InternalOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
	local int NewIndex;
	local byte j;

	Canvas.Style = 5;
	// End:0xAE
	if((IsInClientBounds()) && ItemsPerPage > 0)
	{
		NewIndex = CalculateIndex();
		// End:0xAE
		if(NewIndex == i)
		{
			Canvas.SetPos(X, Y);
			Canvas.SetDrawColor(0, 0, 128, byte(255));
			Canvas.DrawTile(Controller.DefaultPens[0], W, H, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
		}
	}
	// End:0x12E
	if(Elements[i].bSection)
	{
		Canvas.SetPos(X, Y);
		Canvas.SetDrawColor(0, 0, 0, byte(255));
		Canvas.DrawTile(Controller.DefaultPens[0], W, H, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
	}
	j = 0;
	J0x136:

	// End:0x1CA [Loop If]
	if(int(j) < int(MaxChecks))
	{
		Canvas.SetPos(X + (H * float(j)), Y);
		Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
		Canvas.DrawTile(CheckBackMat, H, H, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
		j++;
		// [Loop Continue]
		goto J0x136;
	}
	j = 0;
	J0x1D2:

	// End:0x283 [Loop If]
	if(int(j) < int(MaxChecks))
	{
		// End:0x279
		if(int(CheckStore[i].Checks[int(j)]) > 0)
		{
			Canvas.SetPos(X + (H * float(j)), Y);
			Canvas.DrawColor = CheckColors[int(j)];
			Canvas.DrawTile(CheckMat, H, H, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
		}
		j++;
		// [Loop Continue]
		goto J0x1D2;
	}
	Canvas.DrawColor = Canvas.default.DrawColor;
	// End:0x310
	if(Elements[i].bSection)
	{
		SectionStyle.DrawText(Canvas, MenuState, X + (H * float(MaxChecks)), Y, W - H, H, TextAlign, GetItemAtIndex(i), FontScale);		
	}
	else
	{
		Style.DrawText(Canvas, MenuState, X + (H * float(MaxChecks)), Y, W - H, H, TextAlign, GetItemAtIndex(i), FontScale);
	}
	//return;	
}

function SetChecked(int Index, int CheckNum, bool bChecked)
{
	CheckStore[Index].Checks[CheckNum] = byte(bChecked);
	//return;	
}

function ToggleChecked(int Index, int CheckNum)
{
	CheckStore[Index].Checks[CheckNum] = byte(!bool(CheckStore[Index].Checks[CheckNum]));
	LastCheckChanged = Index;
	LastColumnChanged = CheckNum;
	//return;	
}

function int CursorOverCheck()
{
	local byte i;

	i = 0;
	J0x08:

	// End:0x5C [Loop If]
	if(int(i) < int(MaxChecks))
	{
		// End:0x52
		if(Controller.MouseX <= (ClientBounds[0] + (ItemHeight * float(int(i) + 1))))
		{
			return int(i);
		}
		i++;
		// [Loop Continue]
		goto J0x08;
	}
	return -1;
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	local int NewIndex, CheckNum;

	// End:0x1A
	if(!IsInClientBounds() || ItemsPerPage == 0)
	{
		return false;
	}
	NewIndex = CalculateIndex();
	CheckNum = CursorOverCheck();
	// End:0x5C
	if(CheckNum != -1)
	{
		LastClickWasCheck = true;
		ToggleChecked(NewIndex, CheckNum);		
	}
	else
	{
		LastClickWasCheck = false;
		SetIndex(NewIndex);
	}
	return true;
	//return;	
}

defaultproperties
{
	CheckMat=Texture'BCoreProV55.textures.CloseBoxBallDesat'
	CheckBackMat=Texture'2K4Menus.NewControls.GradientButtonBlurry'
	MaxChecks=3
	CheckColors=/* ERROR: System.ArgumentOutOfRangeException */
	TextAlign=0
	OnDrawItem=BC_GUICheckListMulti.InternalOnDrawItem
}
