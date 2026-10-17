class AkeronRocket extends BallisticProjectile;

var Sound ImpactSounds[6];
var float OutwardDamageRadius;

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

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir, ClosestLinePoint;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x25E
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x25D
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			Dir = Victims.Location - HitLocation;
			// End:0xC4
			if((Vector(Rotation) Dot Normal(Dir)) < float(0))
			{
				continue;				
			}
			ClosestLinePoint = Location + ((Vector(Rotation) * ((Vector(Rotation) * DamageRadius) Dot (Victims.Location - Location))) / DamageRadius);
			// End:0x12B
			if(VSize(Victims.Location - ClosestLinePoint) > OutwardDamageRadius)
			{
				continue;				
			}
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - (0.6500000 * FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius));
			// End:0x1AF
			if(!FastTrace(Victims.Location, Location))
			{
				damageScale *= 0.7500000;
			}
			// End:0x1E4
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

simulated function DoDamage(Actor Other, Vector HitLocation)
{
	local Class<DamageType> dt;
	local float Dmg;
	local Vector ClosestLocation, BoneTestLocation, Temp;

	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0x12B
	if(xPawn(Other) != none)
	{
		ClosestLocation = Other.Location;
		ClosestLocation.Z += HitLocation - Other.Location.Z;
		Temp = Normal(Velocity);
		Temp *= VSize(ClosestLocation - HitLocation);
		BoneTestLocation = Temp;
		BoneTestLocation *= (Normal(ClosestLocation - HitLocation) Dot Normal(Temp));
		BoneTestLocation += HitLocation;
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(GetDamageVictim(Other, BoneTestLocation, Normal(Velocity), Dmg, dt), Dmg, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), dt);		
	}
	else
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(GetDamageVictim(Other, HitLocation, Normal(Velocity), Dmg, dt), Dmg, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), dt);
	}
	//return;	
}

simulated function Actor GetDamageVictim(Actor Other, Vector HitLocation, Vector Dir, out float Dmg, optional out Class<DamageType> dt)
{
	local string Bone;
	local float boneDist;
	local Vector HitLocationMatchZ;
	local Pawn DriverPawn;

	Dmg = Damage;
	dt = MyDamageType;
	// End:0x39
	if(!bUsePositionalDamage || Monster(Other) != none)
	{
		return Other;
	}
	// End:0x1C9
	if(Pawn(Other) != none)
	{
		// End:0xBD
		if(Vehicle(Other) != none)
		{
			DriverPawn = Vehicle(Other).CheckForHeadShot(HitLocation, Dir, 1.0000000);
			// End:0xBA
			if(DriverPawn != none)
			{
				Other = DriverPawn;
				Dmg *= HeadMult;
				// End:0xBA
				if(DamageTypeHead != none)
				{
					dt = DamageTypeHead;
				}
			}			
		}
		else
		{
			HitLocationMatchZ = HitLocation;
			HitLocationMatchZ.Z = Other.Location.Z;
			Bone = string(Other.GetClosestBone(HitLocation, Dir, boneDist, 'head', 10.0000000));
			// End:0x152
			if(InStr(Bone, "head") > -1)
			{
				Dmg *= HeadMult;
				// End:0x14F
				if(DamageTypeHead != none)
				{
					dt = DamageTypeHead;
				}				
			}
			else
			{
				// End:0x1C9
				if((HitLocation.Z < (Other.GetBoneCoords('spine').Origin.Z - float(14))) || VSize(HitLocationMatchZ - Other.Location) > float(22))
				{
					Dmg *= LimbMult;
					// End:0x1C9
					if(DamageTypeLimb != none)
					{
						dt = DamageTypeLimb;
					}
				}
			}
		}
	}
	return Other;
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
	OutwardDamageRadius=96.0000000
	WeaponClass=Class'BWBP_OP_Pro.AkeronLauncher'
	ImpactManager=Class'BWBP_OP_Pro.IM_Akeron'
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
