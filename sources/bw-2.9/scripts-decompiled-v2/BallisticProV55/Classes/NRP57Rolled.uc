class NRP57Rolled extends NRP57Thrown;

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
	DampenFactor=0.2000000
	DampenFactorParallel=0.7000000
	ImpactDamage=10
	ModeIndex=1
	MyRadiusDamageType=Class'BallisticProV55.DTNRP57RolledRadius'
}
