class BC_GUICheckList extends GUIList
	editinlinenew
	instanced;

var() Material CheckMat;
var() Material CheckBackMat;
var() array<byte> Checks;
var int LastCheckChanged;
var bool LastClickWasCheck;

function InternalOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
	local int NewIndex;

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
	Canvas.SetPos(X, Y);
	Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	Canvas.DrawTile(CheckBackMat, H, H, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
	// End:0x20F
	if(int(Checks[i]) > 0)
	{
		Canvas.SetPos(X, Y);
		Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
		Canvas.DrawTile(CheckMat, H, H, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
	}
	// End:0x276
	if(Elements[i].bSection)
	{
		SectionStyle.DrawText(Canvas, MenuState, X + H, Y, W - H, H, TextAlign, GetItemAtIndex(i), FontScale);		
	}
	else
	{
		Style.DrawText(Canvas, MenuState, X + H, Y, W - H, H, TextAlign, GetItemAtIndex(i), FontScale);
	}
	//return;	
}

function AddCheck(string NewItem, optional Object obj, optional string str, optional bool bSection, optional bool bChecked)
{
	local int NewIndex;
	local GUIListElem E;

	// End:0x36
	if(((!bAllowEmptyItems && NewItem == "") && obj == none) && str == "")
	{
		return;
	}
	E.Item = NewItem;
	E.ExtraData = obj;
	E.ExtraStrData = str;
	E.bSection = bSection;
	// End:0xCE
	if(bSorted && Elements.Length > 0)
	{
		J0x8F:

		// End:0xCB [Loop If]
		if((NewIndex < Elements.Length) && (CompareItem(Elements[NewIndex], E)) < 0)
		{
			NewIndex++;
			// [Loop Continue]
			goto J0x8F;
		}		
	}
	else
	{
		NewIndex = Elements.Length;
	}
	Elements.Insert(NewIndex, 1);
	Elements[NewIndex] = E;
	Checks.Insert(NewIndex, 1);
	Checks[NewIndex] = byte(bChecked);
	ItemCount = Elements.Length;
	// End:0x144
	if((Elements.Length == 1) && bInitializeList)
	{
		SetIndex(0);		
	}
	else
	{
		// End:0x158
		if(bNotify)
		{
			CheckLinkedObjects(self);
		}
	}
	// End:0x176
	if(MyScrollBar != none)
	{
		MyScrollBar.AlignThumb();
	}
	//return;	
}

function SetChecked(int i, bool bChecked)
{
	Checks[i] = byte(bChecked);
	//return;	
}

function ToggleChecked(int i)
{
	Checks[i] = byte(!bool(Checks[i]));
	LastCheckChanged = i;
	//return;	
}

function bool IsChecked(int Index)
{
	// End:0x2B
	if((Index >= 0) && Index < Checks.Length)
	{
		return bool(Checks[Index]);
	}
	return false;
	//return;	
}

function int FindItem(string ItemName)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x41 [Loop If]
	if(i < Elements.Length)
	{
		// End:0x37
		if(Elements[i].Item == ItemName)
		{
			return i;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return -1;
	//return;	
}

function bool CursorOverCheck()
{
	// End:0x23
	if(Controller.MouseX <= (ClientBounds[0] + ItemHeight))
	{
		return true;
	}
	return false;
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	local int NewIndex;

	// End:0x1A
	if(!IsInClientBounds() || ItemsPerPage == 0)
	{
		return false;
	}
	NewIndex = CalculateIndex();
	// End:0x45
	if(CursorOverCheck())
	{
		LastClickWasCheck = true;
		ToggleChecked(NewIndex);		
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
	CheckMat=Texture'2K4Menus.NewControls.CloseBoxBallWatched'
	CheckBackMat=Texture'2K4Menus.NewControls.GradientButtonBlurry'
	TextAlign=0
	OnDrawItem=BC_GUICheckList.InternalOnDrawItem
}
