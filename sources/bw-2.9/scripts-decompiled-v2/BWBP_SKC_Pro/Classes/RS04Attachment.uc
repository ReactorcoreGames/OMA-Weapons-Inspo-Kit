class RS04Attachment extends HandgunAttachment;

var bool bHasKnife;
var bool bHasFlash;
var bool bLightsOn;
var bool bLightsOnOld;
var Projector FlashLightProj;
var Emitter FlashLightEmitter;
var BallisticWeapon myWeap;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bHasFlash, bHasKnife, 
		bLightsOn;
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x2B
	if(BallisticWeapon(i) != none)
	{
		myWeap = BallisticWeapon(i);
	}
	// End:0x5C
	if((RS04Pistol(i) != none) && RS04Pistol(i).bHasKnife)
	{
		bHasKnife = true;
	}
	// End:0x8D
	if((RS04Pistol(i) != none) && RS04Pistol(i).bHasFlash)
	{
		bHasFlash = true;
	}
	//return;	
}

simulated function Hide(bool NewbHidden)
{
	super.Hide(NewbHidden);
	SwitchFlashLight();
	// End:0x3B
	if(NewbHidden)
	{
		KillProjector();
		// End:0x38
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.Destroy();
		}		
	}
	else
	{
		// End:0x4A
		if(bLightsOn)
		{
			SwitchFlashLight();
		}
	}
	//return;	
}

simulated event PostNetReceive()
{
	super(BallisticAttachment).PostNetReceive();
	// End:0x21
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	//return;	
}

simulated function StartProjector()
{
	// End:0x20
	if(FlashLightProj == none)
	{
		FlashLightProj = Spawn(Class'BallisticProV55.MRS138TorchProjector', self,, Location);
	}
	AttachToBone(FlashLightProj, 'tip2');
	FlashLightProj.SetRelativeLocation(vect(-32.0000000, 0.0000000, 0.0000000));
	//return;	
}

simulated function KillProjector()
{
	// End:0x1E
	if(FlashLightProj != none)
	{
		FlashLightProj.Destroy();
		FlashLightProj = none;
	}
	//return;	
}

simulated function SwitchFlashLight()
{
	// End:0x91
	if(bLightsOn)
	{
		// End:0x74
		if(FlashLightEmitter == none)
		{
			FlashLightEmitter = Spawn(Class'BallisticProV55.MRS138TorchEffect', self,, Location);
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(FlashLightEmitter, DrawScale);
			AttachToBone(FlashLightEmitter, 'tip2');
			FlashLightEmitter.bHidden = false;
			FlashLightEmitter.bCorona = true;
		}
		// End:0x8E
		if(!Instigator.IsFirstPerson())
		{
			StartProjector();
		}		
	}
	else
	{
		FlashLightEmitter.Destroy();
		KillProjector();
	}
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x26
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x4A
	if(bLightsOn != bLightsOnOld)
	{
		SwitchFlashLight();
		bLightsOnOld = bLightsOn;
	}
	// End:0x57
	if(!bLightsOn)
	{
		return;
	}
	// End:0xA2
	if(Instigator.IsFirstPerson())
	{
		KillProjector();
		// End:0x9F
		if((FlashLightEmitter != none) && FlashLightEmitter.bCorona)
		{
			FlashLightEmitter.bCorona = false;
		}		
	}
	else
	{
		// End:0xB3
		if(FlashLightProj == none)
		{
			StartProjector();
		}
		// End:0xE5
		if((FlashLightEmitter != none) && !FlashLightEmitter.bCorona)
		{
			FlashLightEmitter.bCorona = true;
		}
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(FlashLightEmitter != none)
	{
		FlashLightEmitter.Destroy();
	}
	KillProjector();
	super.Destroyed();
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	// End:0x21
	if((int(FiringMode) != 0) && bHasKnife)
	{
		MeleeFireEffects();		
	}
	else
	{
		// End:0x42
		if((int(FiringMode) != 0) && bHasFlash)
		{
			FlashFireEffects();			
		}
		else
		{
			super(BallisticAttachment).InstantFireEffects(FiringMode);
		}
	}
	//return;	
}

simulated function FlashFireEffects()
{
	local Vector L, Dir;

	L = Instigator.Location + Instigator.EyePosition();
	Dir = Normal(mHitLocation - L);
	// End:0x9D
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		Spawn(Class'BallisticProV55.AM67FlashProjector', Instigator,, L + (Dir * float(25)), Rotator(Dir));		
	}
	else
	{
		Spawn(Class'BallisticProV55.AM67FlashProjector', Instigator,, GetTipLocation(), Rotator(Dir));
	}
	//return;	
}

simulated function MeleeFireEffects()
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x19
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x110
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0xD3
		if((mHitActor == none) || !mHitActor.bWorldGeometry)
		{
			return;
		}
		// End:0xF7
		if(HitMat == none)
		{
			mHitSurf = int(mHitActor.SurfaceType);			
		}
		else
		{
			mHitSurf = int(HitMat.SurfaceType);
		}		
	}
	else
	{
		HitLocation = mHitLocation;
	}
	// End:0x162
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x193
	if(!bHasKnife)
	{
		Class'BallisticProV55.IM_GunHit'.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);		
	}
	else
	{
		Class'BallisticProV55.IM_Knife'.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	local Rotator R;
	local float DF;

	// End:0x3C
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x14C
	if(((int(Mode) != 0) && bHasFlash) && AltMuzzleFlashClass != none)
	{
		// End:0x97
		if(AltMuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
		}
		Emitter(AltMuzzleFlash).Emitters[0].StartSizeRange.X.Min = ((200.0000000 + (DF * float(600))) * DrawScale) * FlashScale;
		Emitter(AltMuzzleFlash).Emitters[0].StartSizeRange.X.Max = Emitter(AltMuzzleFlash).Emitters[0].StartSizeRange.X.Min;
		AltMuzzleFlash.Trigger(self, Instigator);		
	}
	else
	{
		// End:0x1D0
		if((int(Mode) == 0) && MuzzleFlashClass != none)
		{
			// End:0x19C
			if(MuzzleFlash == none)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
			}
			MuzzleFlash.Trigger(self, Instigator);
			// End:0x1D0
			if(bRandomFlashRoll)
			{
				SetBoneRotation(FlashBone, R, 0, 1.0000000);
			}
		}
	}
	//return;	
}

defaultproperties
{
	SlavePivot=(Pitch=0,Yaw=32768,Roll=32768)
	WeaponClass=Class'BWBP_SKC_Pro.RS04Pistol'
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	InstantMode=2
	TrackAnimMode=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	TracerMix=-3
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=1.4000000
	CockAnimRate=0.9500000
	bRapidFire=true
	bAltRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.RS04_TPm'
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.2100000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-2.0000000)
}
