class ProtonStreamEffectChild extends xEmitter;

var Vector StartEffect;
var Vector EndEffect;
var byte Links;
var byte OldLinks;
var byte LinkColor;
var byte OldLinkColor;
var bool bLockedOn;
var bool bHitSomething;
var bool bAltColor;
var Actor LinkedPawn;
var Vector EffectOffset;
var Vector PrevLoc;
var Rotator PrevRot;
var float scorchtime;
var LinkSparks Sparks;
var LinkProtSphere ProtSphere;
var LinkMuzFlashBeam3rd MuzFlash;
var LinkMuzFlashBeam3rd OldMuzFlash;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		LinkColor, LinkedPawn, 
		Links, bHitSomething, 
		bLockedOn;

	// Pos:0x00D
	reliable if((int(Role) == int(ROLE_Authority)) && (!bNetOwner || bDemoRecording) || bRepClientDemo)
		EndEffect, StartEffect;
}

simulated function Destroyed()
{
	// End:0x3F
	if(Sparks != none)
	{
		Sparks.SetTimer(0.0000000, false);
		Sparks.mRegen = false;
		Sparks.LightType = 0;
	}
	// End:0x5B
	if(MuzFlash != none)
	{
		MuzFlash.mRegen = false;
	}
	// End:0x72
	if(ProtSphere != none)
	{
		ProtSphere.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function SetColor()
{
	// End:0x1B
	if(!bAltColor)
	{
		Skins[0] = TexPanner'BWBP_OP_Tex.ProtonPack.ProtonBluePanner';		
	}
	else
	{
		Skins[0] = TexPanner'BWBP_OP_Tex.ProtonPack.ProtonRedPanner';
	}
	//return;	
}

simulated function SetBeamLocation()
{
	local xWeaponAttachment Attachment;

	// End:0x56
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		StartEffect = Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000));
		SetLocation(StartEffect);
		return;
	}
	// End:0x6C
	if(Instigator == none)
	{
		SetLocation(StartEffect);		
	}
	else
	{
		// End:0x121
		if(Instigator.IsFirstPerson())
		{
			// End:0xE2
			if(((Instigator.Weapon == none) || Instigator.Weapon.WeaponCentered()) || Instigator.Weapon.Instigator == none)
			{
				SetLocation(Instigator.Location);				
			}
			else
			{
				SetLocation(Instigator.Weapon.GetEffectStart() - (float(60) * Vector(Instigator.Controller.Rotation)));
			}			
		}
		else
		{
			Attachment = xPawn(Instigator).WeaponAttachment;
			// End:0x182
			if((Attachment != none) && (Level.TimeSeconds - Attachment.LastRenderTime) < float(1))
			{
				SetLocation(Attachment.GetTipLocation());				
			}
			else
			{
				SetLocation(Instigator.Location + (Normal(EndEffect - Instigator.Location) * 25.0000000));
			}
		}
		// End:0x1CE
		if(int(Role) == int(ROLE_Authority))
		{
			StartEffect = Location;
		}
	}
	//return;	
}

simulated function Vector SetBeamRotation()
{
	// End:0x44
	if((Instigator != none) && PlayerController(Instigator.Controller) != none)
	{
		SetRotation(Instigator.Controller.GetViewRotation());		
	}
	else
	{
		SetRotation(Rotator(EndEffect - Location));
	}
	return Normal(EndEffect - Location);
	//return;	
}

simulated function bool CheckMaxEffectDistance(PlayerController P, Vector SpawnLocation)
{
	return !P.BeyondViewDistance(SpawnLocation, 1600.0000000);
	//return;	
}

