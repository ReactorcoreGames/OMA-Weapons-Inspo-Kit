class AH104SecondaryFire extends BallisticInstantFire;

const FLAMERINTERVAL = 0.2f;

var Actor MuzzleFlame;
var bool bIgnited;
var Sound FireSoundLoop;
var FullSound FlameEndSound;

simulated function bool AllowFire()
{
	// End:0x39
	if(!CheckReloading() || Instigator.HeadVolume.bWaterVolume)
	{
		// End:0x37
		if(bIgnited)
		{
			StopFiring();
		}
		return false;
	}
	// End:0x120
	if(AH104Pistol(BW).AltMagAmmo < 1)
	{
		// End:0xCE
		if(!bPlayedDryFire && DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			bPlayedDryFire = true;
		}
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
		BW.EmptyFire(byte(ThisModeNum));
		// End:0x11E
		if(bIgnited)
		{
			StopFiring();
		}
		return false;
	}
	return true;
	//return;	
}

event Timer()
{
	super(BallisticFire).Timer();
	// End:0x42
	if(bIgnited && !IsFiring() || Weapon.GetFireMode(0).IsFiring())
	{
		StopFlaming();
	}
	//return;	
}

function StopFiring()
{
	bIgnited = false;
	Instigator.AmbientSound = none;
	Weapon.PlayOwnedSound(FlameEndSound.Sound, FlameEndSound.Slot, FlameEndSound.Volume, FlameEndSound.bNoOverride, FlameEndSound.Radius, FlameEndSound.Pitch, FlameEndSound.bAtten);
	NextFireTime = Level.TimeSeconds + 0.2000000;
	// End:0xB0
	if(MuzzleFlame != none)
	{
		Emitter(MuzzleFlame).Kill();
		MuzzleFlame = none;
	}
	//return;	
}

function StopFlaming()
{
	bIgnited = false;
	// End:0x2E
	if(MuzzleFlame != none)
	{
		Emitter(MuzzleFlame).Kill();
		MuzzleFlame = none;
	}
	Instigator.AmbientSound = BW.UsedAmbientSound;
	//return;	
}

function float MaxRange()
{
	return 800.0000000;
	//return;	
}

function DoFireEffect()
{
	local Vector Start, Dir, End, HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other;
	local float dist;
	local int i;
	local AH104FlameProjectile Prj;

	Start = Instigator.Location + Instigator.EyePosition();
	Aim = GetFireAim(Start);
	Aim = Rotator((GetFireSpread()) >> Aim);
	Dir = Vector(Aim);
	End = Start + (Dir * (MaxRange()));
	Weapon.bTraceWater = true;
	i = 0;
	J0x8B:

	// End:0x168 [Loop If]
	if(i < 20)
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x129
		if(((((Other == none) || Other.bWorldGeometry) || Mover(Other) != none) || FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
		{
			// [Explicit Break]
			goto J0x168;
		}
		Start = HitLocation + (Dir * FMax(32.0000000, (Other.CollisionRadius * float(2)) + float(4)));
		i++;
		// [Loop Continue]
		goto J0x8B;
	}
	J0x168:

	Weapon.bTraceWater = false;
	// End:0x18F
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x1D1
	if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
	{
		Other = none;
	}
	dist = VSize(HitLocation - Start);
	Prj = Spawn(Class'BWBP_SKC_Pro.AH104FlameProjectile', Instigator,, Start, Rotator(HitLocation - Start));
	// End:0x25A
	if(Prj != none)
	{
		Prj.Instigator = Instigator;
		Prj.InitFlame(HitLocation);
		Prj.bHitWall = Other != none;
	}
	AH104Attachment(Weapon.ThirdPersonActor).AH104UpdateFlameHit(Other, HitLocation, HitNormal);
	AH104Pistol(BW).AltMagAmmo--;
	super(BallisticFire).DoFireEffect();
	//return;	
}

function PlayFiring()
{
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x31
	if(FireSoundLoop != none)
	{
		Instigator.AmbientSound = FireSoundLoop;
	}
	// End:0x9B
	if(!bIgnited)
	{
		bIgnited = true;
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	// End:0xDE
	if(MuzzleFlame == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlame, Class'BallisticProV55.RX22AMuzzleFlame', Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip2');
	}
	//return;	
}

function ServerPlayFiring()
{
	// End:0x6A
	if(!bIgnited)
	{
		bIgnited = true;
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	// End:0x96
	if((FireCount == 0) && FireSoundLoop != none)
	{
		Instigator.AmbientSound = FireSoundLoop;
	}
	//return;	
}

simulated function DestroyEffects()
{
	super(BallisticFire).DestroyEffects();
	// End:0x1D
	if(MuzzleFlame != none)
	{
		MuzzleFlame.Destroy();
	}
	//return;	
}

defaultproperties
{
	FireSoundLoop=Sound'BWBP_SKC_Sounds.AH104.AH104-FlameLoop'
	FlameEndSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-FlameLoopEnd',Volume=0.5000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlashBone="'"
	DryFireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-FlameDryFire',Volume=1.3500000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FireChaos=0.0500000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-FlameLoopStart',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bPawnRapidFireAnim=true
	FireAnim="FireAltContinuous"
	FireRate=0.0500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_AH104Flamer'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=64.0000000,Z=64.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	WarnTargetPct=0.2000000
}
