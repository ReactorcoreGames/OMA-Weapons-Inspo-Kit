class XM20Attachment extends BallisticAttachment;

var byte CurrentTracerMode;
var Class<BCTraceEmitter> TracerClasses[2];
var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var Vector PreviousHitLoc;
var Emitter LaserDot;
var Vector SpawnOffset;
var bool bBigLaser;
var ForceRing ForceRing3rd;
var XM20ShieldEffect3rd XM20ShieldEffect3rd;
var BallisticWeapon myWeap;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		XM20ShieldEffect3rd;

	// Pos:0x018
	reliable if(int(Role) == int(ROLE_Authority))
		CurrentTracerMode, bLaserOn;

	// Pos:0x025
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot, bBigLaser;
}

simulated function KillLaserDot()
{
	// End:0x32
	if(LaserDot != none)
	{
		LaserDot.bHidden = false;
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function SpawnLaserDot(Vector loc)
{
	// End:0x31
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BWBP_SKC_Pro.IE_XM20Impact',,, loc);
		LaserDot.bHidden = false;
	}
	//return;	
}

simulated function Tick(float dt)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator X;
	local Actor Other;

	super.Tick(dt);
	// End:0x5A
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && myWeap != none)
	{
		LaserRot = Instigator.GetViewRotation() + myWeap.GetFireRot();
	}
	// End:0x75
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x95
	if(Laser == none)
	{
		Laser = Spawn(Class'BWBP_SKC_Pro.LaserActor_XM20Red',,, Location);
	}
	// End:0xB3
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x130
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x11A
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		// End:0x12B
		if(LaserDot != none)
		{
			KillLaserDot();
		}
		return;		
	}
	else
	{
		// End:0x153
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x186
	if(Instigator != none)
	{
		Start = Instigator.Location + Instigator.EyePosition();		
	}
	else
	{
		Start = Location;
	}
	X = LaserRot;
	loc = GetTipLocation();
	// End:0x1CF
	if(AIController(Instigator.Controller) != none)
	{
		HitLocation = mHitLocation;		
	}
	else
	{
		End = Start + (Vector(X) * float(3000));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x220
		if(Other == none)
		{
			HitLocation = End;
		}
	}
	// End:0x246
	if((LaserDot == none) && Other != none)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		// End:0x264
		if((LaserDot != none) && Other == none)
		{
			KillLaserDot();
		}
	}
	// End:0x293
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		LaserDot.SetRotation(Rotator(HitNormal));
	}
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(HitLocation - loc));
	Scale3D.X = VSize(HitLocation - Laser.Location) / float(128);
	// End:0x312
	if(bBigLaser)
	{
		Scale3D.Y = 9.5000000;
		Scale3D.Z = 9.5000000;		
	}
	else
	{
		Scale3D.Y = 4.5000000;
		Scale3D.Z = 4.5000000;
	}
	Laser.SetDrawScale3D(Scale3D);
	//return;	
}

simulated function Vector GetTipLocation()
{
	// End:0x60
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return Instigator.Weapon.GetEffectStart();
	}
	return GetBoneCoords('tip').Origin;
	//return;	
}

simulated function Destroyed()
{
	local int i;

	// End:0x17
	if(XM20ShieldEffect3rd != none)
	{
		XM20ShieldEffect3rd.Destroy();
	}
	// End:0x2E
	if(ForceRing3rd != none)
	{
		ForceRing3rd.Destroy();
	}
	// End:0xB0
	if((Instigator != none) && Level.TimeSeconds <= TrackEndTime)
	{
		i = 0;
		J0x5A:

		// End:0xB0 [Loop If]
		if(i < (GetTrackCount(ActiveTrack)))
		{
			Instigator.SetBoneRotation(GetTrack(ActiveTrack, i).Bone, rot(0, 0, 0), 0, 1.0000000);
			i++;
			// [Loop Continue]
			goto J0x5A;
		}
	}
	// End:0xC7
	if(Laser != none)
	{
		Laser.Destroy();
	}
	KillLaserDot();
	super.Destroyed();
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	// End:0x3C
	if(int(Mode) == 1)
	{
		// End:0x26
		if(VSize(PreviousHitLoc - mHitLocation) < float(2))
		{
			return;
		}
		PreviousHitLoc = mHitLocation;
		ImpactManager = Class'BWBP_SKC_Pro.IM_XM20Laser';
	}
	super.InstantFireEffects(Mode);
	//return;	
}

