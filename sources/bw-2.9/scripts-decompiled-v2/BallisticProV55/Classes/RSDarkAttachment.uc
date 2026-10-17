class RSDarkAttachment extends BallisticAttachment;

struct SingeSpot
{
	var Vector loc;
	var float Time;
};

var RSNovaStaff NovaStaff;
var Actor FastMuzzleFlash;
var byte FastFireCount;
var byte FastFireCountOld;
var byte FlameCount;
var byte FlameCountOld;
var RSDarkFlameSpray Flame;
var RSDarkFireHit FlameHitFX;
var array<SingeSpot> SingeSpots;
var RSDarkSawHitSound Noise;
var bool bRampage;
var RSDarkHorns Horns;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		FastFireCount, FlameCount, 
		bRampage;
}

simulated event PostNetReceive()
{
	// End:0x88
	if(!Instigator.IsLocallyControlled())
	{
		// End:0x64
		if(bRampage && Horns == none)
		{
			Horns = Spawn(Class'BallisticProV55.RSDarkHorns', Instigator);
			// End:0x61
			if(Horns != none)
			{
				Instigator.AttachToBone(Horns, 'head');
			}			
		}
		else
		{
			// End:0x88
			if(!bRampage && Horns != none)
			{
				Horns.Destroy();
			}
		}
	}
	// End:0xAC
	if(int(FlameCount) != int(FlameCountOld))
	{
		FlameCountOld = FlameCount;
		FlameFireEffects();
	}
	// End:0xD8
	if(int(FastFireCount) != int(FastFireCountOld))
	{
		FiringMode = 2;
		ThirdPersonEffects();
		FastFireCountOld = FastFireCount;
	}
	super.PostNetReceive();
	//return;	
}

