class ACTION_SetObjectiveActiveStatus extends ScriptedAction
	editinlinenew
	collapsecategories
	hidecategories(Object);

var(Action) name ObjectiveTag;
var(Action) bool bActive;

function bool InitActionFor(ScriptedController C)
{
	local GameObjective GO;

	// End:0xA6
	if(ObjectiveTag != 'None')
	{
		GO = UnrealTeamInfo(C.Level.Game.GameReplicationInfo.Teams[0]).AI.Objectives;
		J0x57:

		// End:0xA6 [Loop If]
		if(GO != none)
		{
			// End:0x8F
			if(ObjectiveTag == GO.Tag)
			{
				GO.SetActive(bActive);
			}
			GO = GO.NextObjective;
			// [Loop Continue]
			goto J0x57;
		}
	}
	return false;
	//return;	
}

function string GetActionString()
{
	return ActionString @ string(ObjectiveTag);
	//return;	
}

defaultproperties
{
	bActive=true
	ActionString="Change Objective's Active Status"
}
