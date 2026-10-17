class MRS138Slug_Gas extends BallisticGrenade;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local MRS138CloudControl C;

	// End:0x18
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	BlowUp(HitLocation);
	// End:0x84
	if(ImpactManager != none)
	{
		// End:0x65
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0xD5
	if(int(Role) == int(ROLE_Authority))
	{
		C = Spawn(Class'BallisticProV55.MRS138CloudControl', self,, HitLocation - (HitNormal * float(2)));
		// End:0xD5
		if(C != none)
		{
			C.Instigator = Instigator;
		}
	}
	Destroy();
	//return;	
}

defaultproperties
{
	UnarmedDetonateOn=4
	ArmedDetonateOn=1
	ArmedPlayerImpactType=1
	ReflectImpactManager=Class'BallisticProV55.IM_BigBullet'
	DampenFactor=1.0000000
	DampenFactorParallel=1.0000000
	bNoInitialSpin=true
	bAlignToVelocity=true
	ArmingDelay=0.0300000
	ImpactDamage=50
	ImpactDamageType=Class'BallisticProV55.DTMRS138GasImpact'
	WeaponClass=Class'BallisticProV55.MRS138Shotgun'
	ImpactManager=Class'BallisticProV55.IM_TearGasProj'
	TrailClass=Class'BallisticProV55.TraceEmitter_M763Gas'
	MyRadiusDamageType=Class'BallisticProV55.DTMRS138ShotgunFragRadius'
	MotionBlurRadius=130.0000000
	AccelSpeed=50000.0000000
	Speed=6000.0000000
	MaxSpeed=8000.0000000
	Damage=50.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	MyDamageType=Class'BallisticProV55.DTMRS138ShotgunFrag'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket'
	DrawScale=1.0000000
	bBounce=false
}