simulated function Tick(float dt)
{
	local float LocDiff, RotDiff, WiggleMe, ls;
	local Vector BeamDir, HitLocation, HitNormal, TargetHeightOffset;
	local Actor HitActor;
	local PlayerController P;

	// End:0x38
	if((int(Role) == int(ROLE_Authority)) && (Instigator == none) || Instigator.Controller == none)
	{
		Destroy();
		return;
	}
	SetColor();
	SetBeamLocation();
	BeamDir = SetBeamRotation();
	// End:0xD6
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0xD6
		if((Sparks == none) && EffectIsRelevant(EndEffect, false))
		{
			P = Level.GetLocalPlayerController();
			// End:0xD6
			if((P == Instigator.Controller) || CheckMaxEffectDistance(P, Location))
			{
				Sparks = Spawn(Class'XEffects.LinkSparks', self);
			}
		}
	}
	ls = Class'XWeapons.LinkFire'.default.LinkScale[Min(int(Links), 5)];
	// End:0x31E
	if(((int(Links) != int(OldLinks)) || int(LinkColor) != int(OldLinkColor)) || MuzFlash != OldMuzFlash)
	{
		mSizeRange[0] = default.mSizeRange[0] * ((ls * 0.6000000) + float(1));
		mWaveShift = default.mWaveShift * ((ls * 0.6000000) + float(1));
		// End:0x1CF
		if(MuzFlash != none)
		{
			MuzFlash.mSizeRange[0] = MuzFlash.default.mSizeRange[0] * ((ls * 0.5000000) + float(1));
			MuzFlash.mSizeRange[1] = MuzFlash.mSizeRange[0];
		}
		LightBrightness = 180.0000000 + (float(40) * ls);
		LightRadius = 6.0000000 + (float(3) * ls);
		// End:0x28B
		if(Sparks != none)
		{
			Sparks.SetLinkStatus(int(Links), int(LinkColor) > 0, ls);
			Sparks.bHidden = int(LinkColor) > 0;
			Sparks.LightHue = LightHue;
			Sparks.LightBrightness = LightBrightness;
			Sparks.LightRadius = LightRadius - float(3);
		}
		// End:0x2FD
		if((int(LinkColor) > 0) && LinkedPawn != none)
		{
			// End:0x2FD
			if((ProtSphere == none) && int(Level.NetMode) != int(NM_DedicatedServer))
			{
				ProtSphere = Spawn(Class'XEffects.LinkProtSphere');
				// End:0x2FD
				if(int(LinkColor) == 2)
				{
					ProtSphere.Skins[0] = Texture'XEffectMat.Link.link_muz_blue';
				}
			}
		}
		OldLinks = Links;
		OldLinkColor = LinkColor;
		OldMuzFlash = MuzFlash;
	}
	// End:0x35E
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		bDynamicLight = false;
		LightType = 0;		
	}
	else
	{
		// End:0x36F
		if(bDynamicLight)
		{
			LightType = 1;
		}
	}
	// End:0x3C3
	if(LinkedPawn != none)
	{
		TargetHeightOffset.Z = LinkedPawn.CollisionHeight * 0.5000000;
		EndEffect = (LinkedPawn.Location + TargetHeightOffset) - (BeamDir * 30.0000000);
	}
	mSpawnVecA = EndEffect;
	mWaveLockEnd = bLockedOn || int(LinkColor) > 0;
	// End:0x432
	if(bLockedOn || int(LinkColor) > 0)
	{
		mWaveAmplitude = FMax(0.0000000, mWaveAmplitude - (((mWaveAmplitude + float(5)) * 4.0000000) * dt));		
	}
	else
	{
		LocDiff = VSize((Location - PrevLoc) * vect(1.0000000, 1.0000000, 5.0000000));
		RotDiff = VSize(Vector(Rotation) - Vector(PrevRot));
		WiggleMe = FMax(LocDiff * 0.0200000, RotDiff * 4.0000000);
		mWaveAmplitude = FMax(1.0000000, mWaveAmplitude - ((mWaveAmplitude * 1.0000000) * dt));
		mWaveAmplitude = FMin(16.0000000, mWaveAmplitude + WiggleMe);
	}
	PrevLoc = Location;
	PrevRot = Rotation;
	// End:0x58F
	if(Sparks != none)
	{
		Sparks.SetLocation(EndEffect - (BeamDir * 10.0000000));
		// End:0x52B
		if(bHitSomething)
		{
			Sparks.SetRotation(Rotation);			
		}
		else
		{
			Sparks.SetRotation(Rotator(-BeamDir));
		}
		Sparks.mRegenRange[0] = Sparks.DesiredRegen;
		Sparks.mRegenRange[1] = Sparks.DesiredRegen;
		Sparks.bDynamicLight = true;
	}
	// End:0x621
	if((int(LinkColor) > 0) && LinkedPawn != none)
	{
		// End:0x61E
		if(ProtSphere != none)
		{
			ProtSphere.SetLocation(EndEffect);
			ProtSphere.SetRotation(Rotation);
			ProtSphere.bHidden = false;
			ProtSphere.mSizeRange[0] = 35.0000000;
			ProtSphere.mSizeRange[1] = ProtSphere.mSizeRange[0];
		}		
	}
	else
	{
		// End:0x63D
		if(ProtSphere != none)
		{
			ProtSphere.bHidden = true;
		}
	}
	// End:0x705
	if((bHitSomething && int(Level.NetMode) != int(NM_DedicatedServer)) && (Level.TimeSeconds - scorchtime) > 0.0700000)
	{
		scorchtime = Level.TimeSeconds;
		HitActor = Trace(HitLocation, HitNormal, EndEffect + (float(100) * BeamDir), EndEffect - (float(100) * BeamDir), true);
		// End:0x705
		if((HitActor != none) && HitActor.bWorldGeometry)
		{
			Spawn(Class'XEffects.LinkScorch',,, HitLocation, Rotator(-HitNormal));
		}
	}
	//return;	
}

defaultproperties
{
	EffectOffset=(X=22.0000000,Y=11.0000000,Z=1.4000000)
	mParticleType=6
	mMaxParticles=2
	mRegenDist=65.0000000
	mSpinRange=45000.0000000
	mSizeRange=2.0000000
	mColorRange[0]=(R=80,G=80,B=80,A=255)
	mColorRange[1]=(R=80,G=80,B=80,A=255)
	mAttenuate=false
	mAttenKa=0.0100000
	mWaveFrequency=1.0000000
	mWaveAmplitude=20.0000000
	mWaveShift=200000.0000000
	mBendStrength=8.0000000
	mWaveLockEnd=true
	LightType=1
	LightHue=100
	LightSaturation=100
	LightBrightness=255.0000000
	LightRadius=4.0000000
	bDynamicLight=true
	bNetTemporary=false
	bReplicateInstigator=true
	RemoteRole=2
	Skins[0]=TexPanner'BWBP_OP_Tex.ProtonPack.ProtonBluePanner'
	Style=6
}
