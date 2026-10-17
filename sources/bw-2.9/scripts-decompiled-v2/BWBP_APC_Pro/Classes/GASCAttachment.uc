class GASCAttachment extends HandgunAttachment;

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

simulated function Tick(float dt)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator X;
	local Actor Other;

	super.Tick(dt);
	// End:0x76
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && HandGun != none)
	{
		LaserRot = Instigator.GetViewRotation();
		LaserRot += HandGun.GetAimPivot();
		LaserRot += HandGun.GetRecoilPivot();
	}
	// End:0x91
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xB1
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_Third',,, Location);
	}
	// End:0xCF
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x13B
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x136
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		return;		
	}
	else
	{
		// End:0x15E
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x191
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
	// End:0x204
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
	Class'BallisticProV55.IM_GunHit'.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_APC_Pro.GASCPistol'
	MuzzleFlashClass=Class'BWBP_APC_Pro.GASCFlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_IncendiaryHMGBullet'
	MeleeImpactManager=Class'BallisticProV55.IM_GunHit'
	FlashScale=0.1250000
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	InstantMode=2
	TrackAnimMode=1
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Incendiary'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_Pistol"
	ReloadAnimRate=1.0750000
	CockAnimRate=0.8000000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_APC_Anim.GASC_TPm'
	RelativeLocation=(X=-20.0000000,Y=-5.0000000,Z=1.0000000)
	DrawScale=1.0000000
}
