class leMatAttachment extends HandgunAttachment;

var byte RevolverBrass;
var() Class<BallisticShotgunFire> FireClass;
var byte CurrentTracerMode;
var Class<BCTraceEmitter> TracerClasses[3];
var Class<BCImpactManager> ImpactManagers[3];
var BallisticWeapon myWeap;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		CurrentTracerMode, RevolverBrass;
}

simulated event PostNetReceive()
{
	// End:0x39
	if(int(RevolverBrass) > 0)
	{
		// End:0x26
		if(int(RevolverBrass) > 127)
		{
			RevolverBrass -= byte(128);
		}
		RevolverEjectBrass(RevolverBrass);
		RevolverBrass = 0;
	}
	super(BallisticAttachment).PostNetReceive();
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
	// End:0x5C
	if((leMatRevolver(i) != none) && leMatRevolver(i).bHasSlug)
	{
		CurrentTracerMode = 1;
	}
	// End:0x8D
	if((leMatRevolver(i) != none) && leMatRevolver(i).bHasDecoy)
	{
		CurrentTracerMode = 2;
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	// End:0x1B
	if(int(FiringMode) != 0)
	{
		ShotgunFireEffects(FiringMode);		
	}
	else
	{
		super(BallisticAttachment).InstantFireEffects(FiringMode);
	}
	//return;	
}

simulated function int GetTraceCount()
{
	// End:0x22
	if((int(CurrentTracerMode) == 1) || int(CurrentTracerMode) == 2)
	{
		return 1;		
	}
	else
	{
		// End:0x7F
		if(WeaponClass != none)
		{
			return ShotgunEffectParams(WeaponClass.default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].default.Layouts[0].FireParams[0].FireEffectParams[0]).TraceCount;			
		}
		else
		{
			return 10;
		}
	}
	//return;	
}

simulated function ShotgunFireEffects(byte Mode)
{
	local Vector HitLocation, Start, End;
	local Rotator R;
	local Material HitMat;
	local int i;
	local float Xs, Ys, RMin, RMax, Range, fX;

	// End:0x3D7
	if((int(Level.NetMode) == int(NM_Client)) && FireClass != none)
	{
		Xs = FireClass.default.XInaccuracy;
		Ys = FireClass.default.YInaccuracy;
		RMin = FireClass.default.TraceRange.Min;
		RMax = FireClass.default.TraceRange.Max;
		Start = Instigator.Location + Instigator.EyePosition();
		i = 0;
		J0xAC:

		// End:0x3D7 [Loop If]
		if(i < (GetTraceCount()))
		{
			mHitActor = none;
			Range = Lerp(FRand(), RMin, RMax);
			R = Rotator(mHitLocation);
			switch(FireClass.default.FireSpreadMode)
			{
				// End:0x168
				case 1:
					fX = FRand();
					R.Yaw += int((Xs * ((FRand() * float(2)) - float(1))) * Sin(fX * 1.5707960));
					R.Pitch += int((Ys * ((FRand() * float(2)) - float(1))) * Cos(fX * 1.5707960));
					// End:0x23C
					break;
				// End:0x1EE
				case 2:
					fX = FRand();
					R.Yaw += int((Xs * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
					R.Pitch += int((Ys * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
					// End:0x23C
					break;
				// End:0xFFFF
				default:
					R.Yaw += int(((FRand() * Xs) * float(2)) - Xs);
					R.Pitch += int(((FRand() * Ys) * float(2)) - Ys);
					// End:0x23C
					break;
					break;
			}
			End = Start + (Vector(R) * Range);
			mHitActor = Trace(HitLocation, mHitNormal, End, Start, false,, HitMat);
			// End:0x2D4
			if(mHitActor == none)
			{
				TracerClass = Class<BCTraceEmitter>(FireClass.default.TracerClass);
				DoWaterTrace(int(Mode), Start, End);
				SpawnTracer(Mode, End);
				TracerClass = default.TracerClass;				
			}
			else
			{
				TracerClass = Class<BCTraceEmitter>(FireClass.default.TracerClass);
				DoWaterTrace(int(Mode), Start, HitLocation);
				SpawnTracer(Mode, HitLocation);
				TracerClass = default.TracerClass;
			}
			// End:0x355
			if((mHitActor == none) || !mHitActor.bWorldGeometry && Mover(mHitActor) == none)
			{
				// [Explicit Continue]
				goto J0x3CD;
			}
			// End:0x379
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
			// End:0x3CD
			if(ImpactManagers[int(CurrentTracerMode)] != none)
			{
				ImpactManagers[int(CurrentTracerMode)].static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
			}
			J0x3CD:

			i++;
			// [Loop Continue]
			goto J0xAC;
		}
	}
	//return;	
}

simulated function RevolverEjectBrass(byte Num)
{
	local int i;
	local Rotator R;

	// End:0x3F
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x2C
		if(int(RevolverBrass) > 127)
		{
			RevolverBrass = Num;			
		}
		else
		{
			RevolverBrass = byte(int(Num) + 128);
		}
	}
	// End:0x5A
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xA3
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0xD4
	if(!Class'BCoreProV55.BallisticMod'.default.bEjectBrass || int(Level.DetailMode) < int(1))
	{
		return;
	}
	// End:0x111
	if(int(Num) >= 64)
	{
		Spawn(Class'BallisticProV55.Brass_leMatSG', self,, (GetEjectorLocation(R)) + (VRand() * float(2)), R);
		Num -= byte(64);
	}
	i = 0;
	J0x118:

	// End:0x157 [Loop If]
	if(i < int(Num))
	{
		Spawn(BrassClass, self,, (GetEjectorLocation(R)) + (VRand() * float(2)), R);
		i++;
		// [Loop Continue]
		goto J0x118;
	}
	//return;	
}

simulated function EjectBrass(byte Mode)
{
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	local Rotator R;

	// End:0x14
	if(bIsSlave)
	{
		SlaveAlpha = 1.0000000;
	}
	// End:0x68
	if(((int(FlashMode) == int(3)) || (int(FlashMode) == int(1)) && int(Mode) == 0) || (int(FlashMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0xB1
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0xCC
	if(bRandomFlashRoll)
	{
		R.Roll = Rand(65536);
	}
	// End:0x153
	if((int(Mode) != 0) && AltMuzzleFlashClass != none)
	{
		// End:0x11C
		if(AltMuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * 2.0000000, self, AltFlashBone);
		}
		AltMuzzleFlash.Trigger(self, Instigator);
		// End:0x150
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}		
	}
	else
	{
		// End:0x1D7
		if((int(Mode) == 0) && MuzzleFlashClass != none)
		{
			// End:0x1A3
			if(MuzzleFlash == none)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * 0.6000000, self, FlashBone);
			}
			MuzzleFlash.Trigger(self, Instigator);
			// End:0x1D7
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
	FireClass=Class'BallisticProV55.leMatSecondaryFire'
	TracerClasses[0]=Class'BallisticProV55.TraceEmitter_Shotgun'
	TracerClasses[1]=Class'BallisticProV55.TraceEmitter_Default'
	ImpactManagers[0]=Class'BallisticProV55.IM_Shell'
	ImpactManagers[1]=Class'BallisticProV55.IM_BigBulletHMG'
	ImpactManagers[2]=Class'BallisticProV55.IM_Decoy'
	WeaponClass=Class'BallisticProV55.leMatRevolver'
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	BrassClass=Class'BallisticProV55.Brass_Magnum'
	TracerMode=2
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Pistol'
	TracerChance=0.6000000
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.6750000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.Wilson_TPm'
	DrawScale=0.1250000
}
