class RSBlackHole extends BallisticEmitter;

var float Charge;
var float PreviousCharge;
var bool bExploded;
var bool InitScaled;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		Charge;
}

simulated event PostNetReceive()
{
	// End:0x17
	if(Charge >= float(20))
	{
		BOOM();		
	}
	else
	{
		// End:0x37
		if(PreviousCharge != Charge)
		{
			UpdateEffect();
			PreviousCharge = Charge;
		}
	}
	//return;	
}

simulated event PostNetBeginPlay()
{
	PostBeginPlay();
	SetTimer(0.1000000, true);
	PreviousCharge = Charge;
	SetCollisionSize(Charge * float(50), Charge * float(50));
	// End:0xC5
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
		Emitters[3].Disabled = true;
		Emitters[4].Disabled = true;
		Emitters[5].Disabled = true;		
	}
	else
	{
		UpdateEffect();
	}
	//return;	
}

function AddCharge(float Amount)
{
	Charge += Amount;
	// End:0x23
	if(Charge >= float(20))
	{
		BOOM();		
	}
	else
	{
		// End:0x38
		if(Charge < 0.1000000)
		{
			Destroy();			
		}
		else
		{
			SetCollisionSize(Charge * float(20), Charge * float(20));
			UpdateEffect();
		}
	}
	PreviousCharge = Charge;
	//return;	
}

simulated function UpdateEffect()
{
	// End:0x2C
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || Charge < 0.1000000)
	{
		return;
	}
	// End:0x54
	if(!InitScaled)
	{
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(self, 0.0750000);
		InitScaled = true;
	}
	Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(self, Charge / PreviousCharge);
	//return;	
}

simulated event Timer()
{
	local float dist;
	local int i;
	local bool bWasAlive, bLOS;

	// End:0xBE
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		bLOS = Level.GetLocalPlayerController().LineOfSightTo(self);
		i = 0;
		J0x3E:

		// End:0xBE [Loop If]
		if(i < Min(EmitterZTestSwitches.Length, Emitters.Length))
		{
			// End:0x8B
			if(bLOS)
			{
				Emitters[i].ZTest = int(EmitterZTestSwitches[i]) == int(1);
				// [Explicit Continue]
				goto J0xB4;
			}
			Emitters[i].ZTest = int(EmitterZTestSwitches[i]) == int(2);
			J0xB4:

			i++;
			// [Loop Continue]
			goto J0x3E;
		}
	}
	// End:0xD0
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	i = 0;
	J0xD7:

	// End:0x566 [Loop If]
	if(i < Touching.Length)
	{
		// End:0x147
		if(((Touching[i] == none) || !Touching[i].bCanBeDamaged) || Pawn(Touching[i]).GetTeamNum() == Instigator.GetTeamNum())
		{
			// [Explicit Continue]
			goto J0x55C;
		}
		// End:0x17E
		if(Projectile(Touching[i]) != none)
		{
			Charge += 0.5000000;
			Touching[i].Destroy();
			// [Explicit Continue]
			goto J0x55C;
		}
		// End:0x47F
		if(Pawn(Touching[i]) != none)
		{
			dist = VSize(Touching[i].Location - Location);
			// End:0x37E
			if(dist < (float(80) + Touching[i].CollisionRadius))
			{
				// End:0x21D
				if((xPawn(Touching[i]) != none) && Pawn(Touching[i]).Health > 0)
				{
					bWasAlive = true;					
				}
				else
				{
					// End:0x286
					if(((Vehicle(Touching[i]) != none) && Vehicle(Touching[i]).Driver != none) && Vehicle(Touching[i]).Driver.Health > 0)
					{
						bWasAlive = true;
					}
				}
				Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Touching[i], 300.0000000 * (Charge / float(20)), Instigator, Touching[i].Location, Normal((Touching[i].Location - Location) + vect(0.0000000, 0.0000000, 70.0000000)) * float(160000), Class'BallisticProV55.DT_RSBlackHoleSuck');
				// End:0x36F
				if((bWasAlive && Touching[i] != none) && Pawn(Touching[i]).Health <= 0)
				{
					// End:0x360
					if(FRand() > 0.5000000)
					{
						Spawn(Class'BallisticProV55.RSDarkSoul',,, Location);						
					}
					else
					{
						Spawn(Class'BallisticProV55.RSNovaSoul',,, Location);
					}
				}
				Charge += 0.5000000;				
			}
			else
			{
				// End:0x411
				if(int(Touching[i].Physics) == int(13))
				{
					Touching[i].KAddImpulse(((Normal(Location - Touching[i].Location) * float(60000)) * (float(1) - (dist / float(500)))) * (Charge / float(20)), Touching[i].Location);					
				}
				else
				{
					Pawn(Touching[i]).AddVelocity((Normal(Location - Touching[i].Location) * (float(60000) / Touching[i].Mass)) * (float(1) - (dist / float(500))));
				}
			}
			// [Explicit Continue]
			goto J0x55C;
		}
		// End:0x55C
		if((RSDarkSoul(Touching[i]) != none) || RSNovaSoul(Touching[i]) != none)
		{
			Touching[i].Velocity += ((Normal(Location - Touching[i].Location) * (float(40000) / Touching[i].Mass)) * (float(1) - (dist / float(500))));
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Touching[i], 100.0000000 * (Charge / float(20)), Instigator, Location, vect(0.0000000, 0.0000000, 10000.0000000), Class'BallisticProV55.DT_RSBlackHoleSuck');
		}
		J0x55C:

		i++;
		// [Loop Continue]
		goto J0xD7;
	}
	AddCharge(-0.0100000);
	//return;	
}

