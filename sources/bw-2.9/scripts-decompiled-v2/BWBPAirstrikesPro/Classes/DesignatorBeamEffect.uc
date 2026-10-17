class DesignatorBeamEffect extends xEmitter;

enum EPainterTargetingState
{
	PTS_Aiming,                     // 0
	PTS_Marked,                     // 1
	PTS_Aquired,                    // 2
	PTS_Cancelled                   // 3
};

var PainterBeamSpot Spot;
var Vector StartEffect;
var Vector EndEffect;
var Vector EffectOffset;
var LinkMuzFlashBeam3rd MuzFlash;
var float Brightness;
var DesignatorBeamEffect.EPainterTargetingState TargetState;
var() Sound MarkSound;
var() Sound AquiredSound;
var() string MarkForce;
var() string AmbientForce;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		EndEffect, StartEffect, 
		TargetState;
}

simulated function PostBeginPlay()
{
	Spot = Spawn(Class'XEffects.PainterBeamSpot', self);
	//return;	
}

simulated function Destroyed()
{
	// End:0x1C
	if(MuzFlash != none)
	{
		MuzFlash.mRegen = false;
	}
	// End:0x33
	if(Spot != none)
	{
		Spot.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

function SetTargetState(DesignatorBeamEffect.EPainterTargetingState NewState)
{
	TargetState = NewState;
	// End:0x25
	if(int(TargetState) == int(2))
	{
		GotoState('Aquired');		
	}
	else
	{
		// End:0x3C
		if(int(TargetState) == int(3))
		{
			GotoState('Cancelled');
		}
	}
	//return;	
}

simulated function Tick(float dt)
{
	local Vector BeamDir, X, Y, Z;
	local xWeaponAttachment Attachment;

	// End:0x38
	if((int(Role) == int(ROLE_Authority)) && (Instigator == none) || Instigator.Controller == none)
	{
		Destroy();
		return;
	}
	// End:0x86
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		StartEffect = Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000));
		return;
	}
	// End:0x9C
	if(Instigator == none)
	{
		SetLocation(StartEffect);		
	}
	else
	{
		// End:0x1C1
		if(Instigator.IsFirstPerson() && Instigator.Weapon != none)
		{
			// End:0xF3
			if(Instigator.Weapon.WeaponCentered())
			{
				SetLocation(Instigator.Location);				
			}
			else
			{
				Instigator.Weapon.GetViewAxes(X, Y, Z);
				SetLocation((((Instigator.Location + Instigator.CalcDrawOffset(Instigator.Weapon)) + (EffectOffset.X * X)) + ((Instigator.Weapon.hand * EffectOffset.Y) * Y)) + (EffectOffset.Z * Z));
			}
			EndEffect = TargetDesignator(Instigator.Weapon).EndEffect;			
		}
		else
		{
			Attachment = xPawn(Instigator).WeaponAttachment;
			// End:0x222
			if((Attachment != none) && (Level.TimeSeconds - Attachment.LastRenderTime) < float(1))
			{
				SetLocation(Attachment.GetTipLocation());				
			}
			else
			{
				SetLocation((Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000))) + (Normal(EndEffect - Instigator.Location) * 25.0000000));
			}
		}
		// End:0x28D
		if(int(Role) == int(ROLE_Authority))
		{
			StartEffect = Location;
		}
	}
	BeamDir = Normal(EndEffect - Location);
	SetRotation(Rotator(BeamDir));
	mSpawnVecA = EndEffect;
	// End:0x2E0
	if(Spot != none)
	{
		Spot.SetLocation(EndEffect - (BeamDir * 10.0000000));
	}
	// End:0x331
	if(int(TargetState) == int(1))
	{
		// End:0x307
		if(Brightness == 40.0000000)
		{
			PlaySound(MarkSound);
		}
		SetBrightness(FMax(FMin(Brightness + (dt * 100.0000000), 250.0000000), 100.0000000));		
	}
	else
	{
		SetBrightness(40.0000000);
	}
	// End:0x356
	if(int(TargetState) == int(2))
	{
		GotoState('Aquired');		
	}
	else
	{
		// End:0x36D
		if(int(TargetState) == int(3))
		{
			GotoState('Cancelled');
		}
	}
	//return;	
}

simulated function SetBrightness(float B)
{
	Brightness = B;
	mColorRange[0].R = byte(B);
	mColorRange[0].G = byte(B);
	mColorRange[0].B = byte(B);
	mColorRange[1] = mColorRange[0];
	//return;	
}

state Aquired
{
	simulated function BeginState()
	{
		PlaySound(AquiredSound);
		AmbientSound = none;
		SetTimer(0.4000000, false);
		//return;		
	}

	simulated function Timer()
	{
		GotoState('Cancelled');
		//return;		
	}

	simulated function Tick(float dt)
	{
		// End:0x48
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			SetBrightness(250.0000000);
			mSizeRange[0] = FMin(mSizeRange[0] + (dt * 40.0000000), 16.0000000);
		}
		//return;		
	}

	simulated function SetTargetState(DesignatorBeamEffect.EPainterTargetingState NewState)
	{
		//return;		
	}
	stop;	
}

state Cancelled
{
	simulated function BeginState()
	{
		SetTimer(0.4000000, false);
		//return;		
	}

	simulated function Timer()
	{
		Destroy();
		//return;		
	}

	simulated function Tick(float dt)
	{
		// End:0x5D
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			SetBrightness(FMax(Brightness - (dt * 100.0000000), 40.0000000));
			mSizeRange[0] = FMax(mSizeRange[0] - (dt * 40.0000000), 1.0000000);
		}
		//return;		
	}

	simulated function SetTargetState(DesignatorBeamEffect.EPainterTargetingState NewState)
	{
		//return;		
	}
	stop;	
}

defaultproperties
{
	EffectOffset=(X=-5.0000000,Y=15.0000000,Z=-7.0000000)
	MarkSound=Sound'WeaponSounds.TAGRifle.TAGFireB'
	AquiredSound=Sound'WeaponSounds.TAGRifle.TAGTargetAquired'
	mParticleType=6
	mMaxParticles=3
	mRegenDist=100.0000000
	mSizeRange=8.0000000
	mColorRange[0]=(R=100,G=100,B=100,A=255)
	mColorRange[1]=(R=100,G=100,B=100,A=255)
	mAttenuate=false
	mAttenKa=1.0000000
	bNetTemporary=false
	bReplicateInstigator=true
	RemoteRole=2
	AmbientSound=Sound'WeaponSounds.TAGRifle.TAGFireA'
	Skins[0]=Texture'XEffectMat.Ion.painter_beam'
	Style=6
	SoundVolume=45
	SoundRadius=120.0000000
}
