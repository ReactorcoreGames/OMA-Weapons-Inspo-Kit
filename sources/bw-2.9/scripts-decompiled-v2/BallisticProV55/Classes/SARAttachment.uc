class SARAttachment extends BallisticAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var bool bHasCombatLaser;
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
	if((SARAssaultRifle(i) != none) && SARAssaultRifle(i).bHasCombatLaser)
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
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && myWeap != none)
	{
		LaserRot = Instigator.GetViewRotation() + myWeap.GetFireRot();
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
	loc = GetBoneCoords('tip2').Origin;
	End = Start + (Vector(X) * float(5000));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x224
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x2A0
	if(bHasCombatLaser)
	{
		// End:0x253
		if((LaserDot == none) && Other != none)
		{
			SpawnLaserDot(HitLocation);			
		}
		else
		{
			// End:0x271
			if((LaserDot != none) && Other == none)
			{
				KillLaserDot();
			}
		}
		// End:0x2A0
		if(LaserDot != none)
		{
			LaserDot.SetLocation(HitLocation);
			LaserDot.SetRotation(Rotator(HitNormal));
		}
	}
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(HitLocation - loc));
	Scale3D.X = VSize(HitLocation - Laser.Location) / float(128);
	// End:0x344
	if(bHasCombatLaser)
	{
		Scale3D.Y = 3.0000000 * (float(1) + (float(4) * FMax(0.0000000, LaserSizeAdjust - 0.5000000)));
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

simulated function InstantFireEffects(byte Mode)
{
	local Vector L, Dir;

	// End:0x1A
	if(int(Mode) == 0)
	{
		super.InstantFireEffects(Mode);
		return;
	}
	// End:0x6E
	if(bHasCombatLaser && int(Mode) == 1)
	{
		// End:0x4B
		if(VSize(PreviousHitLoc - mHitLocation) < float(2))
		{
			return;
		}
		PreviousHitLoc = mHitLocation;
		ImpactManager = Class'BallisticProV55.IM_GRS9Laser';
		super.InstantFireEffects(Mode);
		return;
	}
	L = Instigator.Location + Instigator.EyePosition();
	Dir = Normal(mHitLocation - L);
	// End:0x10B
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		Spawn(Class'BallisticProV55.AM67FlashProjector', Instigator,, L + (Dir * float(25)), Rotator(Dir));		
	}
	else
	{
		Spawn(Class'BallisticProV55.AM67FlashProjector', Instigator,, GetModeTipLocation(), Rotator(Dir));
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.SARAssaultRifle'
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	FlashScale=2.0000000
	BrassClass=Class'BallisticProV55.Brass_SAR'
	InstantMode=2
	FlashMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	TracerMix=-3
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=1.1000000
	bHeavy=true
	bRapidFire=true
	bAltRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.SAR12_TPm'
	DrawScale=0.1000000
	SoundRadius=256.0000000
}
