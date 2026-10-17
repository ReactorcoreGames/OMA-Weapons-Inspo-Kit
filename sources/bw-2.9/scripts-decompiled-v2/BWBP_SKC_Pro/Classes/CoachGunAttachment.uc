class CoachGunAttachment extends BallisticShotgunAttachment;

const SHOT_AMMO = 0;
const SLUG_AMMO = 1;
const ZAP_AMMO = 2;
const FLAME_AMMO = 3;
const HE_AMMO = 4;
const FRAG_AMMO = 5;

var bool Side;
var byte AmmoType;
var Class<BCTraceEmitter> TracerClasses[6];
var Class<BCImpactManager> ImpactManagers[6];
var Actor MuzzleFlashRight;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		AmmoType;
}

function InitFor(Inventory i)
{
	super(BallisticAttachment).InitFor(i);
	AmmoType = BallisticWeapon(i).CurrentWeaponMode;
	//return;	
}

function SwitchWeaponMode(byte WeaponMode)
{
	AmmoType = WeaponMode;
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x70
	if(int(DirectImpactCount) != int(OldDirectImpactCount))
	{
		DoDirectHit(0, DirectImpact.HitLoc, Class'BCoreProV55.BUtil'.static.ByteToNorm(DirectImpact.HitNorm), int(DirectImpact.HitSurf));
		OldDirectImpactCount = DirectImpactCount;
	}
	// End:0x9C
	if(int(FireCount) != int(OldFireCount))
	{
		FiringMode = 0;
		ThirdPersonEffects();
		OldFireCount = FireCount;
	}
	// End:0xC8
	if(int(AltFireCount) != int(OldAltFireCount))
	{
		FiringMode = 1;
		ThirdPersonEffects();
		OldAltFireCount = AltFireCount;
	}
	//return;	
}

simulated function InstantFireEffects(byte IsDoubleFire)
{
	// End:0x26
	if(int(IsDoubleFire) == 0)
	{
		SingleFireAnim = 'RifleHip_Fire';
		SingleAimedFireAnim = 'RifleAimed_Fire';		
	}
	else
	{
		SingleAimedFireAnim = default.SingleAimedFireAnim;
		SingleFireAnim = default.SingleFireAnim;
	}
	ShotFireEffects(IsDoubleFire);
	//return;	
}

