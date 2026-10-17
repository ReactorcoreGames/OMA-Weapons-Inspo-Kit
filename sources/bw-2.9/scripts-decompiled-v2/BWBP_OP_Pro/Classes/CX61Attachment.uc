class CX61Attachment extends BallisticAttachment;

struct SingeSpot
{
	var Vector loc;
	var float Time;
};

var RX22ASpray Flame;
var CX61GasSpray GasSpray;
var byte FlameCount;
var byte FlameCountOld;
var byte SprayCount;
var byte SprayCountOld;
var CX61FireHit FlameHitFX;
var array<SingeSpot> SingeSpots;
var FullSound AltFlyBySound;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		FlameCount, SprayCount;
}

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x35
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		TracerClass = Class'BWBP_OP_Pro.TraceEmitter_CX61Spectre';
		TracerChance = 1.0000000;
		TracerMix = 0;
	}
	//return;	
}

simulated function Vector GetAltTipLocation()
{
	return GetBoneCoords('tip2').Origin;
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x24
	if(int(FlameCount) != int(FlameCountOld))
	{
		FlameCountOld = FlameCount;
		FlameFireEffects();
	}
	// End:0x48
	if(int(SprayCount) != int(SprayCountOld))
	{
		SprayCountOld = SprayCount;
		GasEffects();
	}
	super.PostNetReceive();
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	// End:0x0F
	if(int(Mode) != 0)
	{
		return;
	}
	super.FlashMuzzleFlash(Mode);
	//return;	
}

simulated event Timer()
{
	super.Timer();
	StopSpray();
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x33
	if(int(Mode) == 0)
	{
		super.InstantFireEffects(Mode);
	}
	//return;	
}

