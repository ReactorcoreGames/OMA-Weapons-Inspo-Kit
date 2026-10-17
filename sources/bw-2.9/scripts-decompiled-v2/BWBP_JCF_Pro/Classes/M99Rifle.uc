class M99Rifle extends BallisticWeapon
	config(BallisticProV55);

var bool bLaserOn;
var LaserActor_LAW Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var() name BulletBone;
var() FullSound BoltPullSound;
var() FullSound BoltDownSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;
}

simulated function Notify_ShowBullet()
{
	SetBoneScale(0, 1.0000000, BulletBone);
	//return;	
}

simulated function Notify_HideBullet()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, BoltDownSound, true);
	SetBoneScale(0, 0.0000000, BulletBone);
	//return;	
}

simulated function Notify_BrassOut()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, BoltPullSound, true);
	super.Notify_BrassOut();
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x24
	if((int(ReloadState) != int(0)) || int(ClientState) != int(4))
	{
		return;
	}
	bLaserOn = !bLaserOn;
	ServerSwitchLaser(bLaserOn);
	// End:0x9E
	if(bLaserOn)
	{
		PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);
		// End:0x7C
		if(LaserDot == none)
		{
			LaserDot = Spawn(Class'BWBP_JCF_Pro.M99LaserDot', self,, Location);
		}
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(LaserDot, DrawScale);
		SpawnLaserDot();		
	}
	else
	{
		PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
		// End:0xC9
		if(LaserDot != none)
		{
			LaserDot.Destroy();
		}
		KillLaserDot();
	}
	//return;	
}

simulated function PlayIdle()
{
	super.PlayIdle();
	// End:0x54
	if((((!bLaserOn || bPendingSightUp) || int(SightingState) != int(0)) || bScopeView) || !CanPlayAnim(IdleAnim,, "IDLE"))
	{
		return;
	}
	FreezeAnimAt(0.0000000);
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x3F
	if(bLaserOn != default.bLaserOn)
	{
		default.bLaserOn = bLaserOn;
		ClientSwitchLaser();
	}
	super(Weapon).PostNetReceive();
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		M99Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0x4B
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	// End:0x26
	if(bLaserOn)
	{
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);		
	}
	else
	{
		KillLaserDot();
		PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
	}
	PlayIdle();
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x4C
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BWBP_SKC_Pro.LaserActor_LAW');
	}
	// End:0x85
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0xB7
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		ServerSwitchLaser(bLaserOn);
	}
	// End:0xDD
	if(ThirdPersonActor != none)
	{
		M99Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	//return;	
}

