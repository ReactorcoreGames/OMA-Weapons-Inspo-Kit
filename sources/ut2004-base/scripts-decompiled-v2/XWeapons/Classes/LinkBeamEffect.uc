class LinkBeamEffect extends xEmitter;

const MAX_CHILDREN = 4;

var Vector StartEffect;
var Vector EndEffect;
var byte Links;
var byte OldLinks;
var byte LinkColor;
var byte OldLinkColor;
var bool bLockedOn;
var bool bHitSomething;
var Pawn LinkedPawn;
var Vector EffectOffset;
var Vector PrevLoc;
var Rotator PrevRot;
var float scorchtime;
var LinkSparks Sparks;
var LinkProtSphere ProtSphere;
var LinkMuzFlashBeam3rd MuzFlash;
var LinkMuzFlashBeam3rd OldMuzFlash;
var int NumChildren;
var LinkBeamChild Child[4];

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
	local int C;

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
	C = 0;
	J0x79:

	// End:0xB2 [Loop If]
	if(C < 4)
	{
		// End:0xA8
		if(Child[C] != none)
		{
			Child[C].Destroy();
		}
		C++;
		// [Loop Continue]
		goto J0x79;
	}
	super(Actor).Destroyed();
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
	return !P.BeyondViewDistance(SpawnLocation, 1000.0000000);
	//return;	
}

