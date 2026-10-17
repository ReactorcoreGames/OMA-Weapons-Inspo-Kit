class Action_RUN extends ScriptedAction
	editinlinenew
	collapsecategories
	hidecategories(Object);

function bool InitActionFor(ScriptedController C)
{
	C.Pawn.ShouldCrouch(false);
	C.Pawn.SetWalking(false);
	return false;
	//return;	
}

defaultproperties
{
	ActionString="Run"
	bValidForTrigger=false
}
