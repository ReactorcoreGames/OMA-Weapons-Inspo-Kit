class HVCMk9Attachment extends BallisticAttachment;

var Actor Pack;
var Emitter FreeZap;
var bool bDischarge;
var bool bDischargeOld;
var byte ChargePower;
var HVCMk9LightningGun LG;
var Actor Arc1;
var Actor Arc2;
var Actor Arc3;
var Class<BCImpactManager> ImpactManagerAlt;
var() Sound DischargeSound;
var bool bStreamOn;
var HVCMk9_DirectStream StreamEffect;
var HVCMk9_TrackingZapClassic TargetZap;
var Actor ZapTargets[6];
var Vector ZapLures[3];
var byte TargZapCount;
var byte TargZapCountOld;
var byte FreeZapCount;
var byte FreeZapCountOld;
var byte KillZapCount;
var byte KillZapCountOld;
var array<Actor> OldTargets;
var array<Vector> OldLures;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ChargePower, FreeZapCount, 
		KillZapCount, StreamEffect, 
		TargZapCount, ZapLures, 
		ZapTargets, bDischarge;

	// Pos:0x00D
	reliable if(((int(Role) == int(ROLE_Authority)) && bNetOwner) && bNetInitial)
		LG;
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	Pack = Spawn(Class'BallisticProV55.HVCMk9Pack');
	// End:0x38
	if(Instigator != none)
	{
		Instigator.AttachToBone(Pack, 'spine');
	}
	Pack.SetBoneScale(0, 0.0001000, 'Bone03');
	// End:0xF8
	if(int(Level.DetailMode) > int(1))
	{
		// End:0x9A
		if(Arc1 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc1, Class'BallisticProV55.HVCMk9_SideArc', DrawScale, self, 'Arc1');
		}
		// End:0xC9
		if(Arc2 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc2, Class'BallisticProV55.HVCMk9_TopArc', DrawScale, self, 'Arc2');
		}
		// End:0xF8
		if(Arc3 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc3, Class'BallisticProV55.HVCMk9_TopArc', DrawScale, self, 'Arc3');
		}
	}
	//return;	
}

function StartStream()
{
	bStreamOn = true;
	Instigator.bAlwaysRelevant = true;
	bAlwaysRelevant = true;
	// End:0xD8
	if(StreamEffect == none)
	{
		StreamEffect = Spawn(Class'BallisticProV55.HVCMk9_DirectStream', self);
		StreamEffect.SetLocation(GetBoneCoords('tip').Origin);
		StreamEffect.SetBase(self);
		// End:0x9F
		if(HVCMk9LightningGun(Instigator.Weapon) != none)
		{
			HVCMk9LightningGun(Instigator.Weapon).StreamEffect = StreamEffect;
		}
		StreamEffect.Instigator = Instigator;
		StreamEffect.GunAttachment = self;
		StreamEffect.UpdateEndpoint();
		StartMuzzleZap();
	}
	//return;	
}

function EndStream()
{
	bStreamOn = false;
	Instigator.bAlwaysRelevant = Instigator.default.bAlwaysRelevant;
	bAlwaysRelevant = false;
	// End:0x67
	if(StreamEffect != none)
	{
		StreamEffect.bTearOff = true;
		StreamEffect.Kill();
		StreamEffect = none;
		StopMuzzleZap();
	}
	//return;	
}

