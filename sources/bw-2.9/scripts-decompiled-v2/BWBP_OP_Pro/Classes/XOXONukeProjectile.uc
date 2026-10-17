class XOXONukeProjectile extends BallisticProjectile;

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
	// End:0xCE
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x76
		if(bCheckHitSurface)
		{
			CheckSurface(HitLocation, HitNormal, Surf);
		}
		// End:0xAE
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 2, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 2, Instigator);
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0x11F
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

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x1D4
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x1D3
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x125
			if(!FastTrace(Location, Victims.Location))
			{
				damageScale *= 0.6500000;
			}
			// End:0x15A
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

defaultproperties
{
	WeaponClass=Class'BWBP_OP_Pro.XOXOStaff'
	ImpactManager=Class'BWBP_OP_Pro.IM_XOXO'
	PenetrateManager=Class'BWBP_OP_Pro.IM_XOXO'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_OP_Pro.XOXONukeTrail'
	bRandomStartRotation=false
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTXOXOSexplosion'
	Speed=2500.0000000
	MaxSpeed=4500.0000000
	bSwitchToZeroCollision=true
	Damage=250.0000000
	DamageRadius=2048.0000000
	MomentumTransfer=100.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTXOXOSexplosion'
	LightType=1
	LightEffect=21
	LightHue=220
	LightSaturation=120
	LightBrightness=192.0000000
	LightRadius=6.0000000
	StaticMesh=StaticMesh'BWBP_OP_Static.XOXO.O'
	bDynamicLight=true
	bNetTemporary=false
	bSkipActorPropertyReplication=true
	bOnlyDirtyReplication=true
	AmbientSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire2FlyBy'
	LifeSpan=4.0000000
	DrawScale=3.0000000
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	CollisionRadius=2.0000000
	CollisionHeight=2.0000000
	bNetNotify=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=16384)
}
