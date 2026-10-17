class WendigoAttachment extends BallisticAttachment;

var bool bMeleeing;
var() Class<BallisticShotgunFire> FireClass;

simulated function InstantFireEffects(byte Mode)
{
	// End:0x18
	if(int(FiringMode) == 1)
	{
		ShotgunFireEffects(FiringMode);
	}
	super.InstantFireEffects(Mode);
	//return;	
}

simulated function ShotgunFireEffects(byte Mode)
{
	local Vector HitLocation, Start, End;
	local Rotator R;
	local Material HitMat;
	local int i;
	local float Xs, Ys, RMin, RMax, Range, fX;

	// End:0x400
	if((int(Level.NetMode) == int(NM_Client)) && FireClass != none)
	{
		Xs = FireClass.default.XInaccuracy;
		Ys = FireClass.default.YInaccuracy;
		// End:0x71
		if(!bIsAimed)
		{
			Xs *= 2.5000000;
			Ys *= 2.5000000;
		}
		RMin = FireClass.default.TraceRange.Min;
		RMax = FireClass.default.TraceRange.Max;
		Start = Instigator.Location + Instigator.EyePosition();
		i = 0;
		J0xCF:

		// End:0x400 [Loop If]
		if(i < FireClass.default.TraceCount)
		{
			mHitActor = none;
			Range = Lerp(FRand(), RMin, RMax);
			R = Rotator(mHitLocation);
			switch(FireClass.default.FireSpreadMode)
			{
				// End:0x193
				case 1:
					fX = FRand();
					R.Yaw += int((Xs * ((FRand() * float(2)) - float(1))) * Sin(fX * 1.5707960));
					R.Pitch += int((Ys * ((FRand() * float(2)) - float(1))) * Cos(fX * 1.5707960));
					// End:0x267
					break;
				// End:0x219
				case 2:
					fX = FRand();
					R.Yaw += int((Xs * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
					R.Pitch += int((Ys * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
					// End:0x267
					break;
				// End:0xFFFF
				default:
					R.Yaw += int(((FRand() * Xs) * float(2)) - Xs);
					R.Pitch += int(((FRand() * Ys) * float(2)) - Ys);
					// End:0x267
					break;
					break;
			}
			End = Start + (Vector(R) * Range);
			mHitActor = Trace(HitLocation, mHitNormal, End, Start, false,, HitMat);
			// End:0x2FF
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
			// End:0x380
			if((mHitActor == none) || !mHitActor.bWorldGeometry && Mover(mHitActor) == none)
			{
				// [Explicit Continue]
				goto J0x3F6;
			}
			// End:0x3A4
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
			// End:0x3F6
			if(FireClass.default.ImpactManager != none)
			{
				FireClass.default.ImpactManager.StartSpawn(HitLocation, mHitNormal, mHitSurf, self);
			}
			J0x3F6:

			i++;
			// [Loop Continue]
			goto J0xCF;
		}
	}
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	local Rotator R;

	// End:0x54
	if(((int(FlashMode) == int(3)) || (int(FlashMode) == int(1)) && int(Mode) == 0) || (int(FlashMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0x9D
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0xB8
	if(bRandomFlashRoll)
	{
		R.Roll = Rand(65536);
	}
	// End:0x13F
	if((int(Mode) != 0) && AltMuzzleFlashClass != none)
	{
		// End:0x108
		if(AltMuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * 2.0000000, self, AltFlashBone);
		}
		AltMuzzleFlash.Trigger(self, Instigator);
		// End:0x13C
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}		
	}
	else
	{
		// End:0x1C3
		if((int(Mode) == 0) && MuzzleFlashClass != none)
		{
			// End:0x18F
			if(MuzzleFlash == none)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * 1.0000000, self, FlashBone);
			}
			MuzzleFlash.Trigger(self, Instigator);
			// End:0x1C3
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
	WeaponClass=Class'BWBP_APC_Pro.WendigoSMG'
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	ImpactManager=Class'BWBP_SKC_Pro.IM_Supercharge'
	MeleeImpactManager=Class'BallisticProV55.IM_Knife'
	AltFlashBone="tip2"
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassMode=1
	FlashMode=2
	LightMode=2
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Pulse'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-FlyBy',Volume=0.3000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bHeavy=true
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_APC_Anim.Wendigo_TPm'
	RelativeRotation=(Pitch=0,Yaw=32768,Roll=0)
	DrawScale=0.8000000
}
