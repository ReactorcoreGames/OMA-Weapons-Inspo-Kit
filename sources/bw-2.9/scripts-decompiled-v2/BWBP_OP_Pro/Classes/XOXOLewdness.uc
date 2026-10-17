class XOXOLewdness extends BallisticEmitter;

var float Brakes;
var float MaxSpeed;
var int HealPower;
var() Sound CollectSound;
var Pawn attracttarget;
var Vector LastSeenLoc;
var Actor WanderTarget;
var Actor OldWanderTarget;
var byte NetState;
var byte StateNum;
var float MySoulPower;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		NetState, attracttarget;
}

simulated event PostNetReceive()
{
	// End:0x4A
	if(int(NetState) != int(StateNum))
	{
		switch(NetState)
		{
			// End:0x29
			case 0:
				GotoState('Spawning');
				// End:0x4A
				break;
			// End:0x38
			case 1:
				GotoState('Wander');
				// End:0x4A
				break;
			// End:0x47
			case 2:
				GotoState('Attracted');
				// End:0x4A
				break;
			// End:0xFFFF
			default:
				break;
		}
	}
	else
	{
		//return;		
	}
}

event Touch(Actor Other)
{
	local Inventory Inv;

	// End:0x2D
	if((Pawn(Other) == none) || !Pawn(Other).bCanPickupInventory)
	{
		return;
	}
	// End:0x4A
	if(!FastTrace(Other.Location, Location))
	{
		return;
	}
	Inv = Pawn(Other).Inventory;
	J0x63:

	// End:0x116 [Loop If]
	if(Inv != none)
	{
		// End:0xFF
		if(XOXOStaff(Inv) != none)
		{
			// End:0x98
			if(CollectSound != none)
			{
				PlaySound(CollectSound, 3, 1.5000000);
			}
			XOXOStaff(Inv).AddLewd(MySoulPower);
			// End:0xFA
			if(BallisticPawn(Other) != none)
			{
				BallisticPawn(Other).GiveAttributedHealth(HealPower, int(BallisticPawn(Other).SuperHealthMax), Pawn(Other), true);
			}
			Destroy();
			return;
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x63;
	}
	// End:0x197
	if((BallisticPawn(Other) != none) && BallisticPawn(Other).Health > 0)
	{
		// End:0x15B
		if(CollectSound != none)
		{
			PlaySound(CollectSound, 3, 1.5000000);
		}
		BallisticPawn(Other).GiveAttributedHealth(HealPower, int(BallisticPawn(Other).SuperHealthMax), Pawn(Other), true);
		Destroy();
	}
	//return;	
}

singular simulated event HitWall(Vector HitNormal, Actor Wall)
{
	local Vector VNorm;

	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * 0.5000000) + ((Velocity - VNorm) * 0.9000000);
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x25
	if(VSize(Velocity) > MaxSpeed)
	{
		Velocity = Normal(Velocity) * MaxSpeed;
	}
	// End:0x76
	if((Acceleration == vect(0.0000000, 0.0000000, 0.0000000)) && Brakes > float(0))
	{
		Velocity = Normal(Velocity) * FMax(0.0000000, VSize(Velocity) - (Brakes * dt));
	}
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x13
	if(Class<DT_RSBlackHoleSuck>(DamageType) != none)
	{
		Destroy();
	}
	//return;	
}

