class HMCAttachment extends BallisticAttachment;

var bool bLaserOn;
var bool bRedTeam;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var Vector PreviousHitLoc;
var Emitter LaserDot;
var BallisticWeapon BeamCannon;
var bool bBigLaser;
var bool bGreenLaser;
var bool bOldGreenLaser;
var byte SmallCount;
var byte SmallCountOld;
var byte BlastCount;
var byte BlastCountOld;
var Material GreenLaserSkin;
var Actor Pack;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		BlastCount, LaserRot, 
		SmallCount, bBigLaser, 
		bGreenLaser, bLaserOn;

	// Pos:0x00D
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		bRedTeam;
}

simulated event PostNetReceive()
{
	// End:0x2C
	if(int(BlastCount) != int(BlastCountOld))
	{
		FiringMode = 1;
		BlastCountOld = BlastCount;
		ThirdPersonEffects();
	}
	// End:0x58
	if(int(SmallCount) != int(SmallCountOld))
	{
		FiringMode = 0;
		ThirdPersonEffects();
		SmallCountOld = SmallCount;
	}
	// End:0xC6
	if((bGreenLaser != bOldGreenLaser) && Laser != none)
	{
		// End:0x98
		if(bGreenLaser)
		{
			Laser.Skins[0] = TexPanner'BWBP_SKC_Tex.BeamCannon.LaserPannerGreen';			
		}
		else
		{
			Laser.Skins[0] = Laser.default.Skins[0];
		}
		bOldGreenLaser = bGreenLaser;
	}
	super.PostNetReceive();
	//return;	
}

function SwitchMedicLaser(bool bGreen)
{
	bGreenLaser = bGreen;
	// End:0x2F
	if(bGreenLaser)
	{
		Laser.Skins[0] = TexPanner'BWBP_SKC_Tex.BeamCannon.LaserPannerGreen';		
	}
	else
	{
		Laser.Skins[0] = Laser.default.Skins[0];
	}
	//return;	
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	super(Actor).SetOverlayMaterial(mat, Time, bOverride);
	// End:0x40
	if(Pack != none)
	{
		Pack.SetOverlayMaterial(mat, Time, bOverride);
	}
	//return;	
}

