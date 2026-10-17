class RSNovaSoul extends BallisticEmitter;

var float Brakes;
var float MaxSpeed;
var() Sound CollectSound;
var Pawn Assailant;
var Vector LassSeenLoc;
var Actor WanderTarget;
var Actor OldWanderTarget;
var Vector TerrorLocation;
var Pawn TerrorInstigator;
var byte NetState;
var byte StateNum;
var float MySoulPower;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		Assailant, NetState;

	// Pos:0x018
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		TerrorInstigator, WanderTarget;
}

simulated event PostNetReceive()
{
	// End:0x68
	if(int(NetState) != int(StateNum))
	{
		switch(NetState)
		{
			// End:0x29
			case 0:
				GotoState('Spawning');
				// End:0x68
				break;
			// End:0x38
			case 1:
				GotoState('BackOff');
				// End:0x68
				break;
			// End:0x47
			case 2:
				GotoState('Follow');
				// End:0x68
				break;
			// End:0x56
			case 3:
				GotoState('Wander');
				// End:0x68
				break;
			// End:0x65
			case 4:
				GotoState('Terror');
				// End:0x68
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

	// End:0xCD [Loop If]
	if(Inv != none)
	{
		// End:0xB6
		if(RSNovaStaff(Inv) != none)
		{
			// End:0x98
			if(CollectSound != none)
			{
				PlaySound(CollectSound, 3, 1.5000000);
			}
			RSNovaStaff(Inv).AddSoul(MySoulPower);
			Destroy();
			return;
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x63;
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
	local Vector V;

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
	// End:0x139
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		V = Velocity * 0.3000000;
		Emitters[3].StartVelocityRange.X.Min = V.X;
		Emitters[3].StartVelocityRange.X.Max = V.X;
		Emitters[3].StartVelocityRange.Y.Min = V.Y;
		Emitters[3].StartVelocityRange.Y.Max = V.Y;
	}
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x6F
	if(HitLocation == Location)
	{
		// End:0x3B
		if(Momentum != vect(0.0000000, 0.0000000, 0.0000000))
		{
			TerrorLocation = Location - Momentum;			
		}
		else
		{
			// End:0x5D
			if(EventInstigator != none)
			{
				TerrorLocation = EventInstigator.Location;				
			}
			else
			{
				TerrorLocation = Location + VRand();
			}
		}		
	}
	else
	{
		TerrorLocation = HitLocation;
	}
	TerrorInstigator = EventInstigator;
	// End:0xB3
	if(Class<DT_RSBlackHoleSuck>(DamageType) != none)
	{
		// End:0xA9
		if(IsInState('BlackHoled'))
		{
			BeginState();			
		}
		else
		{
			GotoState('BlackHoled');
		}		
	}
	else
	{
		GotoState('Terror');
	}
	//return;	
}

static function RSNovaSoul SpawnSoul(Vector StartLoc, Pawn Killer, Pawn Victim, Actor ControlActor)
{
	local RSNovaSoul Soul;
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
	Soul = ControlActor.Spawn(default.Class, Victim,, SpawnLoc);
	// End:0x3A2
	if(Soul != none)
	{
		Soul.Assailant = Killer;
	}
	// End:0x3D8
	if(Monster(Victim) != none)
	{
		Soul.MySoulPower = Victim.HealthMax / float(1000);
	}
	return Soul;
	//return;	
}

auto state Spawning
{
	simulated function BeginState()
	{
		NetState = 0;
		StateNum = 0;
		LassSeenLoc = Location;
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
		GotoState('BackOff');
		//return;		
	}
	stop;	
}

simulated state BackOff
{
	simulated function BeginState()
	{
		NetState = 1;
		StateNum = 1;
		MaxSpeed = 300.0000000;
		// End:0x6E
		if(Assailant != none)
		{
			Acceleration = Normal(Location - Assailant.Location) * float(80);
			Acceleration.Z *= 0.5000000;
			LassSeenLoc = Assailant.Location;
		}
		SetTimer(5.0000000, false);
		//return;		
	}

	simulated event Timer()
	{
		// End:0x15
		if(Assailant == none)
		{
			GotoState('Wander');			
		}
		else
		{
			GotoState('Follow');
		}
		//return;		
	}
	stop;	
}

simulated state Follow
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
		if(Assailant != none)
		{
			// End:0x64
			if(!FastTrace(Assailant.Location, Location))
			{
				// End:0x47
				if(VSize(LassSeenLoc - Location) < float(100))
				{
					GotoState('Wander');					
				}
				else
				{
					Acceleration = Normal(LassSeenLoc - Location) * float(50);
				}				
			}
			else
			{
				LassSeenLoc = Assailant.Location;
				Acceleration = Normal(Assailant.Location - Location) * float(50);
			}			
		}
		else
		{
			// End:0xD8
			if((LassSeenLoc == vect(0.0000000, 0.0000000, 0.0000000)) || VSize(LassSeenLoc - Location) < float(100))
			{
				GotoState('Wander');				
			}
			else
			{
				Acceleration = Normal(LassSeenLoc - Location) * float(50);
			}
		}
		//return;		
	}
	stop;	
}

simulated state Wander
{
	simulated function BeginState()
	{
		NetState = 3;
		StateNum = 3;
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
		if((Assailant != none) && FastTrace(Assailant.Location, Location))
		{
			Acceleration = Normal(LassSeenLoc - Location) * float(50);
			GotoState('Follow');
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

simulated state Terror
{
	simulated function BeginState()
	{
		NetState = 4;
		StateNum = 4;
		MaxSpeed = 500.0000000;
		Acceleration = Normal(Location - TerrorLocation) * float(250);
		SetTimer(5.0000000, false);
		//return;		
	}

	simulated event Timer()
	{
		// End:0x80
		if((((TerrorInstigator != none) && TerrorInstigator.Health > 0) && VSize(Location - TerrorInstigator.Location) < float(500)) && FastTrace(Location - TerrorInstigator.Location))
		{
			TerrorLocation = TerrorInstigator.Location;
			BeginState();			
		}
		else
		{
			// End:0x95
			if(Assailant == none)
			{
				GotoState('Wander');				
			}
			else
			{
				GotoState('Follow');
			}
		}
		//return;		
	}
	stop;	
}

simulated state BlackHoled
{
	simulated function BeginState()
	{
		NetState = 4;
		StateNum = 4;
		MaxSpeed = 100.0000000;
		Acceleration = Normal(Location - TerrorLocation) * float(150);
		SetTimer(2.5000000, false);
		//return;		
	}

	simulated event Timer()
	{
		// End:0x80
		if((((TerrorInstigator != none) && TerrorInstigator.Health > 0) && VSize(Location - TerrorInstigator.Location) < float(500)) && FastTrace(Location - TerrorInstigator.Location))
		{
			TerrorLocation = TerrorInstigator.Location;
			BeginState();			
		}
		else
		{
			// End:0x95
			if(Assailant == none)
			{
				GotoState('Wander');				
			}
			else
			{
				GotoState('Follow');
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	CollectSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Soul'
	MySoulPower=1.0000000
	// Reference: TrailEmitter'BallisticProV55.RSNovaSoul.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=3
		TrailLocation=1
		MaxPointsPerTrail=350
		DistanceThreshold=50.0000000
		PointLifeTime=1.0000000
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=1.0000000,Max=1.0000000))
		MaxParticles=1
		StartSizeRange=(X=(Min=25.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'BW_Core_WeaponTex.DarkStar.DarkTrail'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
	end object
	Emitters[0]=TrailEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSNovaSoul.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.5800000
		FadeInEndTime=0.1900000
		CoordinateSystem=1
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.NovaStaff.NovaAura'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[1]=SpriteEmitter6
	// Reference: SpriteEmitter'BallisticProV55.RSNovaSoul.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.7200000
		FadeInEndTime=0.6900000
		CoordinateSystem=1
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0250000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=42.0000000,Max=44.0000000),Y=(Min=42.0000000,Max=44.0000000),Z=(Min=42.0000000,Max=44.0000000))
		Texture=Texture'BW_Core_WeaponTex.NovaStaff.GoodSoul'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
	end object
	Emitters[2]=SpriteEmitter7
	// Reference: SpriteEmitter'BallisticProV55.RSNovaSoul.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=0,G=96,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.2800000
		MaxParticles=50
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2000000)
		SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=-100.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-300.0000000,Max=-300.0000000))
	end object
	Emitters[3]=SpriteEmitter8
	AutoDestroy=true
	bUpdateSimulatedPosition=true
	bOnlyDirtyReplication=true
	bIgnoreVehicles=true
	Physics=4
	RemoteRole=2
	NetUpdateFrequency=10.0000000
	bCanBeDamaged=true
	CollisionRadius=16.0000000
	CollisionHeight=16.0000000
	bCollideActors=true
	bCollideWorld=true
	bUseCylinderCollision=true
	bNetNotify=true
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: TrailEmitter'BallisticProV55.RSNovaSoul.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=3
	TrailLocation=1
	MaxPointsPerTrail=350
	DistanceThreshold=50.0000000
	PointLifeTime=1.0000000
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=1.0000000,Max=1.0000000))
	MaxParticles=1
	StartSizeRange=(X=(Min=25.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'BW_Core_WeaponTex.DarkStar.DarkTrail'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=999999.0000000,Max=999999.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaSoul.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.5800000
	FadeInEndTime=0.1900000
	CoordinateSystem=1
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.NovaStaff.NovaAura'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaSoul.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.7200000
	FadeInEndTime=0.6900000
	CoordinateSystem=1
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0250000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=42.0000000,Max=44.0000000),Y=(Min=42.0000000,Max=44.0000000),Z=(Min=42.0000000,Max=44.0000000))
	Texture=Texture'BW_Core_WeaponTex.NovaStaff.GoodSoul'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaSoul.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=0,G=96,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.2800000
	MaxParticles=50
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2000000)
	SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=-100.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-300.0000000,Max=-300.0000000))
end object