simulated function Tick(float dt)
{
	local float LocDiff, RotDiff, WiggleMe, ls;
	local int C, N;
	local Vector BeamDir, HitLocation, HitNormal;
	local Actor HitActor;
	local PlayerController P;

	// End:0x38
	if((int(Role) == int(ROLE_Authority)) && (Instigator == none) || Instigator.Controller == none)
	{
		Destroy();
		return;
	}
	SetBeamLocation();
	BeamDir = SetBeamRotation();
	// End:0x125
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0xA1
		if((Instigator != none) && !Instigator.IsFirstPerson())
		{
			// End:0x9E
			if(MuzFlash == none)
			{
				MuzFlash = Spawn(Class'XEffects.LinkMuzFlashBeam3rd', self);
			}			
		}
		else
		{
			// End:0xB8
			if(MuzFlash != none)
			{
				MuzFlash.Destroy();
			}
		}
		// End:0x125
		if((Sparks == none) && EffectIsRelevant(EndEffect, false))
		{
			P = Level.GetLocalPlayerController();
			// End:0x125
			if((P == Instigator.Controller) || CheckMaxEffectDistance(P, Location))
			{
				Sparks = Spawn(Class'XEffects.LinkSparks', self);
			}
		}
	}
	ls = Class'XWeapons.LinkFire'.default.LinkScale[Min(int(Links), 5)];
	// End:0x57E
	if(((int(Links) != int(OldLinks)) || int(LinkColor) != int(OldLinkColor)) || MuzFlash != OldMuzFlash)
	{
		mSizeRange[0] = default.mSizeRange[0] * ((ls * 0.6000000) + float(1));
		mWaveShift = default.mWaveShift * ((ls * 0.6000000) + float(1));
		NumChildren = Min(int(Links) + 1, 4);
		// End:0x2C7
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			C = 0;
			J0x1F2:

			// End:0x2C7 [Loop If]
			if(C < 4)
			{
				// End:0x29A
				if(((C < NumChildren) && !Level.bDropDetail) && int(Level.DetailMode) != int(0))
				{
					// End:0x264
					if(Child[C] == none)
					{
						Child[C] = Spawn(Class'XWeapons.LinkBeamChild', self);
					}
					Child[C].mSizeRange[0] = 2.0000000 + (4.0000000 * float(NumChildren - C));
					// [Explicit Continue]
					goto J0x2BD;
				}
				// End:0x2BD
				if(Child[C] != none)
				{
					Child[C].Destroy();
				}
				J0x2BD:

				C++;
				// [Loop Continue]
				goto J0x1F2;
			}
		}
		// End:0x353
		if(int(LinkColor) == 0)
		{
			// End:0x31A
			if(int(Links) > 0)
			{
				Skins[0] = FinalBlend'XEffectMat.Link.LinkBeamYellowFB';
				// End:0x30F
				if(MuzFlash != none)
				{
					MuzFlash.Skins[0] = Texture'XEffectMat.Link.link_muz_yellow';
				}
				LightHue = 40;				
			}
			else
			{
				Skins[0] = FinalBlend'XEffectMat.Link.LinkBeamGreenFB';
				// End:0x348
				if(MuzFlash != none)
				{
					MuzFlash.Skins[0] = Texture'XEffectMat.Link.link_muz_green';
				}
				LightHue = 100;
			}			
		}
		else
		{
			// End:0x399
			if(int(LinkColor) == 1)
			{
				Skins[0] = FinalBlend'XEffectMat.Link.LinkBeamRedFB';
				// End:0x38E
				if(MuzFlash != none)
				{
					MuzFlash.Skins[0] = Texture'XEffectMat.Link.link_muz_red';
				}
				LightHue = 0;				
			}
			else
			{
				Skins[0] = FinalBlend'XEffectMat.Link.LinkBeamBlueFB';
				// End:0x3C7
				if(MuzFlash != none)
				{
					MuzFlash.Skins[0] = Texture'XEffectMat.Link.link_muz_blue';
				}
				LightHue = 160;
			}
		}
		// End:0x42F
		if(MuzFlash != none)
		{
			MuzFlash.mSizeRange[0] = MuzFlash.default.mSizeRange[0] * ((ls * 0.5000000) + float(1));
			MuzFlash.mSizeRange[1] = MuzFlash.mSizeRange[0];
		}
		LightBrightness = 180.0000000 + (float(40) * ls);
		LightRadius = 6.0000000 + (float(3) * ls);
		// End:0x4EB
		if(Sparks != none)
		{
			Sparks.SetLinkStatus(int(Links), int(LinkColor) > 0, ls);
			Sparks.bHidden = int(LinkColor) > 0;
			Sparks.LightHue = LightHue;
			Sparks.LightBrightness = LightBrightness;
			Sparks.LightRadius = LightRadius - float(3);
		}
		// End:0x55D
		if((int(LinkColor) > 0) && LinkedPawn != none)
		{
			// End:0x55D
			if((ProtSphere == none) && int(Level.NetMode) != int(NM_DedicatedServer))
			{
				ProtSphere = Spawn(Class'XEffects.LinkProtSphere');
				// End:0x55D
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
	// End:0x5BE
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		bDynamicLight = false;
		LightType = 0;		
	}
	else
	{
		// End:0x5CF
		if(bDynamicLight)
		{
			LightType = 1;
		}
	}
	// End:0x61B
	if(LinkedPawn != none)
	{
		EndEffect = (LinkedPawn.Location + (LinkedPawn.EyeHeight * vect(0.0000000, 0.0000000, 0.5000000))) - (BeamDir * 30.0000000);
	}
	mSpawnVecA = EndEffect;
	mWaveLockEnd = bLockedOn || int(LinkColor) > 0;
	// End:0x68A
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
	C = 0;
	J0x743:

	// End:0x86A [Loop If]
	if(C < NumChildren)
	{
		// End:0x860
		if(Child[C] != none)
		{
			N = C + 1;
			Child[C].SetLocation(Location);
			Child[C].SetRotation(Rotation);
			Child[C].mSpawnVecA = mSpawnVecA;
			Child[C].mWaveShift = mWaveShift * 0.6000000;
			Child[C].mWaveAmplitude = (float(N) * 4.0000000) + (mWaveAmplitude * ((16.0000000 - (float(N) * 4.0000000)) / 16.0000000));
			Child[C].mWaveLockEnd = int(LinkColor) > 0;
			Child[C].Skins[0] = Skins[0];
		}
		C++;
		// [Loop Continue]
		goto J0x743;
	}
	// End:0x915
	if(Sparks != none)
	{
		Sparks.SetLocation(EndEffect - (BeamDir * 10.0000000));
		// End:0x8B1
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
	// End:0x9D2
	if((int(LinkColor) > 0) && LinkedPawn != none)
	{
		// End:0x9CF
		if(ProtSphere != none)
		{
			ProtSphere.SetLocation(EndEffect);
			ProtSphere.SetRotation(Rotation);
			ProtSphere.bHidden = false;
			// End:0x998
			if(LinkedPawn.IsFirstPerson())
			{
				ProtSphere.mSizeRange[0] = 20.0000000;				
			}
			else
			{
				ProtSphere.mSizeRange[0] = 35.0000000;
			}
			ProtSphere.mSizeRange[1] = ProtSphere.mSizeRange[0];
		}		
	}
	else
	{
		// End:0x9EE
		if(ProtSphere != none)
		{
			ProtSphere.bHidden = true;
		}
	}
	// End:0xAB6
	if((bHitSomething && int(Level.NetMode) != int(NM_DedicatedServer)) && (Level.TimeSeconds - scorchtime) > 0.0700000)
	{
		scorchtime = Level.TimeSeconds;
		HitActor = Trace(HitLocation, HitNormal, EndEffect + (float(100) * BeamDir), EndEffect - (float(100) * BeamDir), true);
		// End:0xAB6
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
	mMaxParticles=3
	mRegenDist=65.0000000
	mSpinRange=45000.0000000
	mSizeRange=11.0000000
	mColorRange[0]=(R=240,G=240,B=240,A=255)
	mColorRange[1]=(R=240,G=240,B=240,A=255)
	mAttenuate=false
	mAttenKa=0.0000000
	mWaveFrequency=0.0600000
	mWaveAmplitude=8.0000000
	mWaveShift=100000.0000000
	mBendStrength=3.0000000
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
	Skins[0]=FinalBlend'XEffectMat.Link.LinkBeamGreenFB'
	Style=6
}
