class MutRegen extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() float RegenPerSecond;

event PreBeginPlay()
{
	SetTimer(1.0000000, true);
	//return;	
}

function Timer()
{
	local Controller C;

	// End:0xB1
	foreach __NFUN_325__(Class'Engine.Controller', C)
	{
		// End:0xB0
		if((C.Pawn != none) && float(C.Pawn.Health) < C.Pawn.HealthMax)
		{
			C.Pawn.Health = Min(int(float(C.Pawn.Health) + RegenPerSecond), int(C.Pawn.HealthMax));
		}		
	}	
	//return;	
}

defaultproperties
{
	RegenPerSecond=5.0000000
	GroupName="Regen"
	FriendlyName="Regeneration"
	Description="All players regenerate health."
}
