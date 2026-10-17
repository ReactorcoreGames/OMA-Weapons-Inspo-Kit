class RSDarkFastProjectile extends BallisticProjectile;

var bool bComboHit;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bComboHit;
}

simulated event PostNetReceive()
{
	// End:0x21
	if(bComboHit)
	{
		Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

simulated function InitEffects()
{
	local Vector X, Y, Z;

	bDynamicLight = default.bDynamicLight;
	// End:0xF5
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(Rotation, X, Y, Z);
		Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		// End:0xDD
		if(Emitter(Trail) != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale / float(2));
		}
		// End:0xF5
		if(Trail != none)
		{
			Trail.SetBase(self);
		}
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local int Surf;

	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x32
	if((ShakeRadius > float(0)) || MotionBlurRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	// End:0x104
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x8E
		if(bComboHit)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 5, Level.GetLocalPlayerController());			
		}
		else
		{
			// End:0xAC
			if(bCheckHitSurface)
			{
				CheckSurface(HitLocation, HitNormal, Surf);
			}
			// End:0xE4
			if(Instigator == none)
			{
				ImpactManager.static.StartSpawn(HitLocation, HitNormal, 3, Level.GetLocalPlayerController());				
			}
			else
			{
				ImpactManager.static.StartSpawn(HitLocation, HitNormal, 3, Instigator);
			}
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0x155
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

simulated function DoDamage(Actor Other, Vector HitLocation)
{
	local Class<DamageType> dt;
	local float Dmg;
	local Actor Victim;
	local DestroyableObjective HealObjective;
	local Vehicle HealVehicle;
	local int AdjustedDamage;
	local Vector ClosestLocation, BoneTestLocation, Temp;

	// End:0x8A
	if(((Instigator != none) && Instigator.Weapon != none) && Instigator.Weapon.IsA('RSDarkStar'))
	{
		AdjustedDamage = int((default.Damage * Instigator.DamageScaling) * MyDamageType.default.VehicleDamageScaling);
		// End:0x8A
		if(Instigator.HasUDamage())
		{
			AdjustedDamage *= float(2);
		}
	}
	HealObjective = DestroyableObjective(Other);
	// End:0xBE
	if(HealObjective == none)
	{
		HealObjective = DestroyableObjective(Other.Owner);
	}
	// End:0x10C
	if((HealObjective != none) && HealObjective.TeamLink(Instigator.GetTeamNum()))
	{
		HealObjective.HealDamage(AdjustedDamage, InstigatorController, MyDamageType);
		return;
	}
	HealVehicle = Vehicle(Other);
	// End:0x16A
	if((HealVehicle != none) && HealVehicle.TeamLink(Instigator.GetTeamNum()))
	{
		HealVehicle.HealDamage(AdjustedDamage, InstigatorController, MyDamageType);
		return;
	}
	// End:0x19F
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0x26A
	if(xPawn(Other) != none)
	{
		ClosestLocation = Other.Location;
		ClosestLocation.Z += HitLocation - Other.Location.Z;
		Temp = Normal(Velocity);
		Temp *= VSize(ClosestLocation - HitLocation);
		BoneTestLocation = Temp;
		BoneTestLocation *= (Normal(ClosestLocation - HitLocation) Dot Normal(Temp));
		BoneTestLocation += HitLocation;
		Victim = GetDamageVictim(Other, BoneTestLocation, Normal(Velocity), Dmg, dt);		
	}
	else
	{
		Victim = GetDamageVictim(Other, HitLocation, Normal(Velocity), Dmg, dt);
	}
	// End:0x360
	if((((((BallisticPawn(Instigator) != none) && RSDarkStar(Instigator.Weapon) != none) && Victim != Instigator) && Victim.bProjTarget) && xPawn(Victim) != none) && (Pawn(Victim).GetTeamNum() != Instigator.GetTeamNum()) || Instigator.GetTeamNum() == 255)
	{
		BallisticPawn(Instigator).GiveAttributedHealth(2, int(Instigator.SuperHealthMax), Instigator);
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), dt);
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local Vehicle HealVehicle;
	local int AdjustedDamage;

	HealVehicle = Vehicle(Wall);
	// End:0x10C
	if((HealVehicle != none) && HealVehicle.TeamLink(Instigator.GetTeamNum()))
	{
		AdjustedDamage = int((default.Damage * Instigator.DamageScaling) * MyDamageType.default.VehicleDamageScaling);
		// End:0x88
		if(Instigator.HasUDamage())
		{
			AdjustedDamage *= float(2);
		}
		HealVehicle.HealDamage(AdjustedDamage, Instigator.Controller, MyDamageType);
		BlowUp(Location + (ExploWallOut * HitNormal));
		// End:0x106
		if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
		{
			GotoState('NetTrapped');			
		}
		else
		{
			Destroy();
		}		
	}
	else
	{
		// End:0x1C2
		if(int(Role) == int(ROLE_Authority))
		{
			// End:0x1BA
			if((!Wall.bStatic && !Wall.bWorldGeometry) && (Pawn(Wall) == none) || Vehicle(Wall) != none)
			{
				// End:0x19F
				if((Instigator == none) || Instigator.Controller == none)
				{
					Wall.SetDelayedDamageInstigatorController(InstigatorController);
				}
				DoDamage(Wall, Location);
				HurtWall = Wall;
			}
			MakeNoise(1.0000000);
		}
	}
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	HurtWall = none;
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	// End:0x24
	if((RSDarkProjectile(Other) != none) || RSDarkFastProjectile(Other) != none)
	{
		return false;
	}
	return super.CanTouch(Other);
	//return;	
}

function int ManageHeatInteraction(Pawn P)
{
	local RSDarkStarHeatManager HM;

	// End:0x1D
	foreach P.BasedActors(Class'BallisticProV55.RSDarkStarHeatManager', HM)
	{
		// End:0x1D
		break;		
	}	
	// End:0x6B
	if(HM == none)
	{
		HM = Spawn(Class'BallisticProV55.RSDarkStarHeatManager', P,, P.Location + vect(0.0000000, 0.0000000, -30.0000000));
		HM.SetBase(P);
	}
	// End:0x85
	if(HM != none)
	{
		HM.AddHeat();
	}
	return HM.ConsecutiveHits;
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x51
	if((DamageType == Class'BallisticProV55.DT_RSNovaSlow') || DamageType == Class'BallisticProV55.DT_RSNovaFast')
	{
		ImpactManager.static.StartSpawn(HitLocation, Normal(Momentum), 5, Level.GetLocalPlayerController(), 4);		
	}
	else
	{
		// End:0x7A
		if(DamageType == Class'BallisticProV55.DT_RSNovaLightning')
		{
			bComboHit = true;
			Explode(HitLocation, Normal(Momentum));
		}
	}
	//return;	
}

simulated function DestroyEffects()
{
	// End:0xA2
	if(Trail != none)
	{
		// End:0x96
		if(Emitter(Trail) != none)
		{
			Emitter(Trail).Kill();
			Emitter(Trail).Emitters[0].Disabled = true;
			Emitter(Trail).Emitters[1].Disabled = true;
			Emitter(Trail).Emitters[2].Disabled = true;			
		}
		else
		{
			Trail.Destroy();
		}
	}
	//return;	
}

state NetTrapped
{
	function BeginState()
	{
		HideProjectile();
		SetTimer(NetTrappedDelay, false);
		DestroyEffects();
		//return;		
	}
	stop;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	ImpactManager=Class'BallisticProV55.IM_RSDarkProjectile'
	PenetrateManager=Class'BallisticProV55.IM_RSDarkProjectile'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.RSDark2Trail'
	bRandomStartRotation=false
	MyRadiusDamageType=Class'BallisticProV55.DT_RSDarkFast'
	bUsePositionalDamage=true
	AccelSpeed=80000.0000000
	MaxDamageGainFactor=0.5000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2000000
	Speed=4000.0000000
	MaxSpeed=10000.0000000
	bSwitchToZeroCollision=true
	Damage=40.0000000
	MomentumTransfer=100.0000000
	MyDamageType=Class'BallisticProV55.DT_RSDarkFast'
	LightType=1
	LightEffect=13
	LightBrightness=128.0000000
	LightRadius=7.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.DarkProjSmall'
	bDynamicLight=true
	bNetTemporary=false
	bSkipActorPropertyReplication=true
	bOnlyDirtyReplication=true
	AmbientSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire2FlyBy'
	LifeSpan=1.0000000
	DrawScale=2.0000000
	SoundVolume=255
	SoundRadius=75.0000000
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bProjTarget=true
	bNetNotify=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=100000)
}
