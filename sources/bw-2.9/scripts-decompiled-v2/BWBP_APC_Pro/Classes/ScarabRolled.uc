class ScarabRolled extends ScarabThrown;

simulated event PostBeginPlay()
{
	local Rotator R;

	super(BallisticGrenade).PostBeginPlay();
	R = Rotation;
	R.Roll = 16384;
	SetRotation(R);
	//return;	
}

defaultproperties
{
	FireModeNum=1
	ImpactDamage=10
}
