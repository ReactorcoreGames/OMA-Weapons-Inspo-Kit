class MutBerserk extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function ModifyPlayer(Pawn Other)
{
	// End:0x3C
	if(Other.ShieldStrength < float(100))
	{
		Other.AddShieldStrength(int(float(100) - Other.ShieldStrength));
	}
	super.ModifyPlayer(Other);
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	// End:0x42
	if(Vehicle(Other) != none)
	{
		Vehicle(Other).Health *= float(2);
		Vehicle(Other).HealthMax *= float(2);
	}
	return true;
	//return;	
}

auto state StartUp
{
	function Tick(float DeltaTime)
	{
		local Weapon W;
		local Ammunition A;
		local Vehicle V;

		Level.GRI.WeaponBerserk = 3.0000000;
		// End:0x3D
		foreach DynamicActors(Class'Engine.Weapon', W)
		{
			W.CheckSuperBerserk();			
		}		
		// End:0x5E
		foreach DynamicActors(Class'Engine.Vehicle', V)
		{
			V.CheckSuperBerserk();			
		}		
		// End:0x80
		foreach DynamicActors(Class'Engine.Ammunition', A)
		{
			A.AddAmmo(1);			
		}		
		GotoState('BegunPlay');
		//return;		
	}
	stop;	
}

state BegunPlay
{	stop;	
}

defaultproperties
{
	GroupName="Berserk"
	FriendlyName="Super Berserk"
	Description="Weapons are insanely fast and powerful."
}
