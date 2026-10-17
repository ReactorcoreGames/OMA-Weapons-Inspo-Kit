class AH104Attachment extends BallisticAttachment;

struct SingeSpot
{
	var Vector loc;
	var float Time;
};

var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var BallisticWeapon Heavy;
var RX22ASpray Flame;
var byte FlameCount;
var byte FlameCountOld;
var AH104FireHit FlameHitFX;
var array<SingeSpot> SingeSpots;
var FullSound AltFlyBySound;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;

	// Pos:0x00D
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		FlameCount;

	// Pos:0x025
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot;
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
	// End:0x71
	if((Instigator != none) && AH104Pistol(Instigator.Weapon) != none)
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
	// End:0x31
	if(Laser != none)
	{
		Laser.Destroy();
	}
	super.Destroyed();
	//return;	
}

function AH104UpdateFlameHit(Actor HitActor, Vector HitLocation, Vector HitNormal)
{
	mHitNormal = HitNormal;
	mHitActor = HitActor;
	mHitLocation = HitLocation;
	FlameCount++;
	NetUpdateTime = Level.TimeSeconds - float(1);
	FlameFireEffects();
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
	if(AH104Pistol(Instigator.Weapon) != none)
	{
		AH104Pistol(Instigator.Weapon).Flame = Flame;
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
			FlameHitFX = Spawn(Class'BWBP_SKC_Pro.AH104FireHit',,, mHitLocation, Rotator(mHitNormal));
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
			Class'BWBP_SKC_Pro.IM_AH104Scorch'.static.StartSpawn(mHitLocation, mHitNormal, 0, self, byte(HitDelay));
		}
	}
	//return;	
}

simulated function Tick(float dt)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator X;
	local Actor Other;

	super.Tick(dt);
	// End:0x76
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && Heavy != none)
	{
		LaserRot = Instigator.GetViewRotation();
		LaserRot += Heavy.GetAimPivot();
		LaserRot += Heavy.GetRecoilPivot();
	}
	// End:0x91
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xB1
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_Third',,, Location);
	}
	// End:0xCF
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x13B
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x136
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		return;		
	}
	else
	{
		// End:0x15E
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x191
	if(Instigator != none)
	{
		Start = Instigator.Location + Instigator.EyePosition();		
	}
	else
	{
		Start = Location;
	}
	X = LaserRot;
	loc = GetModeTipLocation();
	End = Start + (Vector(X) * float(5000));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x204
	if(Other == none)
	{
		HitLocation = End;
	}
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(HitLocation - loc));
	Scale3D.X = VSize(HitLocation - Laser.Location) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
	Laser.SetDrawScale3D(Scale3D);
	//return;	
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x2B
	if(BallisticWeapon(i) != none)
	{
		Heavy = BallisticWeapon(i);
	}
	//return;	
}

defaultproperties
{
	AltFlyBySound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-FlyBy',Volume=0.7000000,Radius=0.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	WeaponClass=Class'BWBP_SKC_Pro.AH104Pistol'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.AH104FlashEmitter'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ExpBullet'
	AltFlashBone="ejector"
	FlashScale=0.0500000
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	FlashMode=2
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_HMG'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-FlyBy',Volume=1.5000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.8000000
	CockAnimRate=0.8000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.AH104_TPm'
	DrawScale=1.0000000
}