simulated function FlyByEffects(byte Mode, Vector HitLoc)
{
	local Vector TipLoc, ViewLoc, PointX, Dir;
	local float DotResult, XDist;

	// End:0x43
	if(((int(Level.DetailMode) < int(1)) || !Class'BCoreProV55.BallisticMod'.default.bBulletFlybys) || FlyBySound.Sound == none)
	{
		return;
	}
	// End:0x97
	if(((int(FlyByMode) == int(3)) || (int(FlyByMode) == int(1)) && int(Mode) == 0) || (int(FlyByMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	TipLoc = GetModeTipLocation();
	// End:0xEB
	if(Level.GetLocalPlayerController().ViewTarget != none)
	{
		ViewLoc = Level.GetLocalPlayerController().ViewTarget.Location;		
	}
	else
	{
		ViewLoc = Level.GetLocalPlayerController().Location;
	}
	Dir = Normal(HitLoc - TipLoc);
	DotResult = Dir Dot Normal(ViewLoc - TipLoc);
	// End:0x147
	if(DotResult < float(0))
	{
		return;
	}
	XDist = DotResult * VSize(ViewLoc - TipLoc);
	PointX = TipLoc + (Dir * XDist);
	// End:0x195
	if(VSize(PointX - ViewLoc) > FlybyRange)
	{
		return;
	}
	// End:0x1C8
	if((XDist < float(256)) || XDist > (VSize(HitLoc - TipLoc) - float(128)))
	{
		return;
	}
	FlyBySound.Pitch = 0.8500000 + (0.3000000 * FRand());
	// End:0x219
	if(int(Mode) == 0)
	{
		Class'BCoreProV55.BCFlyByActor'.static.SoundOff(self, FlyBySound, PointX, XDist / FlyByBulletSpeed);		
	}
	else
	{
		Class'BCoreProV55.BCFlyByActor'.static.SoundOff(self, AltFlyBySound, PointX, XDist / FlyByBulletSpeed);
	}
	//return;	
}

simulated function StopSpray()
{
	// End:0x32
	if(Flame != none)
	{
		Flame.Kill();
		Flame.bHidden = false;
		Flame = none;
	}
	// End:0x64
	if(GasSpray != none)
	{
		GasSpray.Kill();
		GasSpray.bHidden = false;
		GasSpray = none;
	}
	// End:0xA3
	if((Instigator != none) && CX61AssaultRifle(Instigator.Weapon) != none)
	{
		Instigator.Weapon.AmbientSound = none;
	}
	//return;	
}

simulated event Destroyed()
{
	// End:0x1A
	if(Flame != none)
	{
		Flame.Kill();
	}
	// End:0x34
	if(GasSpray != none)
	{
		GasSpray.Kill();
	}
	super.Destroyed();
	//return;	
}

function CX61UpdateFlameHit(Actor HitActor, Vector HitLocation, Vector HitNormal)
{
	mHitNormal = HitNormal;
	mHitActor = HitActor;
	mHitLocation = HitLocation;
	FlameCount++;
	NetUpdateTime = Level.TimeSeconds - float(1);
	FlameFireEffects();
	//return;	
}

function CX61UpdateGasHit(Vector HitLocation)
{
	SprayCount++;
	mHitLocation = HitLocation;
	NetUpdateTime = Level.TimeSeconds - float(1);
	GasEffects();
	//return;	
}

simulated function GasEffects()
{
	// End:0x28
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || Instigator == none)
	{
		return;
	}
	FlashWeaponLight(0);
	PlayPawnFiring(0);
	// End:0x6E
	if(MuzzleFlash == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
	}
	// End:0xA2
	if(GasSpray == none)
	{
		GasSpray = Spawn(Class'BWBP_OP_Pro.CX61GasSpray', Instigator,, GetModeTipLocation(), Rotator(mHitLocation - (GetModeTipLocation())));
	}
	// End:0xFC
	if(!Instigator.IsFirstPerson())
	{
		GasSpray.bHidden = false;
		GasSpray.SetLocation(GetModeTipLocation());
		GasSpray.SetRotation(Rotator(mHitLocation - GasSpray.Location));
	}
	GasSpray.SetFlameRange(VSize(mHitLocation - GasSpray.Location));
	// End:0x15D
	if(CX61AssaultRifle(Instigator.Weapon) != none)
	{
		CX61AssaultRifle(Instigator.Weapon).GasSpray = GasSpray;
	}
	//return;	
}

simulated function FlameFireEffects()
{
	local Vector Dir;
	local int i;
	local float HitDelay;

	// End:0x28
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || Instigator == none)
	{
		return;
	}
	FlashWeaponLight(0);
	PlayPawnFiring(0);
	// End:0x6E
	if(MuzzleFlash == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
	}
	// End:0xA2
	if(Flame == none)
	{
		Flame = Spawn(Class'BallisticProV55.RX22ASpray', Instigator,, GetModeTipLocation(), Rotator(mHitLocation - (GetModeTipLocation())));
	}
	// End:0xB7
	if(Instigator.IsFirstPerson())
	{		
	}
	else
	{
		Flame.bHidden = false;
		Flame.SetLocation(GetModeTipLocation());
		Flame.SetRotation(Rotator(mHitLocation - Flame.Location));
	}
	Flame.SetFlameRange(VSize(mHitLocation - Flame.Location));
	// End:0x15E
	if(CX61AssaultRifle(Instigator.Weapon) != none)
	{
		CX61AssaultRifle(Instigator.Weapon).Flame = Flame;
	}
	FlyByEffects(0, mHitLocation);
	// End:0x1D9
	if(int(Level.NetMode) == int(NM_Client))
	{
		Dir = Normal(mHitLocation - Instigator.Location);
		mHitActor = Trace(mHitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false);
	}
	// End:0x385
	if(mHitActor != none)
	{
		HitDelay = VSize(Instigator.Location - mHitLocation) / float(1400);
		// End:0x245
		if((FlameHitFX == none) || FlameHitFX.bLost)
		{
			FlameHitFX = Spawn(Class'BWBP_OP_Pro.CX61FireHit',,, mHitLocation, Rotator(mHitNormal));
		}
		// End:0x27E
		if(FlameHitFX != none)
		{
			FlameHitFX.AddHit(mHitLocation, mHitNormal, Level.TimeSeconds + HitDelay);
		}
		i = 0;
		J0x285:

		// End:0x303 [Loop If]
		if(i < SingeSpots.Length)
		{
			// End:0x2D4
			if(SingeSpots[i].Time < (Level.TimeSeconds - float(10)))
			{
				SingeSpots.Remove(i, 1);
				i--;
				// [Explicit Continue]
				goto J0x2F9;
			}
			// End:0x2F9
			if(VSize(SingeSpots[i].loc - mHitLocation) < float(128))
			{
				// [Explicit Break]
				goto J0x303;
			}
			J0x2F9:

			i++;
			// [Loop Continue]
			goto J0x285;
		}
		J0x303:

		// End:0x385
		if(i >= SingeSpots.Length)
		{
			i = SingeSpots.Length;
			SingeSpots.Length = i + 1;
			SingeSpots[i].loc = mHitLocation;
			SingeSpots[i].Time = Level.TimeSeconds;
			Class'BallisticProV55.IM_RX22AScorch'.static.StartSpawn(mHitLocation, mHitNormal, 0, self, byte(HitDelay));
		}
	}
	//return;	
}

defaultproperties
{
	AltFlyBySound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-FlyBy',Volume=0.7000000,Radius=0.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	WeaponClass=Class'BWBP_OP_Pro.CX61AssaultRifle'
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	TrackAnimMode=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FlyByMode=0
	ReloadAnimRate=1.2500000
	CockAnimRate=1.1000000
	bRapidFire=true
	bAltRapidFire=true
	Mesh=SkeletalMesh'BWBP_OP_Anim.CX61_TPm'
	RelativeLocation=(X=2.0000000,Y=-2.0000000,Z=35.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.3000000
}