simulated function ClientReceiveTargets()
{
	local int i;
	local array<Actor> Ts;
	local array<Vector> VS;

	i = 0;
	J0x07:

	// End:0x46 [Loop If]
	if(i < 6)
	{
		// End:0x3C
		if(ZapTargets[i] != none)
		{
			Ts[Ts.Length] = ZapTargets[i];
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x4D:

	// End:0x98 [Loop If]
	if(i < 3)
	{
		// End:0x8E
		if(ZapLures[i] != vect(0.0000000, 0.0000000, 0.0000000))
		{
			VS[VS.Length] = ZapLures[i];
		}
		i++;
		// [Loop Continue]
		goto J0x4D;
	}
	SetTargetZap(Ts, VS);
	//return;	
}

function ServerSendTargets(array<Actor> Ts, array<Vector> VS)
{
	local int i;

	// End:0x6B
	if(Ts.Length == OldTargets.Length)
	{
		i = 0;
		J0x18:

		// End:0x50 [Loop If]
		if(i < Ts.Length)
		{
			// End:0x46
			if(Ts[i] != OldTargets[i])
			{
				// [Explicit Break]
				goto J0x50;
			}
			i++;
			// [Loop Continue]
			goto J0x18;
		}
		J0x50:

		// End:0x6B
		if(i >= Ts.Length)
		{
			i = 666;
		}
	}
	// End:0xE1
	if(i != 666)
	{
		i = 0;
		J0x81:

		// End:0xE1 [Loop If]
		if(i < 6)
		{
			// End:0xC0
			if((i >= Ts.Length) || Ts[i] == none)
			{
				ZapTargets[i] = none;
				// [Explicit Continue]
				goto J0xD7;
			}
			ZapTargets[i] = Ts[i];
			J0xD7:

			i++;
			// [Loop Continue]
			goto J0x81;
		}
	}
	i = 0;
	// End:0x153
	if(VS.Length == OldLures.Length)
	{
		i = 0;
		J0x100:

		// End:0x138 [Loop If]
		if(i < VS.Length)
		{
			// End:0x12E
			if(VS[i] != OldLures[i])
			{
				// [Explicit Break]
				goto J0x138;
			}
			i++;
			// [Loop Continue]
			goto J0x100;
		}
		J0x138:

		// End:0x153
		if(i >= VS.Length)
		{
			i = 666;
		}
	}
	// End:0x1E1
	if(i != 666)
	{
		i = 0;
		J0x169:

		// End:0x1E1 [Loop If]
		if(i < 3)
		{
			// End:0x1C0
			if((i >= VS.Length) || VS[i] == vect(0.0000000, 0.0000000, 0.0000000))
			{
				ZapLures[i] = vect(0.0000000, 0.0000000, 0.0000000);
				// [Explicit Continue]
				goto J0x1D7;
			}
			ZapLures[i] = VS[i];
			J0x1D7:

			i++;
			// [Loop Continue]
			goto J0x169;
		}
	}
	OldTargets = Ts;
	OldLures = VS;
	TargZapCount++;
	//return;	
}

simulated function SetTargetZap(array<Actor> Ts, array<Vector> VS)
{
	// End:0x44
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		ServerSendTargets(Ts, VS);
	}
	// End:0x5F
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	xPawn(Instigator).StartFiring(bHeavy, true);
	StartMuzzleZap();
	KillFreeZap();
	// End:0xDB
	if(TargetZap == none)
	{
		TargetZap = Spawn(Class'BallisticProV55.HVCMk9_TrackingZapClassic', self);
		AttachToBone(TargetZap, 'tip');
		TargetZap.SetTargets(Ts, VS);
		TargetZap.UpdateTargets();		
	}
	else
	{
		TargetZap.SetTargets(Ts, VS);
	}
	// End:0x133
	if((int(Level.NetMode) == int(NM_Client)) && LG != none)
	{
		LG.SetTargetZap(Ts, VS);
	}
	//return;	
}

simulated function SetFreeZap()
{
	// End:0x3B
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		FreeZapCount++;
	}
	// End:0x56
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	xPawn(Instigator).StartFiring(bHeavy, true);
	StartMuzzleZap();
	KillTargetZap();
	// End:0xAD
	if(FreeZap == none)
	{
		FreeZap = Spawn(Class'BallisticProV55.HVCMk9_FreeZap', self);
		UpdateFreeZap();
		AttachToBone(FreeZap, 'tip');
	}
	// End:0xE2
	if((int(Level.NetMode) == int(NM_Client)) && LG != none)
	{
		LG.SetFreeZap();
	}
	//return;	
}

