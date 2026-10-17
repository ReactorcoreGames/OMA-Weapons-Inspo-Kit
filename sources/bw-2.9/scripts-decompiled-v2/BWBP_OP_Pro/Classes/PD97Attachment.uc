class PD97Attachment extends HandgunAttachment;

var Pawn TazerHit;
var Pawn OldTazerHit;
var PD97TazerEffect TazerEffect;
var() Class<BallisticShotgunFire> FireClass;
var bool bShotgunMode;
var bool bOldShotgunMode;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		TazerHit, bShotgunMode;
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x3C
	if((PD97Bloodhound(i) != none) && PD97Bloodhound(i).bShotgunMode)
	{
		bShotgunMode = true;
	}
	//return;	
}

simulated function PostNetReceive()
{
	// End:0x80
	if(TazerHit != OldTazerHit)
	{
		OldTazerHit = TazerHit;
		// End:0x33
		if(TazerHit != none)
		{
			GotTarget(TazerHit);			
		}
		else
		{
			TazerEffect.Kill();
			TazerEffect = none;
			// End:0x80
			if(PD97Bloodhound(Instigator.Weapon) != none)
			{
				PD97Bloodhound(Instigator.Weapon).TazerEffect = none;
			}
		}
	}
	// End:0xA6
	if(bShotgunMode != bOldShotgunMode)
	{
		bOldShotgunMode = bShotgunMode;
		InstantMode = 0;
	}
	super(BallisticAttachment).PostNetReceive();
	//return;	
}

simulated function GotTarget(Pawn A)
{
	// End:0x3F
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		TazerHit = A;
	}
	// End:0xDD
	if(TazerEffect == none)
	{
		TazerEffect = Spawn(Class'BWBP_OP_Pro.PD97TazerEffect', self,,, rot(0, 0, 0));
		// End:0xA3
		if(PD97Bloodhound(Instigator.Weapon) != none)
		{
			PD97Bloodhound(Instigator.Weapon).TazerEffect = TazerEffect;
		}
		TazerEffect.SetTarget(A);
		TazerEffect.Instigator = Instigator;
		TazerEffect.UpdateTargets();		
	}
	else
	{
		TazerEffect.SetTarget(A);
	}
	//return;	
}

simulated function TazeEnd()
{
	// End:0x3B
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		TazerHit = none;
	}
	// End:0xAD
	if(TazerEffect != none)
	{
		TazerEffect.KillFlashes();
		TazerEffect.SetTimer(0.0000000, false);
		TazerEffect.Kill();
		// End:0xAD
		if(PD97Bloodhound(Instigator.Weapon) != none)
		{
			PD97Bloodhound(Instigator.Weapon).TazerEffect = none;
		}
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	// End:0x14
	if(bShotgunMode)
	{
		ShotgunFireEffects(FiringMode);
	}
	super(BallisticAttachment).InstantFireEffects(Mode);
	//return;	
}

simulated function ShotgunFireEffects(byte Mode)
{
	local Vector HitLocation, Start, End;
	local Rotator R;
	local Material HitMat;
	local int i;
	local float Xs, Ys, RMin, RMax, Range, fX;

	// End:0x3DD
	if((int(Level.NetMode) == int(NM_Client)) && FireClass != none)
	{
		Xs = FireClass.default.XInaccuracy;
		Ys = FireClass.default.YInaccuracy;
		RMin = FireClass.default.TraceRange.Min;
		RMax = FireClass.default.TraceRange.Max;
		Start = Instigator.Location + Instigator.EyePosition();
		i = 0;
		J0xAC:

		// End:0x3DD [Loop If]
		if(i < FireClass.default.TraceCount)
		{
			mHitActor = none;
			Range = Lerp(FRand(), RMin, RMax);
			R = Rotator(mHitLocation);
			switch(FireClass.default.FireSpreadMode)
			{
				// End:0x170
				case 1:
					fX = FRand();
					R.Yaw += int((Xs * ((FRand() * float(2)) - float(1))) * Sin(fX * 1.5707960));
					R.Pitch += int((Ys * ((FRand() * float(2)) - float(1))) * Cos(fX * 1.5707960));
					// End:0x244
					break;
				// End:0x1F6
				case 2:
					fX = FRand();
					R.Yaw += int((Xs * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
					R.Pitch += int((Ys * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
					// End:0x244
					break;
				// End:0xFFFF
				default:
					R.Yaw += int(((FRand() * Xs) * float(2)) - Xs);
					R.Pitch += int(((FRand() * Ys) * float(2)) - Ys);
					// End:0x244
					break;
					break;
			}
			End = Start + (Vector(R) * Range);
			mHitActor = Trace(HitLocation, mHitNormal, End, Start, false,, HitMat);
			// End:0x2DC
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
			// End:0x35D
			if((mHitActor == none) || !mHitActor.bWorldGeometry && Mover(mHitActor) == none)
			{
				// [Explicit Continue]
				goto J0x3D3;
			}
			// End:0x381
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
			// End:0x3D3
			if(FireClass.default.ImpactManager != none)
			{
				FireClass.default.ImpactManager.StartSpawn(HitLocation, mHitNormal, mHitSurf, self);
			}
			J0x3D3:

			i++;
			// [Loop Continue]
			goto J0xAC;
		}
	}
	//return;	
}

simulated function Tick(float dt)
{
	super.Tick(dt);
	// End:0x26
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x63
	if((TazerEffect != none) && !Instigator.IsFirstPerson())
	{
		TazerEffect.SetLocation(GetBoneCoords('tip2').Origin);
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x3B
	if(TazerEffect != none)
	{
		TazerEffect.KillFlashes();
		TazerEffect.SetTimer(0.0000000, false);
		TazerEffect.Kill();
	}
	super.Destroyed();
	//return;	
}

defaultproperties
{
	FireClass=Class'BWBP_OP_Pro.PD97PrimaryShotgunFire'
	WeaponClass=Class'BWBP_OP_Pro.PD97Bloodhound'
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	AltFlashBone="ejector"
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	InstantMode=3
	FlashMode=3
	TracerClass=Class'BallisticProV55.TraceEmitter_Pistol'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=3
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_BreakOpen"
	ReloadAnimRate=1.8500000
	CockAnimRate=1.3000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.PD97_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=11.0000000)
	DrawScale=0.2000000
}