static function XOXOLewdness DistributeLewd(Vector StartLoc, Pawn Killer, Pawn Victim, Actor ControlActor)
{
	local XOXOLewdness TheLewd;
	local Vector HitLoc, HitNorm, SpawnLoc, HitLoc2;
	local Actor t;

	// End:0x0D
	if(ControlActor == none)
	{
		return none;
	}
	t = ControlActor.Trace(HitLoc, HitNorm, StartLoc - (vect(0.0000000, 0.0000000, 1.0000000) * float(28)), StartLoc, false, vect(16.0000000, 16.0000000, 0.0000000));
	// End:0x81
	if(t == none)
	{
		HitLoc = StartLoc - (vect(0.0000000, 0.0000000, 1.0000000) * float(28));
	}
	t = ControlActor.Trace(HitLoc2, HitNorm, StartLoc + (vect(0.0000000, 0.0000000, 1.0000000) * float(28)), StartLoc, false, vect(16.0000000, 16.0000000, 0.0000000));
	// End:0xF5
	if(t == none)
	{
		HitLoc2 = StartLoc + (vect(0.0000000, 0.0000000, 1.0000000) * float(28));
	}
	SpawnLoc.Z = HitLoc.Z + ((HitLoc2.Z - HitLoc.Z) * 0.5000000);
	t = ControlActor.Trace(HitLoc, HitNorm, StartLoc + (vect(1.0000000, 0.0000000, 0.0000000) * float(28)), StartLoc, false, vect(0.0000000, 16.0000000, 16.0000000));
	// End:0x19D
	if(t == none)
	{
		HitLoc = StartLoc + (vect(1.0000000, 0.0000000, 0.0000000) * float(28));
	}
	t = ControlActor.Trace(HitLoc2, HitNorm, StartLoc - (vect(1.0000000, 0.0000000, 0.0000000) * float(28)), StartLoc, false, vect(0.0000000, 16.0000000, 16.0000000));
	// End:0x211
	if(t == none)
	{
		HitLoc2 = StartLoc - (vect(1.0000000, 0.0000000, 0.0000000) * float(28));
	}
	SpawnLoc.X = HitLoc.X + ((HitLoc2.X - HitLoc.X) * 0.5000000);
	t = ControlActor.Trace(HitLoc, HitNorm, StartLoc + (vect(0.0000000, 1.0000000, 0.0000000) * float(28)), StartLoc, false, vect(16.0000000, 0.0000000, 16.0000000));
	// End:0x2B9
	if(t == none)
	{
		HitLoc = StartLoc + (vect(0.0000000, 1.0000000, 0.0000000) * float(28));
	}
	t = ControlActor.Trace(HitLoc2, HitNorm, StartLoc - (vect(0.0000000, 1.0000000, 0.0000000) * float(28)), StartLoc, false, vect(16.0000000, 0.0000000, 16.0000000));
	// End:0x32D
	if(t == none)
	{
		HitLoc2 = StartLoc - (vect(0.0000000, 1.0000000, 0.0000000) * float(28));
	}
	SpawnLoc.Y = HitLoc.Y + ((HitLoc2.Y - HitLoc.Y) * 0.5000000);
	TheLewd = ControlActor.Spawn(default.Class, Victim,, SpawnLoc, rot(0, 0, 0));
	// End:0x3AF
	if(TheLewd != none)
	{
		TheLewd.attracttarget = Killer;
	}
	// End:0x3E5
	if(Monster(Victim) != none)
	{
		TheLewd.MySoulPower = Victim.HealthMax / float(1000);
	}
	return TheLewd;
	//return;	
}

auto state Spawning
{
	simulated function BeginState()
	{
		NetState = 0;
		StateNum = 0;
		LastSeenLoc = Location;
		MaxSpeed = 200.0000000;
		Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
		Velocity = vect(0.0000000, 0.0000000, 100.0000000) + (VRand() * float(50));
		Brakes = 250.0000000;
		SetTimer(0.5000000, false);
		//return;		
	}

	simulated event Timer()
	{
		SetCollisionSize(64.0000000, 64.0000000);
		GotoState('Attracted');
		//return;		
	}
	stop;	
}

simulated state Wander
{
	simulated function BeginState()
	{
		NetState = 1;
		StateNum = 1;
		MaxSpeed = 150.0000000;
		SetTimer(0.1000000, true);
		//return;		
	}

	simulated function FindDest()
	{
		local NavigationPoint N, Best;
		local float dist, BestDist;

		// End:0x16
		if(WanderTarget != none)
		{
			OldWanderTarget = WanderTarget;
		}
		// End:0x92
		if(NavigationPoint(WanderTarget) != none)
		{
			N = NavigationPoint(WanderTarget);
			// End:0x7A
			if(N.PathList.Length > 0)
			{
				Best = N.PathList[Rand(N.PathList.Length)].End;
			}
			// End:0x92
			if(Best != none)
			{
				WanderTarget = Best;
				return;
			}
		}
		BestDist = 999999.0000000;
		N = Level.NavigationPointList;
		J0xB1:

		// End:0x142 [Loop If]
		if(N != none)
		{
			// End:0xCE
			if(N == OldWanderTarget)
			{				
			}
			else
			{
				dist = VSize(N.Location - Location);
				// End:0x12B
				if((dist < BestDist) && FastTrace(N.Location, Location))
				{
					Best = N;
					BestDist = dist;
				}
			}
			N = N.nextNavigationPoint;
			// [Loop Continue]
			goto J0xB1;
		}
		WanderTarget = Best;
		//return;		
	}

	simulated event Timer()
	{
		// End:0x49
		if((attracttarget != none) && FastTrace(attracttarget.Location, Location))
		{
			Acceleration = Normal(LastSeenLoc - Location) * float(50);
			GotoState('Attracted');
			return;
		}
		// End:0x5A
		if(WanderTarget == none)
		{
			FindDest();
		}
		// End:0xB1
		if(WanderTarget != none)
		{
			// End:0x8B
			if(VSize(WanderTarget.Location - Location) < float(100))
			{
				FindDest();
			}
			Acceleration = Normal(Location - WanderTarget.Location) * float(50);			
		}
		else
		{
			SetTimer(8.0000000, false);
			Acceleration = VRand() * float(50);
		}
		//return;		
	}
Begin:

	Sleep(30.0000000);
TryKill:


	// End:0x19
	if(!PlayerCanSeeMe())
	{
		Kill();		
	}
	else
	{
		Sleep(2.0000000);
		goto 'TryKill';
	}
	stop;					
}