simulated function UpdateFreeZap()
{
	local Vector End, X, Y, Z;

	// End:0x28A
	if(FreeZap != none)
	{
		GetAxes(Instigator.GetViewRotation(), X, Y, Z);
		End = X * float(1000);
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(End, End);
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.X.Min -= (float(500) * Abs(X.Z));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.X.Max += (float(500) * Abs(X.Z));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.Y.Min -= (float(500) * Abs(X.X));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.Y.Max += (float(500) * Abs(X.X));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.Z.Min -= (float(500) * (float(1) - Abs(X.Z)));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.Z.Max += (float(500) * (float(1) - Abs(X.Z)));
		BeamEmitter(FreeZap.Emitters[2]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(End + vect(100.0000000, 100.0000000, 100.0000000), End - vect(100.0000000, 100.0000000, 100.0000000));
	}
	//return;	
}

simulated function KillZap()
{
	// End:0x17
	if(int(Role) == int(ROLE_Authority))
	{
		KillZapCount++;
	}
	// End:0x32
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	xPawn(Instigator).StopFiring();
	StopMuzzleZap();
	KillTargetZap();
	KillFreeZap();
	// End:0x8D
	if((int(Level.NetMode) == int(NM_Client)) && LG != none)
	{
		LG.KillZap();
	}
	//return;	
}

simulated function KillTargetZap()
{
	OldTargets.Length = 0;
	// End:0x38
	if(TargetZap != none)
	{
		TargetZap.KillFlashes();
		TargetZap.Kill();
		TargetZap = none;
	}
	//return;	
}

simulated function KillFreeZap()
{
	// End:0x21
	if(FreeZap != none)
	{
		FreeZap.Kill();
		FreeZap = none;
	}
	//return;	
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	super(Actor).SetOverlayMaterial(mat, Time, bOverride);
	// End:0x40
	if(Pack != none)
	{
		Pack.SetOverlayMaterial(mat, Time, bOverride);
	}
	//return;	
}

simulated function Hide(bool NewbHidden)
{
	super(xWeaponAttachment).Hide(NewbHidden);
	// End:0x2D
	if(Pack != none)
	{
		Pack.bHidden = NewbHidden;
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x24
	if(bDischarge != bDischargeOld)
	{
		bDischargeOld = bDischarge;
		DoWaterDischarge();
	}
	// End:0x48
	if(int(TargZapCount) != int(TargZapCountOld))
	{
		TargZapCountOld = TargZapCount;
		ClientReceiveTargets();
	}
	// End:0x6C
	if(int(FreeZapCount) != int(FreeZapCountOld))
	{
		FreeZapCountOld = FreeZapCount;
		SetFreeZap();
	}
	// End:0x90
	if(int(KillZapCount) != int(KillZapCountOld))
	{
		KillZapCountOld = KillZapCount;
		KillZap();
	}
	super.PostNetReceive();
	//return;	
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x38
	if((i != none) && HVCMk9LightningGun(i) != none)
	{
		LG = HVCMk9LightningGun(i);
	}
	//return;	
}

simulated function StartMuzzleZap()
{
	// End:0x36
	if(MuzzleFlash == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, Class'BallisticProV55.HVCMk9MuzzleFlash', DrawScale * FlashScale, self, 'tip');
	}
	//return;	
}

simulated function StopMuzzleZap()
{
	// End:0x26
	if(MuzzleFlash != none)
	{
		Emitter(MuzzleFlash).Kill();
		MuzzleFlash = none;
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Pack != none)
	{
		Pack.Destroy();
	}
	// End:0x31
	if(FreeZap != none)
	{
		FreeZap.Kill();
	}
	// End:0x5A
	if(TargetZap != none)
	{
		TargetZap.KillFlashes();
		TargetZap.Kill();
	}
	// End:0x74
	if(StreamEffect != none)
	{
		StreamEffect.Kill();
	}
	// End:0x8B
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	// End:0xA2
	if(Arc1 != none)
	{
		Arc1.Destroy();
	}
	// End:0xB9
	if(Arc2 != none)
	{
		Arc2.Destroy();
	}
	// End:0xD0
	if(Arc3 != none)
	{
		Arc3.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function DoWaterDischarge()
{
	// End:0x1F
	if(int(Role) == int(ROLE_Authority))
	{
		bDischarge = !bDischarge;
	}
	// End:0x3A
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	Spawn(Class'BallisticProV55.IE_HVCDischarge', Instigator,, Instigator.Location);
	Instigator.PlaySound(DischargeSound, 0, 1.8000000,, 192.0000000, 1.0000000, false);
	//return;	
}

simulated function SpawnTracer(byte Mode, Vector V)
{
	local BCTraceEmitter Tracer;
	local float dist;

	// End:0x0F
	if(int(Mode) == 0)
	{
		return;
	}
	// End:0x96
	if(VSize(V) < float(2))
	{
		V = (Instigator.Location + Instigator.EyePosition()) + (V * float(1400));
		Tracer = Spawn(Class'BallisticProV55.TraceEmitter_HVCRedMiss', self,, GetModeTipLocation(), Rotator(V - (GetModeTipLocation())));
		Tracer.Initialize(dist, float(ChargePower));
		return;
	}
	dist = VSize(V - (GetModeTipLocation()));
	// End:0xFF
	if(dist > float(25))
	{
		Tracer = Spawn(Class'BallisticProV55.TraceEmitter_HVCRedLightning', self,, GetModeTipLocation(), Rotator(V - (GetModeTipLocation())));
		Tracer.Initialize(dist, float(ChargePower) / float(255));
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x23
	if((int(Mode) == 0) && Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		return;
	}
	// End:0x3C
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	SpawnTracer(Mode, mHitLocation);
	// End:0x5E
	if(VSize(mHitLocation) < float(2))
	{
		return;
	}
	// End:0x155
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		// End:0xCD
		if(int(WallPenetrates) != 0)
		{
			WallPenetrates = 0;
			DoWallPenetrate(Mode, Start, mHitLocation);
		}
		Dir = Normal(mHitLocation - Start);
		bTraceWater = true;
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		bTraceWater = false;
		// End:0x152
		if(mHitActor == none)
		{
			HitLocation = mHitLocation;
			mHitNormal = -Dir;
		}		
	}
	else
	{
		HitLocation = mHitLocation;
	}
	// End:0x19E
	if(int(Mode) == 0)
	{
		// End:0x19B
		if(ImpactManager != none)
		{
			ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
		}		
	}
	else
	{
		// End:0x1CC
		if(ImpactManagerAlt != none)
		{
			ImpactManagerAlt.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
		}
	}
	//return;	
}

simulated function Tick(float dt)
{
	super.Tick(dt);
	// End:0x78
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArenaOrTactical())
	{
		// End:0x38
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			return;
		}
		// End:0x75
		if((StreamEffect != none) && !Instigator.IsFirstPerson())
		{
			StreamEffect.SetLocation(GetBoneCoords('tip2').Origin);
		}		
	}
	else
	{
		// End:0x99
		if((Instigator != none) && Instigator.IsFirstPerson())
		{
			return;
		}
		// End:0xE8
		if(TargetZap != none)
		{
			// End:0xD9
			if(TargetZap.Base != self)
			{
				AttachToBone(TargetZap, 'tip');
				TargetZap.bHidden = false;
			}
			TargetZap.UpdateTargets();
		}
		UpdateFreeZap();
	}
	//return;	
}

defaultproperties
{
	ImpactManagerAlt=Class'BallisticProV55.IM_HVCRedLightning'
	DischargeSound=Sound'BW_Core_WeaponSound.LightningGun.LG-WaterDischarge'
	WeaponClass=Class'BallisticProV55.HVCMk9LightningGun'
	AltMuzzleFlashClass=Class'BallisticProV55.HVCMk9RedMuzzleFlash'
	ImpactManager=Class'BallisticProV55.IM_HVCBlueLightning'
	bDoWaterSplash=false
	WeaponLightTime=0.2000000
	FlashScale=2.0000000
	TracerMode=1
	InstantMode=1
	FlashMode=1
	TracerClass=Class'BallisticProV55.TraceEmitter_HVCRedLightning'
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.HVC_TPm'
	DrawScale=0.1500000
}
