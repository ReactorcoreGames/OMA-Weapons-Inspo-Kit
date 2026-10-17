class GUILoadOutItem extends GUIImage
	editinlinenew
	instanced;

struct LoadOutItem
{
	var() string Text;
	var() string Caption;
	var() Material Image;
	var() int X1;
	var() int Y1;
	var() int X2;
	var() int Y2;
};

var() int Index;
var() array<LoadOutItem> items;
var() Material NAImage;
var() string Caption;
//var delegate<OnItemChange> __OnItemChange__Delegate;

function AddItem(string ItemCaption, Material ItemImage, string ItemString, optional IntBox ItemCoords)
{
	items.Length = items.Length + 1;
	items[items.Length - 1].Caption = ItemCaption;
	items[items.Length - 1].Image = ItemImage;
	items[items.Length - 1].Text = ItemString;
	// End:0xFD
	if((((ItemCoords.X1 + ItemCoords.X2) + ItemCoords.Y1) + ItemCoords.Y2) == 0)
	{
		items[items.Length - 1].X1 = -1;
		items[items.Length - 1].X2 = -1;
		items[items.Length - 1].Y1 = -1;
		items[items.Length - 1].Y2 = -1;		
	}
	else
	{
		items[items.Length - 1].X1 = ItemCoords.X1;
		items[items.Length - 1].X2 = ItemCoords.X2;
		items[items.Length - 1].Y1 = ItemCoords.Y1;
		items[items.Length - 1].Y2 = ItemCoords.Y2;
	}
	//return;	
}

function SetItem(string ItemString)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x46 [Loop If]
	if(i < items.Length)
	{
		// End:0x3C
		if(items[i].Text == ItemString)
		{
			Index = i;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	UpdateImage();
	//return;	
}

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	super(GUIComponent).InitComponent(MyController, MyOwner);
	UpdateImage();
	//return;	
}

delegate OnItemChange(GUIComponent Sender)
{
	//return;	
}

function UpdateImage()
{
	// End:0x99
	if((items.Length > Index) && items[Index].Image != none)
	{
		Image = items[Index].Image;
		X1 = items[Index].X1;
		X2 = items[Index].X2;
		Y1 = items[Index].Y1;
		Y2 = items[Index].Y2;		
	}
	else
	{
		Image = NAImage;
		X1 = -1;
		X2 = -1;
		Y1 = -1;
		Y2 = -1;
	}
	//return;	
}

function bool InternalOnClick(GUIComponent Sender)
{
	// End:0x1D
	if(Index >= (items.Length - 1))
	{
		Index = 0;		
	}
	else
	{
		Index++;
	}
	UpdateImage();
	OnItemChange(self);
	return true;
	//return;	
}

function bool InternalOnRightClick(GUIComponent Sender)
{
	// End:0x1D
	if(Index <= 0)
	{
		Index = items.Length - 1;		
	}
	else
	{
		Index--;
	}
	UpdateImage();
	OnItemChange(self);
	return true;
	//return;	
}

function InternalOnDraw(Canvas C)
{
	local float XL, YL;

	// End:0x12
	if(Index >= items.Length)
	{
		return;
	}
	C.Style = 5;
	C.Font = Controller.GetMenuFont("UT2SmallFont").GetFont(int(C.ClipX));
	// End:0xFB
	if(Caption != "")
	{
		C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
		C.StrLen(Caption, XL, YL);
		C.SetPos(ActualLeft() + ((ActualWidth() - XL) / float(2)), (ActualTop() - YL) - (YL / float(2)));
		C.DrawText(Caption);
	}
	C.SetDrawColor(byte(255), byte(255), 0, byte(255));
	C.StrLen(items[Index].Caption, XL, YL);
	C.SetPos(ActualLeft() + ((ActualWidth() - XL) / float(2)), (ActualTop() + ActualHeight()) + (YL / float(2)));
	C.DrawText(items[Index].Caption);
	//return;	
}

defaultproperties
{
	ImageStyle=4
	ImageRenderStyle=1
	ImageAlign=1
	bAcceptsInput=true
	OnRendered=GUILoadOutItem.InternalOnDraw
	OnClick=GUILoadOutItem.InternalOnClick
	OnRightClick=GUILoadOutItem.InternalOnRightClick
}
