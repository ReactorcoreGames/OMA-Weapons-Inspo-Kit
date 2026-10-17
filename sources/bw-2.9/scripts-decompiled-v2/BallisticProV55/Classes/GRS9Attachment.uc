class GRS9Attachment extends HandgunAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var Vector PreviousHitLoc;
var Emitter LaserDot;
var bool bBigLaser;
var bool bHasKnife;
var bool bHasFlash;
var bool bHasCombatLaser;
var BallisticWeapon myWeap;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bHasCombatLaser, bHasFlash, 
		bHasKnife, bLaserOn;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot, bBigLaser;
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
	if((GRS9Pistol(i) != none) && GRS9Pistol(i).bHasKnife)
	{
		bHasKnife = true;
	}
	// End:0x8D
	if((GRS9Pistol(i) != none) && GRS9Pistol(i).bHasFlash)
	{
		bHasFlash = true;
	}
	// End:0xBE
	if((GRS9Pistol(i) != none) && GRS9Pistol(i).bHasCombatLaser)
	{
		bHasCombatLaser = true;
	}
	//return;	
}

simulated function KillLaserDot()
{
	// End:0x32
	if(LaserDot != none)
	{
		LaserDot.bHidden = false;
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function SpawnLaserDot(Vector loc)
{
	// End:0x31
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BallisticProV55.IE_GRS9LaserHit',,, loc);
		LaserDot.bHidden = false;
	}
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
	// End:0xB6
	if(Laser == none)
	{
		// End:0xA1
		if(bHasCombatLaser)
		{
			Laser = Spawn(Class'BallisticProV55.LaserActor_GRSNine',,, Location);			
		}
		else
		{
			Laser = Spawn(Class'BallisticProV55.LaserActor_Third',,, Location);
		}
	}
	// End:0xD4
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x151
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x13B
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		// End:0x14C
		if(LaserDot != none)
		{
			KillLaserDot();
		}
		return;		
	}
	else
	{
		// End:0x174
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x1A7
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
	// End:0x1F0
	if(AIController(Instigator.Controller) != none)
	{
		HitLocation = mHitLocation;		
	}
	else
	{
		End = Start + (Vector(X) * float(3000));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x241
		if(Other == none)
		{
			HitLocation = End;
		}
	}
	// End:0x2BD
	if(bHasCombatLaser)
	{
		// End:0x270
		if((LaserDot == none) && Other != none)
		{
			SpawnLaserDot(HitLocation);			
		}
		else
		{
			// End:0x28E
			if((LaserDot != none) && Other == none)
			{
				KillLaserDot();
			}
		}
		// End:0x2BD
		if(LaserDot != none)
		{
			LaserDot.SetLocation(HitLocation);
			LaserDot.SetRotation(Rotator(HitNormal));
		}
	}
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(HitLocation - loc));
	Scale3D.X = VSize(HitLocation - Laser.Location) / float(128);
	// End:0x33C
	if(bBigLaser)
	{
		Scale3D.Y = 4.0000000;
		Scale3D.Z = 4.0000000;		
	}
	else
	{
		Scale3D.Y = 1.5000000;
		Scale3D.Z = 1.5000000;
	}
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
	KillLaserDot();
	super.Destroyed();
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector L, Dir;

	// End:0x1B
	if(int(Mode) == 0)
	{
		ImpactManager = default.ImpactManager;		
	}
	else
	{
		// End:0x3E
		if(bHasKnife && int(Mode) == 1)
		{
			MeleeFireEffects();
			return;			
		}
		else
		{
			// End:0x8F
			if(bHasCombatLaser && int(Mode) == 1)
			{
				// End:0x6F
				if(VSize(PreviousHitLoc - mHitLocation) < float(2))
				{
					return;
				}
				PreviousHitLoc = mHitLocation;
				ModeInfos[1].ImpactManager = Class'BallisticProV55.IM_GRS9Laser';				
			}
			else
			{
				// End:0x161
				if(bHasFlash && int(Mode) == 1)
				{
					L = Instigator.Location + Instigator.EyePosition();
					Dir = Normal(mHitLocation - L);
					// End:0x144
					if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
					{
						Spawn(Class'BallisticProV55.AM67FlashProjector', Instigator,, L + (Dir * float(25)), Rotator(Dir));						
					}
					else
					{
						Spawn(Class'BallisticProV55.AM67FlashProjector', Instigator,, GetModeTipLocation(), Rotator(Dir));
					}
					return;
				}
			}
		}
	}
	super(BallisticAttachment).InstantFireEffects(Mode);
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
	// End:0x193
	if(!bHasKnife)
	{
		Class'BallisticProV55.IM_GunHit'.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);		
	}
	else
	{
		Class'BallisticProV55.IM_MRS138TazerHit'.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.GRS9Pistol'
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	FlashScale=2.0000000
	BrassClass=Class'BallisticProV55.Brass_GRSNine'
	InstantMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Pistol'
	TracerChance=0.6000000
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FlyByMode=0
	ReloadAnim="Reload_Pistol"
	ReloadAnimRate=0.9750000
	CockAnimRate=0.7750000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.GRS9_TPm'
	DrawScale=0.0700000
}