simulated function Hide(bool NewbHidden)
{
	super(xWeaponAttachment).Hide(NewbHidden);
	// End:0x2D
	if(Pack != none)
	{
		Pack.bHidden = NewbHidden;
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
	// End:0x99
	if(LaserDot == none)
	{
		// End:0x73
		if(((Instigator.PlayerReplicationInfo.Team != none) && Instigator.PlayerReplicationInfo.Team.TeamIndex == 0) || bRedTeam)
		{
			LaserDot = Spawn(Class'BallisticProV55.IE_GRS9LaserHit',,, loc);			
		}
		else
		{
			LaserDot = Spawn(Class'BWBP_SKC_Pro.IE_HMCLase',,, loc);
		}
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
	// End:0x76
	if((bLaserOn && int(Role) == int(ROLE_Authority)) && BeamCannon != none)
	{
		LaserRot = Instigator.GetViewRotation();
		LaserRot += BeamCannon.GetAimPivot();
		LaserRot += BeamCannon.GetRecoilPivot();
	}
	// End:0x91
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xF1
	if(Laser == none)
	{
		// End:0xBD
		if(bRedTeam)
		{
			Laser = Spawn(Class'BWBP_SKC_Pro.LaserActor_HMCRed',,, Location);			
		}
		else
		{
			Laser = Spawn(Class'BWBP_SKC_Pro.LaserActor_HMC',,, Location);
		}
		// End:0xF1
		if(bGreenLaser)
		{
			Laser.Skins[0] = GreenLaserSkin;
		}
	}
	// End:0x10F
	if(bLaserOn != bOldLaserOn)
	{
		bOldLaserOn = bLaserOn;
	}
	// End:0x18C
	if(((!bLaserOn || Instigator == none) || Instigator.IsFirstPerson()) || Instigator.DrivenVehicle != none)
	{
		// End:0x176
		if(!Laser.bHidden)
		{
			Laser.bHidden = true;
		}
		// End:0x187
		if(LaserDot != none)
		{
			KillLaserDot();
		}
		return;		
	}
	else
	{
		// End:0x1AF
		if(Laser.bHidden)
		{
			Laser.bHidden = false;
		}
	}
	// End:0x1E2
	if(Instigator != none)
	{
		Start = Instigator.Location + Instigator.EyePosition();		
	}
	else
	{
		Start = Location;
	}
	X = LaserRot;
	loc = GetTipLocation();
	// End:0x22B
	if(AIController(Instigator.Controller) != none)
	{
		HitLocation = mHitLocation;		
	}
	else
	{
		End = Start + (Vector(X) * float(3000));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x27C
		if(Other == none)
		{
			HitLocation = End;
		}
	}
	// End:0x2A2
	if((LaserDot == none) && Other != none)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		// End:0x2C0
		if((LaserDot != none) && Other == none)
		{
			KillLaserDot();
		}
	}
	// End:0x2EF
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		LaserDot.SetRotation(Rotator(HitNormal));
	}
	Laser.SetLocation(loc);
	Laser.SetRotation(Rotator(HitLocation - loc));
	Scale3D.X = VSize(HitLocation - Laser.Location) / float(128);
	// End:0x36E
	if(bBigLaser)
	{
		Scale3D.Y = 16.0000000;
		Scale3D.Z = 16.0000000;		
	}
	else
	{
		Scale3D.Y = 8.0000000;
		Scale3D.Z = 8.0000000;
	}
	Laser.SetDrawScale3D(Scale3D);
	//return;	
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x2B
	if(BallisticWeapon(i) != none)
	{
		BeamCannon = BallisticWeapon(i);
	}
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x54
	if(((int(Role) == int(ROLE_Authority)) && Instigator.Controller != none) && Instigator.Controller.GetTeamNum() == 0)
	{
		bRedTeam = true;
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	Pack = Spawn(Class'BWBP_SKC_Pro.HVPCPack');
	// End:0x38
	if(Instigator != none)
	{
		Instigator.AttachToBone(Pack, 'spine');
	}
	Pack.SetBoneScale(0, 0.0001000, 'Bone03');
	// End:0x89
	if(bRedTeam)
	{
		Skins[0] = Shader'BWBP_SKC_Tex.BeamCannon.RedCannonSD';
		TracerClass = Class'BallisticProV55.TraceEmitter_HVCRedLightning';
		MuzzleFlashClass = Class'BWBP_SKC_Pro.HMCRedEmitter';
		AltMuzzleFlashClass = Class'BWBP_SKC_Pro.HMCRedEmitter';
	}
	// End:0xB6
	if(int(HMCBeamCannon(Instigator.Weapon).CurrentWeaponMode) == 2)
	{
		bGreenLaser = true;
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Pack != none)
	{
		Pack.Destroy();
	}
	// End:0x2E
	if(Laser != none)
	{
		Laser.Destroy();
	}
	KillLaserDot();
	super.Destroyed();
	//return;	
}

function HMCUpdateHit(byte WeaponMode)
{
	ThirdPersonEffects();
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	// End:0x87
	if(int(Mode) == 0)
	{
		// End:0x72
		if(((Instigator.PlayerReplicationInfo.Team != none) && Instigator.PlayerReplicationInfo.Team.TeamIndex == 0) || bRedTeam)
		{
			ModeInfos[0].ImpactManager = Class'BWBP_SKC_Pro.IM_HVPCProjectile';			
		}
		else
		{
			ModeInfos[0].ImpactManager = Class'BWBP_SKC_Pro.IM_HMCBlast';
		}		
	}
	else
	{
		// End:0xA0
		if(VSize(PreviousHitLoc - mHitLocation) < float(2))
		{
			return;
		}
		PreviousHitLoc = mHitLocation;
		// End:0x110
		if(((Instigator.PlayerReplicationInfo.Team != none) && Instigator.PlayerReplicationInfo.Team.TeamIndex == 0) || bRedTeam)
		{
			ModeInfos[1].ImpactManager = Class'BallisticProV55.IM_GRS9Laser';			
		}
		else
		{
			ModeInfos[1].ImpactManager = Class'BWBP_SKC_Pro.IM_HMCLase';
		}
	}
	super.InstantFireEffects(Mode);
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.HMCBeamCannon'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	AltMuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	ImpactManager=Class'BWBP_SKC_Pro.IM_HMCBlast'
	MeleeImpactManager=Class'BallisticProV55.IM_GunHit'
	FlashScale=0.5000000
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_HMC'
	TracerChance=2.0000000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.HMC117_TPm'
	DrawScale=1.0000000
}
