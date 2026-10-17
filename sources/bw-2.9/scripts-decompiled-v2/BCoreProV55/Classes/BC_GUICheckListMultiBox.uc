class BC_GUICheckListMultiBox extends GUIListBox
	editinlinenew
	instanced;

var export editinline BC_GUICheckListMulti CheckList;

function InitBaseList(GUIListBase LocalList)
{
	// End:0x3E
	if(((CheckList == none) || CheckList != LocalList) && BC_GUICheckListMulti(LocalList) != none)
	{
		CheckList = BC_GUICheckListMulti(LocalList);
	}
	super.InitBaseList(LocalList);
	//return;	
}

defaultproperties
{
	DefaultListClass="BCoreProV55.BC_GUICheckListMulti"
}
