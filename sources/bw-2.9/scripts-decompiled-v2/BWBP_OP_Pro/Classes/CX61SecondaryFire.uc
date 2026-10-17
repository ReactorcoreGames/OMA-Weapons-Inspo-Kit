class CX61SecondaryFire extends BallisticFire;

const FLAMERINTERVAL = 0.2f;

var Actor MuzzleFlame;
var bool bIgnited;
var Sound FireSoundLoop;
var FullSound FlameEndSound;

simulated function bool HasAmmo()
{
	return CX61AssaultRifle(Weapon).StoredGas > float(0);
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	// End:0x27
	if(int(newmode) == 1)
	{
		BallisticFireSound.Sound = none;
		FireSoundLoop = Sound'BW_Core_WeaponSound.T10.T10-ToxinLoop';		
	}
	else
	{
		BallisticFireSound.Sound = Sound'BWBP_OP_Sounds.CX61.CX61-FlameLoopStart';
		FireSoundLoop = Sound'BWBP_OP_Sounds.CX61.CX61-FlameLoop';
	}
	// End:0x78
	if(Weapon.bBerserk)
	{
		FireRate *= 0.7500000;
		FireRecoil *= 0.7500000;
		FireChaos *= 0.7500000;
	}
	// End:0xB7
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		FireRate /= Level.GRI.WeaponBerserk;
	}
	load = float(AmmoPerFire);
	//return;	
}

event Timer()
{
	super.Timer();
	// End:0x42
	if(bIgnited && !IsFiring() || Weapon.GetFireMode(0).IsFiring())
	{
		StopFlaming();
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

simulated function bool AllowFire()
{
	// End:0x56
	if((!CheckReloading() || Instigator.HeadVolume.bWaterVolume) || CX61AssaultRifle(Weapon).StoredGas <= float(0))
	{
		// End:0x54
		if(bIgnited)
		{
			StopFiring();
		}
		return false;
	}
	return true;
	//return;	
}

function StopFiring()
{
	bIgnited = false;
	Weapon.PlayOwnedSound(FlameEndSound.Sound, FlameEndSound.Slot, FlameEndSound.Volume, FlameEndSound.bNoOverride, FlameEndSound.Radius, FlameEndSound.Pitch, FlameEndSound.bAtten);
	Instigator.AmbientSound = none;
	NextFireTime = Level.TimeSeconds + 0.2000000;
	// End:0xB0
	if(MuzzleFlame != none)
	{
		Emitter(MuzzleFlame).Kill();
		MuzzleFlame = none;
	}
	//return;	
}

simulated function DestroyEffects()
{
	super.DestroyEffects();
	// End:0x1D
	if(MuzzleFlame != none)
	{
		MuzzleFlame.Destroy();
	}
	//return;	
}

auto simulated state Flamer
{
	function DoFireEffect()
	{
		local Vector Start, Dir, End, HitLocation, HitNormal;

		local Rotator Aim;
		local Actor Other;
		local float dist;
		local int i;
		local CX61FlameProjectile Prj;

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
		Prj = Spawn(Class'BWBP_OP_Pro.CX61FlameProjectile', Instigator,, Start, Rotator(HitLocation - Start));
		// End:0x25A
		if(Prj != none)
		{
			Prj.Instigator = Instigator;
			Prj.InitFlame(HitLocation);
			Prj.bHitWall = Other != none;
		}
		CX61Attachment(Weapon.ThirdPersonActor).CX61UpdateFlameHit(Other, HitLocation, HitNormal);
		// End:0x2B5
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
		{
			CX61AssaultRifle(Weapon).StoredGas -= 0.0800000;			
		}
		else
		{
			CX61AssaultRifle(Weapon).StoredGas -= 0.1000000;
		}
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
	stop;	
}

simulated state HealGas
{
	function DoFireEffect()
	{
		local Vector Start, Dir, End, HitLocation, HitNormal;

		local Rotator Aim;
		local Actor Other;
		local float dist;
		local int i;
		local CX61HealProjectile Prj;

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
		Prj = Spawn(Class'BWBP_OP_Pro.CX61HealProjectile', Instigator,, Start, Rotator(HitLocation - Start));
		// End:0x22E
		if(Prj != none)
		{
			Prj.Instigator = Instigator;
		}
		CX61AssaultRifle(Weapon).StoredGas -= 0.0400000;
		CX61Attachment(Weapon.ThirdPersonActor).CX61UpdateGasHit(HitLocation);
		super(BallisticFire).DoFireEffect();
		//return;		
	}

	function PlayFiring()
	{
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		// End:0x25
		if(!bIgnited)
		{
			bIgnited = true;
		}
		// End:0x44
		if(FireSoundLoop != none)
		{
			Instigator.AmbientSound = FireSoundLoop;
		}
		//return;		
	}

	function ServerPlayFiring()
	{
		// End:0x13
		if(!bIgnited)
		{
			bIgnited = true;
		}
		// End:0x3F
		if((FireCount == 0) && FireSoundLoop != none)
		{
			Instigator.AmbientSound = FireSoundLoop;
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	FireSoundLoop=Sound'BWBP_OP_Sounds.CX61.CX61-FlameLoop'
	FlameEndSound=(Sound=Sound'BWBP_OP_Sounds.CX61.CX61-FlameLoopEnd2',Volume=0.5000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlashBone="'"
	FireChaos=0.0500000
	BallisticFireSound=(Sound=none,Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireAnim="None"
	FireRate=0.0900000
	AmmoClass=Class'BallisticProV55.Ammo_556mm'
	AmmoPerFire=0
	WarnTargetPct=0.2000000
}
