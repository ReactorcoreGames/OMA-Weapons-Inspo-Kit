class M806Attachment extends HandgunAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var bool bHasShotgun;
var LaserActor Laser;
var Rotator LaserRot;
var BallisticWeapon myWeap;
var() Class<BallisticShotgunFire> FireClass;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bHasShotgun, bLaserOn;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot;
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
	if((M806Pistol(i) != none) && M806Pistol(i).bHasShotgun)
	{
		bHasShotgun = true;
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	// End:0x23
	if((int(FiringMode) == 1) && bHasShotgun)
	{
		ShotgunFireEffects(FiringMode);
	}
	super(BallisticAttachment).InstantFireEffects(Mode);
	//return;	
}

simulated function Tick(float dt)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator X;
	local Actor Other;

	super.Tick(dt);
	// End:0x5A
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && HandGun != none)
	{
		LaserRot = Instigator.GetViewRotation() + HandGun.GetFireRot();
	}
	// End:0x75
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x95
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_Third',,, Location);
	}
	// End:0xB3
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x11F
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x11A
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		return;		
	}
	else
	{
		// End:0x142
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x175
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
	// End:0x1E8
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

simulated function Destroyed()
{
	// End:0x17
	if(Laser != none)
	{
		Laser.Destroy();
	}
	super.Destroyed();
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

defaultproperties
{
	FireClass=Class'BallisticProV55.M806SecondaryFire'
	WeaponClass=Class'BallisticProV55.M806Pistol'
	MuzzleFlashClass=Class'BallisticProV55.M806FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	TracerClass=Class'BallisticProV55.TraceEmitter_Pistol'
	TracerChance=0.6000000
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.8500000
	CockAnimRate=0.7000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M806_TPm'
	DrawScale=0.0380000
}