simulated function BOOM()
{
	// End:0x3C
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Class'BallisticProV55.IM_RSBlackHole'.static.StartSpawn(Location, vect(0.0000000, 0.0000000, 1.0000000), 0, self);
	}
	// End:0x56
	if(int(Role) == int(ROLE_Authority))
	{
		GotoState('Exploding');		
	}
	else
	{
		Kill();
	}
	//return;	
}

function Reset()
{
	Destroy();
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	AddCharge(float(Damage) / 100.0000000);
	//return;	
}

state Exploding
{Begin:

	// End:0x1F
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Kill();
	}
	HurtRadius(200.0000000, 512.0000000, Class'BallisticProV55.DT_RSBlackHoleExplode', 10000.0000000, Location);
	Sleep(0.2500000);
	HurtRadius(200.0000000, 700.0000000, Class'BallisticProV55.DT_RSBlackHoleExplode', 20000.0000000, Location);
	Sleep(0.2500000);
	HurtRadius(200.0000000, 900.0000000, Class'BallisticProV55.DT_RSBlackHoleExplode', 50000.0000000, Location);
	// End:0xA8
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Destroy();
	}
	stop;				
}

defaultproperties
{
	Charge=1.0000000
	PreviousCharge=1.0000000
	EmitterZTestSwitches[0]=2
	EmitterZTestSwitches[1]=2
	EmitterZTestSwitches[2]=2
	EmitterZTestSwitches[3]=2
	EmitterZTestSwitches[4]=2
	EmitterZTestSwitches[5]=2
	// Reference: SpriteEmitter'BallisticProV55.RSBlackHole.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.4100000
		FadeInEndTime=0.1500000
		MaxParticles=3
		StartLocationShape=1
		SphereRadiusRange=(Min=100.0000000,Max=100.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
		StartSizeRange=(X=(Min=150.0000000,Max=180.0000000),Y=(Min=150.0000000,Max=180.0000000),Z=(Min=150.0000000,Max=180.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		StartVelocityRadialRange=(Min=-100.0000000,Max=-70.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSBlackHole.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=200,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=200,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=1.0000000),Z=(Min=0.2500000,Max=0.2500000))
		FadeOutStartTime=0.4300000
		FadeInEndTime=0.2300000
		MaxParticles=2
		StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.4000000)
		StartSizeRange=(X=(Min=200.0000000,Max=215.0000000),Y=(Min=200.0000000,Max=215.0000000),Z=(Min=200.0000000,Max=215.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.WaterRing1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	end object
	Emitters[1]=SpriteEmitter7
	// Reference: SpriteEmitter'BallisticProV55.RSBlackHole.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.2800000
		FadeInEndTime=0.5600000
		MaxParticles=3
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.9000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.1000000)
		StartSizeRange=(X=(Min=190.0000000,Max=200.0000000),Y=(Min=190.0000000,Max=200.0000000),Z=(Min=190.0000000,Max=200.0000000))
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.DarkStar.HotFlareA2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[2]=SpriteEmitter8
	// Reference: SpriteEmitter'BallisticProV55.RSBlackHole.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.2900000
		FadeInEndTime=0.0600000
		MaxParticles=4
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=4.0000000)
		StartSizeRange=(X=(Min=35.0000000,Max=50.0000000),Y=(Min=35.0000000,Max=50.0000000),Z=(Min=35.0000000,Max=50.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke7c'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[3]=SpriteEmitter9
	// Reference: SpriteEmitter'BallisticProV55.RSBlackHole.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=1.0000000),Z=(Min=0.4000000,Max=0.6000000))
		Opacity=0.1500000
		FadeOutStartTime=0.2700000
		FadeInEndTime=0.0400000
		MaxParticles=3
		StartLocationRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=25.0000000,Max=75.0000000),Y=(Min=25.0000000,Max=75.0000000),Z=(Min=25.0000000,Max=75.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[4]=SpriteEmitter10
	// Reference: BeamEmitter'BallisticProV55.RSBlackHole.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=128.0000000,Max=512.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-48.0000000,Max=48.0000000),Y=(Min=-48.0000000,Max=48.0000000),Z=(Min=-48.0000000,Max=48.0000000))
		HighFrequencyNoiseRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		HighFrequencyPoints=8
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.0760000
		FadeInEndTime=0.0200000
		MaxParticles=3
		StartLocationShape=1
		SphereRadiusRange=(Min=24.0000000,Max=24.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=3.0000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=50.0000000),Y=(Min=15.0000000,Max=50.0000000),Z=(Min=15.0000000,Max=50.0000000))
		InitialParticlesPerSecond=5.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRadialRange=(Min=-1.0000000,Max=-1.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[5]=BeamEmitter0
	AutoDestroy=true
	bIgnoreEncroachers=true
	bAlwaysRelevant=true
	bNetInitialRotation=true
	RemoteRole=2
	AmbientSound=Sound'BW_Core_WeaponSound.Misc.BH-Ambient'
	bCanBeDamaged=true
	bFullVolume=true
	SoundVolume=255
	SoundRadius=128.0000000
	bCollideActors=true
	bProjTarget=true
	bUseCylinderCollision=true
	bNetNotify=true
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RSBlackHole.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.4100000
	FadeInEndTime=0.1500000
	MaxParticles=3
	StartLocationShape=1
	SphereRadiusRange=(Min=100.0000000,Max=100.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2000000)
	StartSizeRange=(X=(Min=150.0000000,Max=180.0000000),Y=(Min=150.0000000,Max=180.0000000),Z=(Min=150.0000000,Max=180.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	StartVelocityRadialRange=(Min=-100.0000000,Max=-70.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BallisticProV55.RSBlackHole.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=200,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=200,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=1.0000000),Z=(Min=0.2500000,Max=0.2500000))
	FadeOutStartTime=0.4300000
	FadeInEndTime=0.2300000
	MaxParticles=2
	StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.4000000)
	StartSizeRange=(X=(Min=200.0000000,Max=215.0000000),Y=(Min=200.0000000,Max=215.0000000),Z=(Min=200.0000000,Max=215.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.WaterRing1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSBlackHole.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.2800000
	FadeInEndTime=0.5600000
	MaxParticles=3
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.9000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.1000000)
	StartSizeRange=(X=(Min=190.0000000,Max=200.0000000),Y=(Min=190.0000000,Max=200.0000000),Z=(Min=190.0000000,Max=200.0000000))
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.DarkStar.HotFlareA2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSBlackHole.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.2900000
	FadeInEndTime=0.0600000
	MaxParticles=4
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=4.0000000)
	StartSizeRange=(X=(Min=35.0000000,Max=50.0000000),Y=(Min=35.0000000,Max=50.0000000),Z=(Min=35.0000000,Max=50.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke7c'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSBlackHole.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=1.0000000),Z=(Min=0.4000000,Max=0.6000000))
	Opacity=0.1500000
	FadeOutStartTime=0.2700000
	FadeInEndTime=0.0400000
	MaxParticles=3
	StartLocationRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=25.0000000,Max=75.0000000),Y=(Min=25.0000000,Max=75.0000000),Z=(Min=25.0000000,Max=75.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: BeamEmitter'BallisticProV55.RSBlackHole.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=128.0000000,Max=512.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-48.0000000,Max=48.0000000),Y=(Min=-48.0000000,Max=48.0000000),Z=(Min=-48.0000000,Max=48.0000000))
	HighFrequencyNoiseRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	HighFrequencyPoints=8
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.0760000
	FadeInEndTime=0.0200000
	MaxParticles=3
	StartLocationShape=1
	SphereRadiusRange=(Min=24.0000000,Max=24.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=3.0000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=50.0000000),Y=(Min=15.0000000,Max=50.0000000),Z=(Min=15.0000000,Max=50.0000000))
	InitialParticlesPerSecond=5.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRadialRange=(Min=-1.0000000,Max=-1.0000000)
	GetVelocityDirectionFrom=3
end object
