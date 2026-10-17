class Fifty9Attachment extends HandgunAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot;
}

simulated function PostBeginPlay()
{
	super(BallisticAttachment).PostBeginPlay();
	SetBoneRotation('tip', rot(0, 0, 8192));
	// End:0x42
	if(FRand() > 0.5000000)
	{
		SetBoneRotation('Stock', rot(32768, 0, 0));
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	// End:0x16
	if(int(FiringMode) != 0)
	{
		MeleeFireEffects();		
	}
	else
	{
		super(BallisticAttachment).InstantFireEffects(FiringMode);
	}
	//return;	
}

simulated function MeleeFireEffects()
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x19
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x110
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0xD3
		if((mHitActor == none) || !mHitActor.bWorldGeometry)
		{
			return;
		}
		// End:0xF7
		if(HitMat == none)
		{
			mHitSurf = int(mHitActor.SurfaceType);			
		}
		else
		{
			mHitSurf = int(HitMat.SurfaceType);
		}		
	}
	else
	{
		HitLocation = mHitLocation;
	}
	// End:0x162
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	Class'BallisticProV55.IM_Fifty9Blade'.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
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

defaultproperties
{
	WeaponClass=Class'BallisticProV55.Fifty9MachinePistol'
	MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	FlashScale=0.8000000
	BrassClass=Class'BallisticProV55.Brass_Uzi'
	TrackAnimMode=1
	TracerClass=Class'BallisticProV55.TraceEmitter_FiftyNine'
	TracerChance=0.5000000
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	CockAnimRate=1.1000000
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9_TPm'
	DrawScale=0.1900000
}
