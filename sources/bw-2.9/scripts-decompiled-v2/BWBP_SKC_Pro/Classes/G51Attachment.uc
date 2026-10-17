class G51Attachment extends BallisticAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var BallisticWeapon myWeap;
var bool bGrenadier;
var bool bOldGrenadier;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bGrenadier, bLaserOn;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot;
}

simulated event PostNetReceive()
{
	// End:0x4C
	if(bGrenadier != bOldGrenadier)
	{
		bOldGrenadier = bGrenadier;
		// End:0x3B
		if(bGrenadier)
		{
			SetBoneScale(0, 1.0000000, 'Grenade');			
		}
		else
		{
			SetBoneScale(0, 0.0000000, 'Grenade');
		}
	}
	super.PostNetReceive();
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	SetBoneScale(0, 0.0000000, 'Grenade');
	//return;	
}

function IAOverride(bool bGrenadier)
{
	// End:0x1D
	if(bGrenadier)
	{
		SetBoneScale(0, 1.0000000, 'Grenade');		
	}
	else
	{
		SetBoneScale(0, 0.0000000, 'Grenade');
	}
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
	// End:0x74
	if((G51Carbine(i) != none) && G51Carbine(i).bSilenced)
	{
		ModeInfos[0].TracerChance = 0.0000000;
		ModeInfos[0].TracerMix = 0;
	}
	//return;	
}

simulated function Tick(float dt)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator X;
	local Actor Other;

	super.Tick(dt);
	// End:0x76
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && myWeap != none)
	{
		LaserRot = Instigator.GetViewRotation();
		LaserRot += myWeap.GetAimPivot();
		LaserRot += myWeap.GetRecoilPivot();
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
	loc = GetBoneCoords('tip2').Origin;
	End = Start + (Vector(X) * float(5000));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x20E
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
	WeaponClass=Class'BWBP_SKC_Pro.G51Carbine'
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	FlashScale=0.2000000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.9000000
	CockAnimRate=0.7750000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.G51Carbine_TPm'
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=1.3000000
	PrePivot=(X=0.0000000,Y=-1.0000000,Z=-5.0000000)
}
