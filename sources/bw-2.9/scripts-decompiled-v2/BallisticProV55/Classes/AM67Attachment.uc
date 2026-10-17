class AM67Attachment extends HandgunAttachment;

var bool bHasCombatLaser;
var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var BallisticWeapon myWeap;
var Vector PreviousHitLoc;
var Emitter LaserDot;
var float LaserSizeAdjust;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bHasCombatLaser, bLaserOn;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot, LaserSizeAdjust;
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
	if((AM67Pistol(i) != none) && AM67Pistol(i).bHasCombatLaser)
	{
		bHasCombatLaser = true;
	}
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector L, Dir;

	// End:0x28
	if(int(Mode) == 0)
	{
		ImpactManager = default.ImpactManager;
		super(BallisticAttachment).InstantFireEffects(Mode);
		return;		
	}
	else
	{
		// End:0x7D
		if(bHasCombatLaser && int(Mode) == 1)
		{
			// End:0x59
			if(VSize(PreviousHitLoc - mHitLocation) < float(2))
			{
				return;
			}
			PreviousHitLoc = mHitLocation;
			ImpactManager = Class'BallisticProV55.IM_GRS9Laser';
			super(BallisticAttachment).InstantFireEffects(Mode);			
		}
		else
		{
			L = Instigator.Location + Instigator.EyePosition();
			Dir = Normal(mHitLocation - L);
			// End:0x11A
			if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
			{
				Spawn(Class'BallisticProV55.AM67FlashProjector', Instigator,, L + (Dir * float(25)), Rotator(Dir));				
			}
			else
			{
				Spawn(Class'BallisticProV55.AM67FlashProjector', Instigator,, GetModeTipLocation(Mode), Rotator(Dir));
			}
		}
	}
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	local Rotator R;
	local float DF;

	// End:0x3C
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x141
	if((int(Mode) != 0) && AltMuzzleFlashClass != none)
	{
		// End:0x8C
		if(AltMuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
		}
		Emitter(AltMuzzleFlash).Emitters[0].StartSizeRange.X.Min = ((200.0000000 + (DF * float(600))) * DrawScale) * FlashScale;
		Emitter(AltMuzzleFlash).Emitters[0].StartSizeRange.X.Max = Emitter(AltMuzzleFlash).Emitters[0].StartSizeRange.X.Min;
		AltMuzzleFlash.Trigger(self, Instigator);		
	}
	else
	{
		// End:0x1C5
		if((int(Mode) == 0) && MuzzleFlashClass != none)
		{
			// End:0x191
			if(MuzzleFlash == none)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
			}
			MuzzleFlash.Trigger(self, Instigator);
			// End:0x1C5
			if(bRandomFlashRoll)
			{
				SetBoneRotation(FlashBone, R, 0, 1.0000000);
			}
		}
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
	// End:0x361
	if(bHasCombatLaser)
	{
		Scale3D.Y = 2.5000000 * (float(1) + (float(4) * FMax(0.0000000, LaserSizeAdjust - 0.5000000)));
		Scale3D.Z = Scale3D.Y;		
	}
	else
	{
		Scale3D.Y = 1.0000000;
		Scale3D.Z = 1.0000000;
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

defaultproperties
{
	WeaponClass=Class'BallisticProV55.AM67Pistol'
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	AltFlashBone="ejector"
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	FlashMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Pistol'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_Pistol"
	ReloadAnimRate=0.9500000
	CockAnimRate=0.8500000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.AM67_TPm'
	DrawScale=0.1400000
}
