class Mut_Sprinter extends Mutator
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var array<BCSprintControl> Sprinters;

function ModifyPlayer(Pawn Other)
{
	local BCSprintControl SC;

	super.ModifyPlayer(Other);
	// End:0x75
	if((xPawn(Other) != none) && (GetSprintControl(PlayerController(Other.Controller))) == none)
	{
		SC = Spawn(Class'BCoreProV55.BCSprintControl', Other);
		SC.GiveTo(Other);
		Sprinters[Sprinters.Length] = SC;
	}
	//return;	
}

function BCSprintControl GetSprintControl(PlayerController Sender)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x83 [Loop If]
	if(i < Sprinters.Length)
	{
		// End:0x79
		if(((Sprinters[i] != none) && Sprinters[i].Instigator != none) && Sprinters[i].Instigator.Controller == Sender)
		{
			return Sprinters[i];
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return none;
	//return;	
}

function Mutate(string MutateString, PlayerController Sender)
{
	local BCSprintControl SC;

	// End:0x46
	if(MutateString ~= "BStartSprint")
	{
		SC = GetSprintControl(Sender);
		// End:0x43
		if(SC != none)
		{
			SC.StartSprint();
		}		
	}
	else
	{
		// End:0x88
		if(MutateString ~= "BStopSprint")
		{
			SC = GetSprintControl(Sender);
			// End:0x88
			if(SC != none)
			{
				SC.StopSprint();
			}
		}
	}
	super.Mutate(MutateString, Sender);
	//return;	
}

defaultproperties
{
	FriendlyName="BallisticPro: Sprint"
	Description="This mutator gives players the ability to sprint for a short period of time. This mutator will not allow you to sprint if your level is below 20%, to prevent dodge abuse. Sprint key can be set in the controls configuration menu. It is recommended that you use this when playing with Ballistic Weapons as the weapons have integrated support for player sprinting."
}
