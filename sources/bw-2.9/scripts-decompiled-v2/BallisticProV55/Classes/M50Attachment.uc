class M50Attachment extends BallisticAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var BallisticWeapon myWeap;
var bool bLightsOn;
var bool bLightsOnOld;
var Projector FlashLightProj;
var Emitter FlashLightEmitter;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn, bLightsOn;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		LaserRot;
}

simulated function Hide(bool NewbHidden)
{
	super(xWeaponAttachment).Hide(NewbHidden);
	SwitchFlashLight();
	// End:0x3B
	if(NewbHidden)
	{
		KillProjector();
		// End:0x38
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.Destroy();
		}		
	}
	else
	{
		// End:0x4A
		if(bLightsOn)
		{
			SwitchFlashLight();
		}
	}
	//return;	
}

simulated function StartProjector()
{
	// End:0x20
	if(FlashLightProj == none)
	{
		FlashLightProj = Spawn(Class'BallisticProV55.MRS138TorchProjector', self,, Location);
	}
	AttachToBone(FlashLightProj, 'tip');
	FlashLightProj.SetRelativeLocation(vect(-32.0000000, 0.0000000, 0.0000000));
	//return;	
}

simulated function KillProjector()
{
	// End:0x1E
	if(FlashLightProj != none)
	{
		FlashLightProj.Destroy();
		FlashLightProj = none;
	}
	//return;	
}

simulated function SwitchFlashLight()
{
	// End:0x91
	if(bLightsOn)
	{
		// End:0x74
		if(FlashLightEmitter == none)
		{
			FlashLightEmitter = Spawn(Class'BallisticProV55.MRS138TorchEffect', self,, Location);
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(FlashLightEmitter, DrawScale);
			AttachToBone(FlashLightEmitter, 'tip');
			FlashLightEmitter.bHidden = false;
			FlashLightEmitter.bCorona = true;
		}
		// End:0x8E
		if(!Instigator.IsFirstPerson())
		{
			StartProjector();
		}		
	}
	else
	{
		FlashLightEmitter.Destroy();
		KillProjector();
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
	// End:0xB5
	if(bLightsOn != bLightsOnOld)
	{
		SwitchFlashLight();
		bLightsOnOld = bLightsOn;
	}
	// End:0x14C
	if(bLightsOn)
	{
		// End:0x109
		if(Instigator.IsFirstPerson())
		{
			KillProjector();
			// End:0x106
			if((FlashLightEmitter != none) && FlashLightEmitter.bCorona)
			{
				FlashLightEmitter.bCorona = false;
			}			
		}
		else
		{
			// End:0x11A
			if(FlashLightProj == none)
			{
				StartProjector();
			}
			// End:0x14C
			if((FlashLightEmitter != none) && !FlashLightEmitter.bCorona)
			{
				FlashLightEmitter.bCorona = true;
			}
		}
	}
	// End:0x16C
	if(Laser == none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_Third',,, Location);
	}
	// End:0x18A
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x1F6
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x1F1
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		return;		
	}
	else
	{
		// End:0x219
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x24C
	if(Instigator != none)
	{
		Start = Instigator.Location + Instigator.EyePosition();		
	}
	else
	{
		Start = Location;
	}
	X = LaserRot;
	loc = GetBoneCoords('tip').Origin;
	End = Start + (Vector(X) * float(5000));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x2C9
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
	// End:0x2E
	if(FlashLightEmitter != none)
	{
		FlashLightEmitter.Destroy();
	}
	KillProjector();
	super.Destroyed();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.M50AssaultRifle'
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=1.0250000
	CockAnimRate=1.2000000
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M50_TPm'
	DrawScale=0.1600000
}