simulated function KillLaserDot()
{
	// End:0x21
	if(LaserDot != none)
	{
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function SpawnLaserDot(optional Vector loc)
{
	// End:0x20
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BWBP_JCF_Pro.M99LaserDot',,, loc);
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x32
	if(super.PutDown())
	{
		KillLaserDot();
		// End:0x30
		if(ThirdPersonActor != none)
		{
			M99Attachment(ThirdPersonActor).bLaserOn = false;
		}
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	default.bLaserOn = false;
	// End:0x1F
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x36
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function Vector ConvertFOVs(Vector InVec, float InFOV, float OutFOV, float Distance)
{
	local Vector ViewLoc, Outvec, Dir, X, Y, Z;

	local Rotator ViewRot;

	ViewLoc = Instigator.Location + Instigator.EyePosition();
	ViewRot = Instigator.GetViewRotation();
	Dir = InVec - ViewLoc;
	GetAxes(ViewRot, X, Y, Z);
	Outvec.X = Distance / Tan((OutFOV * 3.1415930) / float(360));
	Outvec.Y = ((Dir Dot Y) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec.Z = ((Dir Dot Z) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec = Outvec >> ViewRot;
	return Outvec + ViewLoc;
	//return;	
}

simulated function DrawLaserSight(Canvas Canvas)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator AimDir;
	local Actor Other;

	// End:0x4F
	if(((((int(ClientState) == int(1)) || !bLaserOn) || Instigator == none) || Instigator.Controller == none) || Laser == none)
	{
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	loc = GetBoneCoords('Laser').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xE7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x152
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x174
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x25B
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('Laser');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 1.5000000;
	Scale3D.Z = 1.5000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	super.RenderOverlays(Canvas);
	// End:0x23
	if(!IsInState('Lowered'))
	{
		DrawLaserSight(Canvas);
	}
	//return;	
}

function InitLaser(optional byte i)
{
	bLaserOn = !bLaserOn;
	ServerSwitchLaser(bLaserOn);
	//return;	
}

simulated function PlayCocking(optional byte Type)
{
	local float AdjustedCockAnimRate;

	// End:0x40
	if((int(ReloadState) != int(0)) && int(ReloadState) != int(8))
	{
		AdjustedCockAnimRate = CockAnimRate * Class'BCoreProV55.BallisticReplicationInfo'.default.ReloadScale;		
	}
	else
	{
		AdjustedCockAnimRate = CockAnimRate;
	}
	// End:0x87
	if((int(Type) == 2) && HasAnim(CockAnimPostReload))
	{
		SafePlayAnim(CockAnimPostReload, AdjustedCockAnimRate, 0.2000000,, "RELOAD");		
	}
	else
	{
		SafePlayAnim(CockAnim, AdjustedCockAnimRate, 0.2000000,, "RELOAD");
	}
	// End:0xCF
	if((int(SightingState) != int(0)) && int(Type) != 1)
	{
		TemporaryScopeDown(0.5000000);
	}
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x38
	if((!bNoMag && FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0x7D
	if(((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function bool MayNeedReload(byte Mode, float load)
{
	// End:0x0F
	if(!HasNonMagAmmo(0))
	{
		return true;
	}
	return bNeedReload;
	//return;	
}

function Notify_Deploy()
{
	local Vector HitLoc, HitNorm, Start, End;
	local Actor t;
	local Rotator CompressedEq;
	local BallisticTurret Turret;
	local float Forward;

	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x2F
	if(Instigator.HeadVolume.bWaterVolume)
	{
		return;
	}
	Start = Instigator.Location + Instigator.EyePosition();
	Forward = 75.0000000;
	J0x5F:

	// End:0x1D2 [Loop If]
	if(Forward >= float(45))
	{
		End = Start + (Vector(Instigator.Rotation) * Forward);
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0xE2
		if((t != none) && VSize(HitLoc - Start) < float(30))
		{
			return;
		}
		// End:0xF8
		if(t == none)
		{
			HitLoc = End;
		}
		End = HitLoc - vect(0.0000000, 0.0000000, 100.0000000);
		t = Trace(HitLoc, HitNorm, End, HitLoc, true, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0x1B4
		if((((t != none) && t.bWorldGeometry && (Sandbag(t) == none) || Sandbag(t).AttachedWeapon == none) && HitNorm.Z >= 0.9000000) && FastTrace(HitLoc, Start))
		{
			// [Explicit Break]
			goto J0x1D2;
		}
		// End:0x1C4
		if(Forward <= float(45))
		{
			return;
		}
		Forward -= float(15);
		// [Loop Continue]
		goto J0x5F;
	}
	J0x1D2:

	FireMode[1].bIsFiring = false;
	FireMode[1].StopFiring();
	// End:0x23D
	if(Sandbag(t) != none)
	{
		HitLoc = t.Location;
		HitLoc.Z += (Class'BWBP_JCF_Pro.M99Turret'.default.CollisionHeight + float(35));		
	}
	else
	{
		HitLoc.Z += (Class'BWBP_JCF_Pro.M99Turret'.default.CollisionHeight - float(9));
	}
	CompressedEq = Instigator.Rotation;
	CompressedEq.Pitch = (CompressedEq.Pitch >> 8) & 255;
	CompressedEq.Yaw = (CompressedEq.Yaw >> 8) & 255;
	CompressedEq.Pitch = CompressedEq.Pitch << 8;
	CompressedEq.Yaw = CompressedEq.Yaw << 8;
	Turret = Spawn(Class'BWBP_JCF_Pro.M99Turret', none,, HitLoc, Instigator.Rotation);
	// End:0x35E
	if(Turret != none)
	{
		// End:0x334
		if(Sandbag(t) != none)
		{
			Sandbag(t).AttachedWeapon = Turret;
		}
		Turret.InitDeployedTurretFor(self);
		Turret.TryToDrive(Instigator);
		Destroy();		
	}
	else
	{
		Log("Notify_Deploy: Could not spawn turret for M99 ECS Anti-Material Rifle.");
	}
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	Result += ((dist - float(1000)) / float(2000));
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

defaultproperties
{
	LaserOnSound=Sound'BW_Core_WeaponSound.TEC.RSMP-LaserClick'
	LaserOffSound=Sound'BW_Core_WeaponSound.TEC.RSMP-LaserClick'
	BulletBone="Bullet"
	BoltPullSound=(Sound=Sound'BWBP_JCF_Sounds.M99.M99-BoltPull',Volume=1.2000000,Radius=0.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	BoltDownSound=(Sound=Sound'BWBP_JCF_Sounds.M99.M99-BoltDown',Volume=1.2000000,Radius=0.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;35.0;2.0;120.0;10.0;0.0;0.0")
	ParamsClasses[0]=Class'BWBP_JCF_Pro.M99RifleWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_JCF_Pro.M99RifleWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_JCF_Pro.M99RifleWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_JCF_Pro.M99RifleWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_JCF_Tex.M99.BigIcon_M99'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Bolt-Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ZoomInAnim="ZoomIn"
	ZoomOutAnim="ZoomOut"
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=4.0000000
	MaxZoom=16.0000000
	FullZoomFOV=20.0000000
	ScopeViewTex=Texture'BWBP_JCF_Tex.M99.M99Scope2'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_JCF_Sounds.M99.M99Cock',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_JCF_Sounds.M99.M99Cock',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bNonCocking=true
	ClipHitSound=(Sound=Sound'BWBP_JCF_Sounds.M99.M99-BoltPush',Volume=1.2000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_JCF_Sounds.M99.M99-BoltUp',Volume=1.2000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_JCF_Sounds.M99.M99-BulletInsert',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc6',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc5',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=137,G=135,B=130,A=62),Color2=(R=0,G=172,B=0,A=80),StartSize1=127,StartSize2=96)
	bWT_Bullet=true
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7800000
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	SightOffset=(X=5.0000000,Y=16.0000000,Z=36.0000000)
	CockingBringUpTime=2.8000000
	GunLength=85.0000000
	FireModeClass[0]=Class'BWBP_JCF_Pro.M99PrimaryFire'
	FireModeClass[1]=Class'BWBP_JCF_Pro.M99DeployFire'
	PutDownTime=0.8000000
	BringUpTime=1.0000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bSniping=true
	Description="M99 ECS .55 Anti Material Rifle||Manufacturer: Enravion Combat Solutions|Primary: Single Powerful Shot|Secondary: Activate Zooming Scope||In the 21st century the M99 was an effective long range sniper rifle, with a high penetration power. During the Skrith wars however the M99 lost its relevance due to its slow fire rate and old ammunition. Weapons like the M75-TIC Railgun were far more effective and feared. In the middle of the war the production of the M75 was too expensive to arm every sniper with it. Thus Enravion Combat Solutions started to do researches on how to improve old firearms and they succeeded. The M99-ECS was the result. Many improvements like better materials and a high quality scope made the rifle useful again. The major improvement however was the ammunition. The new 55.cal ECS armor piercing round easily penetrates concrete wall, with minimal deformations. Due to its nano coating the 55.cal ECS projectile glides through the air with minimal aerodynamic drag. This way it keeps its high V0"
	Priority=33
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	PickupClass=Class'BWBP_JCF_Pro.M99Pickup'
	PlayerViewOffset=(X=-1.0000000,Y=-4.0000000,Z=-30.0000000)
	BobDamping=1.5000000
	AttachmentClass=Class'BWBP_JCF_Pro.M99Attachment'
	IconMaterial=Texture'BWBP_JCF_Tex.M99.SmallIcon_M99'
	IconCoords=(X1=0,Y1=20,X2=127,Y2=39)
	ItemName="M99-ECS Anti-Material Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_JCF_Anims.M99_FPm'
	DrawScale=0.1400000
}