simulated event ThirdPersonEffects()
{
	StopSpray();
	// End:0x8A
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		// End:0x52
		if(int(FiringMode) == 1)
		{
			InstantFireEffects(FiringMode);
			PlayPawnFiring(FiringMode);			
		}
		else
		{
			// End:0x84
			if(int(FiringMode) == 2)
			{
				FlashMuzzleFlash(FiringMode);
				FlashWeaponLight(FiringMode);
				PlayPawnFiring(FiringMode);				
			}
			else
			{
				super.ThirdPersonEffects();
			}
		}
	}
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	// End:0x49
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0xB1
	if((int(Mode) == 0) && AltMuzzleFlashClass != none)
	{
		// End:0x99
		if(AltMuzzleFlash == none)
		{
			Class'BallisticProV55.RSDarkStar'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
		}
		AltMuzzleFlash.Trigger(self, Instigator);		
	}
	else
	{
		// End:0x10A
		if(int(Mode) == 2)
		{
			// End:0xF5
			if(FastMuzzleFlash == none)
			{
				Class'BallisticProV55.RSDarkStar'.static.InitMuzzleFlash(FastMuzzleFlash, Class'BallisticProV55.RSDarkFastMuzzleFlash', DrawScale * FlashScale, self, FlashBone);
			}
			FastMuzzleFlash.Trigger(self, Instigator);
		}
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x54
	if(((int(InstantMode) == int(3)) || (int(InstantMode) == int(1)) && int(Mode) == 0) || (int(InstantMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0x6D
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x7A
	if(Instigator == none)
	{
		return;
	}
	SpawnTracer(Mode, mHitLocation);
	FlyByEffects(Mode, mHitLocation);
	// End:0x1ED
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		// End:0x109
		if(int(WallPenetrates) != 0)
		{
			WallPenetrates = 0;
			DoWallPenetrate(Mode, Start, mHitLocation);
		}
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0x188
		if((ImpactManager != none) && bDoWaterSplash)
		{
			DoWaterTrace(int(Mode), Start, mHitLocation);
		}
		// End:0x195
		if(mHitActor == none)
		{
			return;
		}
		// End:0x1B0
		if(Vehicle(mHitActor) != none)
		{
			mHitSurf = 3;			
		}
		else
		{
			// End:0x1D4
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
		}		
	}
	else
	{
		HitLocation = mHitLocation;
	}
	// End:0x225
	if(Noise == none)
	{
		Noise = Spawn(Class'BallisticProV55.RSDarkSawHitSound', Instigator,, Instigator.Location);
	}
	// End:0x31B
	if((((((int(Level.NetMode) != int(NM_Client)) && ImpactManager != none) && WaterHitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && bDoWaterSplash) && int(Level.DetailMode) >= int(1)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0)
	{
		ImpactManager.static.StartSpawn(WaterHitLocation, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLocation), 9, Instigator, 2);
		Noise.SetNoise(ImpactManager.default.HitSounds[mHitSurf]);
		Noise.SetLocation(WaterHitLocation);
	}
	// End:0x362
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x3C6
	if(ImpactManager != none)
	{
		ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator, 2);
		Noise.SetNoise(ImpactManager.default.HitSounds[mHitSurf]);
		Noise.SetLocation(HitLocation);
	}
	//return;	
}

function DarkUpdateFlameHit(Actor HitActor, Vector HitLocation, Vector HitNormal)
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
		Flame = Spawn(Class'BallisticProV55.RSDarkFlameSpray', Instigator,, GetModeTipLocation(), Rotator(mHitLocation - (GetModeTipLocation())));
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
	if(RSDarkStar(Instigator.Weapon) != none)
	{
		RSDarkStar(Instigator.Weapon).Flame = Flame;
	}
	FlyByEffects(0, mHitLocation);
	// End:0x1D9
	if(int(Level.NetMode) == int(NM_Client))
	{
		Dir = Normal(mHitLocation - Instigator.Location);
		mHitActor = Trace(mHitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false);
	}
	// End:0x383
	if(mHitActor != none)
	{
		HitDelay = VSize(Instigator.Location - mHitLocation) / float(1400);
		// End:0x245
		if((FlameHitFX == none) || FlameHitFX.bLost)
		{
			FlameHitFX = Spawn(Class'BallisticProV55.RSDarkFireHit',,, mHitLocation, Rotator(mHitNormal));
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

		// End:0x383
		if(i >= SingeSpots.Length)
		{
			i = SingeSpots.Length;
			SingeSpots.Length = i + 1;
			SingeSpots[i].loc = mHitLocation;
			SingeSpots[i].Time = Level.TimeSeconds;
			Class'BallisticProV55.IM_RSDarkScorch'.static.EvilStartSpawn(mHitLocation, mHitNormal, 0, self, HitDelay);
		}
	}
	//return;	
}

simulated function FlashWeaponLight(byte Mode)
{
	// End:0x54
	if(((int(LightMode) == int(3)) || (int(LightMode) == int(1)) && int(Mode) == 0) || (int(LightMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0xBA
	if(((Instigator == none) || Level.bDropDetail) || ((Level.TimeSeconds - LastRenderTime) > 0.2000000) && PlayerController(Instigator.Controller) == none)
	{
		SetTimer(WeaponLightTime, false);
		return;
	}
	// End:0xE5
	if(Instigator.Weapon != none)
	{
		LightWeapon = Instigator.Weapon;		
	}
	else
	{
		LightWeapon = self;
	}
	LightWeapon.bDynamicLight = true;
	SetTimer(WeaponLightTime, false);
	//return;	
}

simulated event Timer()
{
	super.Timer();
	StopSpray();
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
	// End:0x58
	if(MuzzleFlash != none)
	{
		Emitter(MuzzleFlash).Kill();
		MuzzleFlash = none;
	}
	//return;	
}

function DarkUpdateHit(byte WeaponMode)
{
	// End:0x3E
	if(int(WeaponMode) == 0)
	{
		FiringMode = 0;
		FireCount++;
		NetUpdateTime = Level.TimeSeconds - float(1);
		ThirdPersonEffects();		
	}
	else
	{
		// End:0x79
		if(int(WeaponMode) == 1)
		{
			FiringMode = 2;
			FastFireCount++;
			NetUpdateTime = Level.TimeSeconds - float(1);
			ThirdPersonEffects();
		}
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Noise != none)
	{
		Noise.Destroy();
	}
	// End:0x31
	if(Flame != none)
	{
		Flame.Kill();
	}
	// End:0x48
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	// End:0x5F
	if(FastMuzzleFlash != none)
	{
		FastMuzzleFlash.Destroy();
	}
	bRampage = false;
	// End:0x7E
	if(Horns != none)
	{
		Horns.Destroy();
	}
	super.Destroyed();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	MuzzleFlashClass=Class'BallisticProV55.RSDarkMuzzleFlame'
	AltMuzzleFlashClass=Class'BallisticProV55.RSDarkSlowMuzzleFlash'
	ImpactManager=Class'BallisticProV55.IM_DarkStarSaw'
	WeaponLightTime=0.2000000
	BrassMode=3
	InstantMode=1
	LightMode=2
	ReloadAnim="Reload_MG"
	ReloadAnimRate=2.0500000
	MeleeStrikeAnim="RifleHip_Burst"
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.DarkStar_TPm'
}
