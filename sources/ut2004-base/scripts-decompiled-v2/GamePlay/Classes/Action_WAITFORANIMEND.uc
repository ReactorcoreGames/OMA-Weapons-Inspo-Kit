class Action_WAITFORANIMEND extends LatentScriptedAction
	editinlinenew
	collapsecategories
	hidecategories(Object);

var(Action) int Channel;

function bool CompleteOnAnim(int Num)
{
	return Channel == Num;
	//return;	
}

defaultproperties
{
	ActionString="Wait for animend"
	bValidForTrigger=false
}
