class BC_GUICheckListBox extends GUIListBox
	editinlinenew
	instanced;

var export editinline BC_GUICheckList CheckList;

function InitBaseList(GUIListBase LocalList)
{
	// End:0x3E
	if(((CheckList == none) || CheckList != LocalList) && BC_GUICheckList(LocalList) != none)
	{
		CheckList = BC_GUICheckList(LocalList);
	}
	super.InitBaseList(LocalList);
	//return;	
}

defaultproperties
{
	DefaultListClass="BCoreProV55.BC_GUICheckList"
}