simulated state Attracted
{
	simulated function BeginState()
	{
		NetState = 2;
		StateNum = 2;
		MaxSpeed = 250.0000000;
		SetTimer(0.1000000, true);
		//return;		
	}

	simulated event Timer()
	{
		// End:0x9E
		if(attracttarget != none)
		{
			// End:0x64
			if(!FastTrace(attracttarget.Location, Location))
			{
				// End:0x47
				if(VSize(LastSeenLoc - Location) < float(250))
				{
					GotoState('Wander');					
				}
				else
				{
					Acceleration = Normal(LastSeenLoc - Location) * float(125);
				}				
			}
			else
			{
				LastSeenLoc = attracttarget.Location;
				Acceleration = Normal(attracttarget.Location - Location) * float(125);
			}			
		}
		else
		{
			// End:0xD8
			if((LastSeenLoc == vect(0.0000000, 0.0000000, 0.0000000)) || VSize(LastSeenLoc - Location) < float(250))
			{
				GotoState('Wander');				
			}
			else
			{
				Acceleration = Normal(LastSeenLoc - Location) * float(125);
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	HealPower=50
	CollectSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Soul'
	MySoulPower=1.0000000
	// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOLewdness.LewdGlow'
	begin object name="LewdGlow" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=160,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=255,A=0))
		ColorScaleRepeats=1.0000000
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.4000000
		FadeOutStartTime=0.2000000
		CoordinateSystem=1
		MaxParticles=5
		DetailMode=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=2.0000000
		InitialParticlesPerSecond=2.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7500000,Max=0.7500000)
	end object
	Emitters[0]=LewdGlow
	// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOLewdness.LewdHearts'
	begin object name="LewdHearts" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.5000000,Max=1.0000000))
		FadeOutStartTime=0.7500000
		FadeInEndTime=0.7500000
		MaxParticles=16
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
		Texture=Texture'BWBP_OP_Tex.XOXO.hearteffect'
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	end object
	Emitters[1]=LewdHearts
	// Reference: MeshEmitter'BWBP_OP_Pro.XOXOLewdness.BigHeart'
	begin object name="BigHeart" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_OP_Static.XOXO.Heart'
		SpinParticles=true
		AutomaticInitialSpawning=false
		CoordinateSystem=1
		MaxParticles=1
		SpinCCWorCW=(X=1.0000000,Y=1.0000000,Z=1.0000000)
		SpinsPerSecondRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ParticlesPerSecond=1.0000000
		InitialParticlesPerSecond=50000.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[2]=BigHeart
	AutoDestroy=true
	bUpdateSimulatedPosition=true
	bOnlyDirtyReplication=true
	bIgnoreVehicles=true
	Physics=4
	RemoteRole=2
	NetUpdateFrequency=10.0000000
	CollisionRadius=16.0000000
	CollisionHeight=16.0000000
	bCollideActors=true
	bCollideWorld=true
	bUseCylinderCollision=true
	bNetNotify=true
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOLewdness.LewdGlow'
begin object name="LewdGlow" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=160,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=255,A=0))
	ColorScaleRepeats=1.0000000
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.4000000
	FadeOutStartTime=0.2000000
	CoordinateSystem=1
	MaxParticles=5
	DetailMode=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=2.0000000
	InitialParticlesPerSecond=2.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7500000,Max=0.7500000)
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOLewdness.LewdHearts'
begin object name="LewdHearts" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.5000000,Max=1.0000000))
	FadeOutStartTime=0.7500000
	FadeInEndTime=0.7500000
	MaxParticles=16
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
	Texture=Texture'BWBP_OP_Tex.XOXO.hearteffect'
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
end object
// Reference: MeshEmitter'BWBP_OP_Pro.XOXOLewdness.BigHeart'
begin object name="BigHeart" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_OP_Static.XOXO.Heart'
	SpinParticles=true
	AutomaticInitialSpawning=false
	CoordinateSystem=1
	MaxParticles=1
	SpinCCWorCW=(X=1.0000000,Y=1.0000000,Z=1.0000000)
	SpinsPerSecondRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ParticlesPerSecond=1.0000000
	InitialParticlesPerSecond=50000.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