simulated function SpawnTracer(byte Mode, Vector V)
{
	local BCTraceEmitter Tracer;
	local Vector TipLoc, WLoc, WNorm;
	local float dist;
	local bool bThisShot;

	// End:0x33
	if((int(Level.DetailMode) < int(1)) || int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) == 0)
	{
		return;
	}
	TipLoc = GetModeTipLocation(Mode);
	dist = VSize(V - TipLoc);
	// End:0x7B
	if(ModeInfos[int(Mode)].TracerMix == 0)
	{
		bThisShot = true;		
	}
	else
	{
		ModeInfos[int(Mode)].TracerCounter++;
		// End:0xEF
		if(TracerMix < 0)
		{
			// End:0xE4
			if(ModeInfos[int(Mode)].TracerCounter >= -ModeInfos[int(Mode)].TracerMix)
			{
				ModeInfos[int(Mode)].TracerCounter = 0;
				bThisShot = false;				
			}
			else
			{
				bThisShot = true;
			}			
		}
		else
		{
			// End:0x134
			if(ModeInfos[int(Mode)].TracerCounter >= ModeInfos[int(Mode)].TracerMix)
			{
				ModeInfos[int(Mode)].TracerCounter = 0;
				bThisShot = true;
			}
		}
	}
	// End:0x1F9
	if(((ModeInfos[int(Mode)].bTracer && TracerClasses[int(CurrentTracerMode)] != none) && bThisShot) && (ModeInfos[int(Mode)].TracerChance >= float(1)) || FRand() < ModeInfos[int(Mode)].TracerChance)
	{
		// End:0x1DA
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClasses[int(CurrentTracerMode)], self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0x1F9
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x2F7
	if(((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && ModeInfos[int(Mode)].WaterTracerClass != none) && ModeInfos[int(Mode)].bWaterTracer)
	{
		// End:0x2CF
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(ModeInfos[int(Mode)].WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x2F7
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x2B
	if(BallisticWeapon(i) != none)
	{
		myWeap = BallisticWeapon(i);
	}
	// End:0x64
	if((XM20Carbine(i) != none) && XM20Carbine(i).bIsPrototype)
	{
		CurrentTracerMode = 1;
		bBigLaser = true;
	}
	// End:0xDE
	if(((Instigator.PlayerReplicationInfo == none) || Instigator.PlayerReplicationInfo.Team == none) || Instigator.PlayerReplicationInfo.Team.TeamIndex > 1)
	{
		XM20ShieldEffect3rd = Spawn(Class'BWBP_SKC_Pro.XM20ShieldEffect3rd', i.Instigator);		
	}
	else
	{
		// End:0x123
		if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 0)
		{
			XM20ShieldEffect3rd = Spawn(Class'BWBP_SKC_Pro.XM20ShieldEffect3rdRed', i.Instigator);			
		}
		else
		{
			// End:0x165
			if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 1)
			{
				XM20ShieldEffect3rd = Spawn(Class'BWBP_SKC_Pro.XM20ShieldEffect3rd', i.Instigator);
			}
		}
	}
	XM20ShieldEffect3rd.SetBase(i.Instigator);
	//return;	
}

simulated event ThirdPersonEffects()
{
	// End:0x5D
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		InstantFireEffects(FiringMode);
		FlashMuzzleFlash(FiringMode);
		FlashWeaponLight(FiringMode);
		PlayPawnFiring(FiringMode);
		EjectBrass(FiringMode);
	}
	super.ThirdPersonEffects();
	//return;	
}

function SetBrightness(int B, bool Hit)
{
	// End:0x25
	if(XM20ShieldEffect3rd != none)
	{
		XM20ShieldEffect3rd.SetBrightness(B, Hit);
	}
	//return;	
}

simulated function EjectBrass(byte Mode)
{
	//return;	
}

defaultproperties
{
	TracerClasses[0]=Class'BWBP_SKC_Pro.TraceEmitter_XM20Laser'
	TracerClasses[1]=Class'BWBP_SKC_Pro.TraceEmitter_XM20Laser_P'
	WeaponClass=Class'BWBP_SKC_Pro.XM20Carbine'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.XM20FlashEmitter'
	ImpactManager=Class'BWBP_SKC_Pro.IM_XM20Laser'
	FlashScale=0.7500000
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_XM20Laser'
	FlyBySound=(Sound=Sound'BWBP_SKC_Sounds.XM20.XM20-FlyBy',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.7250000
	CockAnimRate=2.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.XM20_TPm'
	RelativeLocation=(X=1.0000000,Y=0.0000000,Z=5.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.1500000
}
