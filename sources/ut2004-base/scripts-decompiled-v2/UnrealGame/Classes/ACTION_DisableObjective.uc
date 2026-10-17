class ACTION_DisableObjective extends ScriptedAction
	editinlinenew
	collapsecategories
	hidecategories(Object);

var(Action) name ObjectiveTag;
var(Action) bool bClearInstigator;
var(Action) bool bTriggerObjectiveInstantly;
var GameObjective GO;

event PostBeginPlay(ScriptedSequence SS)
{
	super.PostBeginPlay(SS);
	// End:0x3D
	if(ObjectiveTag != 'None')
	{
		// End:0x3C
		foreach SS.AllActors(Class'UnrealGame.GameObjective', GO, ObjectiveTag)
		{
			// End:0x3C
			break;			
		}		
	}
	//return;	
}

function bool InitActionFor(ScriptedController C)
{
	local Pawn Instigator;

	// End:0x20
	if(!bClearInstigator)
	{
		Instigator = C.GetInstigator();
	}
	// End:0x72
	if(GO != none)
	{
		GO.bClearInstigator = bClearInstigator;
		// End:0x5E
		if(bTriggerObjectiveInstantly)
		{
			GO.DisableObjective(Instigator);
		}
		GO.CompleteObjective(Instigator);
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
	bClearInstigator=true
	ActionString="disable objective"
}
