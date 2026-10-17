class G28Rolled extends G28Thrown;

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
	DampenFactor=0.4000000
	ModeIndex=1
}
