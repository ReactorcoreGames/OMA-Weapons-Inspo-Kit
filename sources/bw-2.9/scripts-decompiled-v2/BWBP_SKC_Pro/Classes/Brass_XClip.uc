class Brass_XClip extends BWBrass_Default
	config(BallisticProV55);

simulated function PostBeginPlay()
{
	super(BallisticBrass).PostBeginPlay();
	RotationRate.Pitch = int(float(32768) + (float(32768) * FRand()));
	//return;	
}

defaultproperties
{
	StartVelocity=(X=20.0000000,Y=0.0000000,Z=100.0000000)
	bHitSounds=false
	StaticMesh=StaticMesh'BWBP_SKC_Static.XM84.XM84Clip'
	DrawScale=1.5000000
}
