class LightningProjectile extends BallisticProjectile;

var Pawn ComboTarget;

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	local LightningConductor LConductor;

	// End:0x12
	if(Class<DT_LightningRifle>(DamageType) == none)
	{
		return;
	}
	LConductor = Spawn(Class'BWBP_OP_Pro.LightningConductor', Instigator,, Location);
	// End:0xA7
	if(LConductor != none)
	{
		LConductor.Instigator = Instigator;
		LConductor.Damage = int(float(Damage) * Class'BWBP_OP_Pro.LightningPrimaryFire'.default.TransferDamageMultiplier);
		LConductor.ChargePower = 2.0000000;
		LConductor.bIsCombo = true;
		LConductor.Initialize(self);
	}
	Damage = 1;
	Explode(Location, Normal(Velocity));
	//return;	
}

function Monitor(Pawn P)
{
	ComboTarget = P;
	// End:0x1D
	if(ComboTarget != none)
	{
		GotoState('WaitForCombo');
	}
	//return;	
}

state WaitForCombo
{
	function Tick(float DeltaTime)
	{
		// End:0x50
		if((((ComboTarget == none) || ComboTarget.bDeleteMe) || Instigator == none) || ShockRifle(Instigator.Weapon) == none)
		{
			GotoState('None');
			return;
		}
		// End:0xD6
		if((VSize(ComboTarget.Location - Location) <= ((0.5000000 * float(768)) + ComboTarget.CollisionRadius)) || (Velocity Dot (ComboTarget.Location - Location)) <= float(0))
		{
			LightningRifle(Instigator.Weapon).DoCombo();
			GotoState('None');
			return;
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_OP_Pro.LightningRifle'
	ImpactManager=Class'BWBP_OP_Pro.IM_LightningArcProj'
	TrailClass=Class'OnslaughtBP.ONSShockBall'
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_OP_Pro.DT_LightningProjectile'
	ShakeRotMag=(X=256.0000000,Y=200.0000000,Z=128.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=10.0000000,Y=15.0000000,Z=15.0000000)
	ShakeOffsetTime=2.0000000
	MotionBlurRadius=300.0000000
	AccelSpeed=-100.0000000
	Speed=750.0000000
	MaxSpeed=1500.0000000
	bSwitchToZeroCollision=true
	Damage=20.0000000
	DamageRadius=1.0000000
	MyDamageType=Class'BWBP_OP_Pro.DT_LightningProjectile'
	LightType=1
	LightHue=150
	LightBrightness=225.0000000
	LightRadius=12.0000000
	StaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleSphere3'
	bDynamicLight=true
	bNetTemporary=false
	AmbientSound=Sound'WeaponSounds.ShockRifle.ShockRifleProjectile'
	LifeSpan=7.5000000
	DrawScale=0.3000000
	Skins[0]=FinalBlend'PickupSkins.Shaders.FinalHealthCore'
	Style=6
	SoundVolume=255
	SoundRadius=150.0000000
	CollisionRadius=16.0000000
	CollisionHeight=16.0000000
	bProjTarget=true
}
