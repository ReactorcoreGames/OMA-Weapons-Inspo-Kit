class T10Rolled extends T10Thrown;

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
	ModeIndex=1
}