simulated function ShotFireEffects(byte IsDoubleFire)
{
	local Vector HitLocation, Start, End;
	local Rotator R;
	local Material HitMat;
	local int i, j, ShotCount;
	local float RMin, RMax, Range, fX;

	ShotCount = int(IsDoubleFire) + 1;
	// End:0x29
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x36
	if(Instigator == none)
	{
		return;
	}
	// End:0x3AF
	if(int(Level.NetMode) == int(NM_Client))
	{
		RMin = float(GetTraceRange());
		RMax = float(GetTraceRange());
		Start = Instigator.Location + Instigator.EyePosition();
		i = 0;
		J0x97:

		// End:0x3AF [Loop If]
		if(i < ((GetTraceCount()) * ShotCount))
		{
			mHitActor = none;
			Range = Lerp(FRand(), RMin, RMax);
			R = Rotator(mHitLocation);
			switch(GetSpreadMode())
			{
				// End:0x156
				case 1:
					fX = FRand();
					R.Yaw += int((float(XInaccuracy) * ((FRand() * float(2)) - float(1))) * Sin(fX * 1.5707960));
					R.Pitch += int((float(YInaccuracy) * ((FRand() * float(2)) - float(1))) * Cos(fX * 1.5707960));
					// End:0x236
					break;
				// End:0x1E0
				case 2:
					fX = FRand();
					R.Yaw += int((float(XInaccuracy) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
					R.Pitch += int((float(YInaccuracy) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
					// End:0x236
					break;
				// End:0xFFFF
				default:
					R.Yaw += int(((FRand() * float(XInaccuracy)) * float(2)) - float(XInaccuracy));
					R.Pitch += int(((FRand() * float(YInaccuracy)) * float(2)) - float(YInaccuracy));
					// End:0x236
					break;
					break;
			}
			End = Start + (Vector(R) * Range);
			mHitActor = Trace(HitLocation, mHitNormal, End, Start, true,, HitMat);
			// End:0x2D3
			if(mHitActor == none)
			{
				DoWaterTrace(0, Start, End);
				j = 0;
				J0x298:

				// End:0x2D0 [Loop If]
				if(j < ShotCount)
				{
					SpawnTracer(IsDoubleFire, End);
					Side = !Side;
					++j;
					// [Loop Continue]
					goto J0x298;
				}				
			}
			else
			{
				DoWaterTrace(0, Start, HitLocation);
				j = 0;
				J0x2EB:

				// End:0x323 [Loop If]
				if(j < ShotCount)
				{
					SpawnTracer(IsDoubleFire, HitLocation);
					Side = !Side;
					++j;
					// [Loop Continue]
					goto J0x2EB;
				}
			}
			// End:0x331
			if(mHitActor == none)
			{
				// [Explicit Continue]
				goto J0x3A5;
			}
			// End:0x355
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
			// End:0x3A5
			if(ImpactManagers[int(AmmoType)] != none)
			{
				ImpactManagers[int(AmmoType)].static.StartSpawn(HitLocation, mHitNormal, mHitSurf, self);
			}
			J0x3A5:

			i++;
			// [Loop Continue]
			goto J0x97;
		}
	}
	//return;	
}

simulated function SpawnTracer(byte IsDoubleFire, Vector V)
{
	local BCTraceEmitter Tracer;
	local Vector TipLoc, WLoc, WNorm;
	local float dist;

	// End:0x33
	if((int(Level.DetailMode) < int(1)) || int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) == 0)
	{
		return;
	}
	TipLoc = GetModeTipLocation();
	dist = VSize(V - TipLoc);
	// End:0xBE
	if(TracerClasses[int(AmmoType)] != none)
	{
		// End:0x9F
		if(dist > float(200))
		{
			Tracer = Spawn(TracerClasses[int(AmmoType)], self,, TipLoc, Rotator(V - TipLoc));
		}
		// End:0xBE
		if(Tracer != none)
		{
			Tracer.Initialize(dist);
		}
	}
	// End:0x1F0
	if((((((Instigator != none) && Instigator.PhysicsVolume.bWaterVolume) && int(Level.DetailMode) == int(2)) && WaterTracerClass != none) && int(WaterTracerMode) != int(3)) && ((int(WaterTracerMode) == int(2)) || (int(WaterTracerMode) == int(1)) && int(AmmoType) == 0) || (int(WaterTracerMode) == int(0)) && int(AmmoType) != 1)
	{
		// End:0x1C8
		if(!Instigator.PhysicsVolume.TraceThisActor(WLoc, WNorm, TipLoc, V))
		{
			Tracer = Spawn(WaterTracerClass, self,, TipLoc, Rotator(WLoc - TipLoc));
		}
		// End:0x1F0
		if(Tracer != none)
		{
			Tracer.Initialize(VSize(WLoc - TipLoc));
		}
	}
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Coords C;

	// End:0x9B
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		// End:0x75
		if(!Side)
		{
			return Instigator.Weapon.GetBoneCoords('tip').Origin;
		}
		return Instigator.Weapon.GetBoneCoords('tip2').Origin;		
	}
	else
	{
		// End:0xBA
		if(!Side)
		{
			C = GetBoneCoords(FlashBone);			
		}
		else
		{
			C = GetBoneCoords(AltFlashBone);
		}
	}
	return C.Origin;
	//return;	
}

simulated function FlashMuzzleFlash(byte IsDoubleFire)
{
	local Rotator R;

	// End:0x49
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x64
	if(bRandomFlashRoll)
	{
		R.Roll = Rand(65536);
	}
	// End:0x124
	if((int(AmmoType) == 1) && AltMuzzleFlashClass != none)
	{
		// End:0xED
		if(AltMuzzleFlash == none)
		{
			// End:0xC2
			if(!Side)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);				
			}
			else
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
			}
		}
		AltMuzzleFlash.Trigger(self, Instigator);
		// End:0x121
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}		
	}
	else
	{
		// End:0x211
		if(MuzzleFlashClass != none)
		{
			// End:0x1A7
			if(!Side)
			{
				// End:0x170
				if(MuzzleFlash == none)
				{
					Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
				}
				MuzzleFlash.Trigger(self, Instigator);
				// End:0x1A4
				if(bRandomFlashRoll)
				{
					SetBoneRotation(FlashBone, R, 0, 1.0000000);
				}				
			}
			else
			{
				// End:0x1DD
				if(MuzzleFlashRight == none)
				{
					Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashRight, MuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
				}
				MuzzleFlashRight.Trigger(self, Instigator);
				// End:0x211
				if(bRandomFlashRoll)
				{
					SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
				}
			}
		}
	}
	//return;	
}

simulated function EjectBrass(byte Mode)
{
	//return;	
}

defaultproperties
{
	TracerClasses[0]=Class'BallisticProV55.TraceEmitter_Shotgun'
	TracerClasses[1]=Class'BWBP_SKC_Pro.TraceEmitter_X83AM'
	TracerClasses[2]=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	TracerClasses[3]=Class'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame'
	TracerClasses[4]=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManagers[0]=Class'BallisticProV55.IM_Shell'
	ImpactManagers[1]=Class'BWBP_SKC_Pro.IM_ExpBullet'
	ImpactManagers[2]=Class'BallisticProV55.IM_Shell'
	ImpactManagers[3]=Class'BWBP_SKC_Pro.IM_ShellHE'
	ImpactManagers[4]=Class'BWBP_SKC_Pro.IM_ShellHE'
	WeaponClass=Class'BWBP_SKC_Pro.CoachGun'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MeleeImpactManager=Class'BallisticProV55.IM_GunHit'
	FlashBone="Tip1"
	AltFlashBone="tip2"
	FlashScale=1.5000000
	BrassClass=Class'BallisticProV55.Brass_MRS138Shotgun'
	InstantMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ReloadAnim="Reload_BreakOpen"
	CockingAnim="Reload_BreakOpen"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.Coachgun_TPm'
	RelativeLocation=(X=5.0000000,Y=0.0000000,Z=4.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.4500000
}
