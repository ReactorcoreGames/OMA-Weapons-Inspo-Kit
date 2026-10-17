class Action_ChangeObjectiveTeam extends ScriptedAction
	editinlinenew
	collapsecategories
	hidecategories(Object);

var(Action) name ObjectiveTag;
var(Action) byte NewTeam;

function bool InitActionFor(ScriptedController C)
{
	local GameObjective O;

	// End:0x43
	if(ObjectiveTag != 'None')
	{
		// End:0x42
		foreach C.AllActors(Class'UnrealGame.GameObjective', O, ObjectiveTag)
		{
			O.SetTeam(NewTeam);			
		}		
	}
	return false;
	//return;	
}

defaultproperties
{
	ActionString="Change game objective team"
}
