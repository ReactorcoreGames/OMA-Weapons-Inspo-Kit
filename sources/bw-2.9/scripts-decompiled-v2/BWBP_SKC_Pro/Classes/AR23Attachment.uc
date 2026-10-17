class AR23Attachment extends BallisticAttachment;

var() Class<BallisticShotgunFire> FireClass;
var() Vector ScopedTracerOffset;

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

simulated function Vector GetTipLocation()
{
	local Coords C;
	local Vector TheVect;

	// End:0xC6
	if((((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator) && BallisticWeapon(Instigator.Weapon).bScopeView)
	{
		C = Instigator.Weapon.GetBoneCoords('tip');
		TheVect = C.XAxis + C.YAxis;
		C.Origin += (ScopedTracerOffset >> Rotator(TheVect));		
	}
	else
	{
		// End:0x133
		if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
		{
			C = Instigator.Weapon.GetBoneCoords('tip');			
		}
		else
		{
			C = GetBoneCoords('tip');
		}
	}
	// End:0x1BE
	if((((Instigator != none) && int(Level.NetMode) != int(NM_Standalone)) && int(Level.NetMode) != int(NM_ListenServer)) && VSize(C.Origin - Instigator.Location) > float(300))
	{
		return Instigator.Location;
	}
	return C.Origin;
	//return;	
}

defaultproperties
{
	FireClass=Class'BWBP_SKC_Pro.AR23SecondaryFire'
	ScopedTracerOffset=(X=0.0000000,Y=-14.0000000,Z=-2.0000000)
	WeaponClass=Class'BWBP_SKC_Pro.AR23HeavyRifle'
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_BigBulletHMG'
	AltFlashBone="tip2"
	FlashScale=0.2000000
	BrassClass=Class'BallisticProV55.Brass_M46AR'
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-FlyBy',Volume=1.8000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.9500000
	CockAnimRate=0.9000000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.AR23_TPm'
	DrawScale=1.0000000
	Skins[0]=Shader'BWBP_SKC_Tex.AR23.AR23-MainShine'
	Skins[1]=Shader'BWBP_SKC_Tex.AR23.AR23-MiscShine'
	Skins[2]=Texture'BWBP_SKC_Tex.AR23.Muzzle_2D_View'
}
