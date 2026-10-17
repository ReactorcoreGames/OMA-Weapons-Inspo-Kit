class Action_WALK extends ScriptedAction
	editinlinenew
	collapsecategories
	hidecategories(Object);

function bool InitActionFor(ScriptedController C)
{
	C.Pawn.ShouldCrouch(false);
	C.Pawn.SetWalking(true);
	return false;
	//return;	
}

defaultproperties
{
	ActionString="walk"
	bValidForTrigger=false
}
