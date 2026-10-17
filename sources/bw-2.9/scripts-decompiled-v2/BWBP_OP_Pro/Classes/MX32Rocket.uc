class MX32Rocket extends BallisticProjectile;

var float FlightSpeed;
var float ArmingDelay;
var bool bArmed;
var Sound IgniteSound;

simulated function PostNetBeginPlay()
{
	local PlayerController PC;

	SetTimer(ArmingDelay, false);
	// End:0x24
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x64
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		bDynamicLight = false;
		LightType = 0;		
	}
	else
	{
		PC = Level.GetLocalPlayerController();
		// End:0xBB
		if(((PC == none) || Instigator == none) || PC != Instigator.Controller)
		{
			bDynamicLight = false;
			LightType = 0;
		}
	}
	// End:0xF0
	if(Emitter(Trail) != none)
	{
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale * 0.3500000);
	}
	//return;	
}

simulated function InitEffects()
{
	local Vector X, Y, Z;

	// End:0x111
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x111
		if((TrailClass != none) && Trail == none)
		{
			GetAxes(Rotation, X, Y, Z);
			Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
			// End:0xF9
			if(Emitter(Trail) != none)
			{
				// End:0xD4
				if(bArmed)
				{
					Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale);					
				}
				else
				{
					Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale * 0.3500000);
				}
			}
			// End:0x111
			if(Trail != none)
			{
				Trail.SetBase(self);
			}
		}
	}
	//return;	
}

simulated function Timer()
{
	SetCollision(true, true);
	InitProjectile();
	PlaySound(IgniteSound, 1, 255.0000000, true, 512.0000000);
	Velocity = Vector(Rotation) * FlightSpeed;
	Acceleration = Normal(Velocity) * AccelSpeed;
	SoundVolume = 128;
	bArmed = true;
	// End:0x86
	if(Emitter(Trail) != none)
	{
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale);
	}
	//return;	
}

defaultproperties
{
	FlightSpeed=20000.0000000
	ArmingDelay=0.2000000
	IgniteSound=Sound'CicadaSnds.Missile.MissileIgnite'
	WeaponClass=Class'BWBP_OP_Pro.MX32Weapon'
	ImpactManager=Class'BallisticProV55.IM_MRLRocket'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.MRLTrailEmitter'
	TrailOffset=(X=-4.0000000,Y=0.0000000,Z=0.0000000)
	bRandomStartRotation=false
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_OP_Pro.DT_MX32RocketRadius'
	AccelSpeed=10000.0000000
	Speed=500.0000000
	MaxSpeed=30000.0000000
	Damage=32.0000000
	DamageRadius=150.0000000
	MyDamageType=Class'BWBP_OP_Pro.DT_MX32Rocket'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket'
	AmbientSound=Sound'BW_Core_WeaponSound.MRL.MRL-RocketFly'
	SoundVolume=32
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
