class AH250Attachment extends HandgunAttachment;

var Vector SpawnOffset;
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
	WeaponClass=Class'BWBP_SKC_Pro.AH250Pistol'
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	MeleeImpactManager=Class'BallisticProV55.IM_GunHit'
	FlashScale=0.2500000
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassBone="Scope"
	TracerClass=Class'BallisticProV55.TraceEmitter_Pistol'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_Pistol"
	ReloadAnimRate=1.0500000
	CockAnimRate=0.9500000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.AHDeagle_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=6.0000000)
	DrawScale=0.1750000
	Skins[0]=Shader'BWBP_SKC_Tex.Eagle.Eagle-MainShine'
	Skins[1]=Shader'BWBP_SKC_Tex.Eagle.Eagle-MainShine'
	Skins[2]=Texture'BWBP_SKC_Tex.Eagle.Eagle-Misc'
	Skins[3]=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeRed'
	Skins[4]=Texture'BWBP_SKC_Tex.Eagle.Eagle-Front'
	Skins[5]=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen'
}
