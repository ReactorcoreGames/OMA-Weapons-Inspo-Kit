class AkeronRocketHE extends BallisticProjectile;

var Sound ImpactSounds[6];

simulated function Landed(Vector HitNormal)
{
	Explode(Location, HitNormal);
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	// End:0xDB
	if((!Wall.bStatic && !Wall.bWorldGeometry) && (Mover(Wall) == none) || Mover(Wall).bDamageTriggered)
	{
		// End:0xD6
		if(int(Level.NetMode) != int(NM_Client))
		{
			// End:0xA3
			if((Instigator == none) || Instigator.Controller == none)
			{
				Wall.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Wall.TakeDamage(int(Damage), Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
		}
		Destroy();
		return;
	}
	// End:0x14B
	if(bBounce)
	{
		// End:0x113
		if(!Level.bDropDetail && FRand() < 0.4000000)
		{
			PlaySound(ImpactSounds[Rand(6)]);
		}
		bBounce = false;
		Velocity = 0.7500000 * (Velocity - ((1.2500000 * HitNormal) * (Velocity Dot HitNormal)));
		return;
	}
	Explode(Location, -Vector(Rotation));
	//return;	
}

defaultproperties
{
	ImpactSounds[0]=Sound'XEffects.Impact4Snd'
	ImpactSounds[1]=Sound'XEffects.Impact6Snd'
	ImpactSounds[2]=Sound'XEffects.Impact7Snd'
	ImpactSounds[3]=Sound'XEffects.Impact3'
	ImpactSounds[4]=Sound'XEffects.Impact1'
	ImpactSounds[5]=Sound'XEffects.Impact2'
	WeaponClass=Class'BWBP_OP_Pro.AkeronLauncher'
	ImpactManager=Class'BWBP_OP_Pro.IM_AkeronHE'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_OP_Pro.AkeronRocketTrail'
	TrailOffset=(X=-4.0000000,Y=0.0000000,Z=0.0000000)
	bRandomStartRotation=false
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTAkeron'
	AccelSpeed=100000.0000000
	Speed=4000.0000000
	MaxSpeed=35000.0000000
	Damage=90.0000000
	DamageRadius=300.0000000
	MomentumTransfer=70000.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTAkeron'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.BOGP.BOGP_Grenade'
	AmbientSound=Sound'BW_Core_WeaponSound.MRL.MRL-RocketFly'
	DrawScale=0.7500000
	SoundVolume=64
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
