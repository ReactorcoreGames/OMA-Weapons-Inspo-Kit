class HydraBazooka extends BallisticWeapon
	config(BallisticProV55);

var() FullSound HatchSound;
var() IntRange LaserAimSpread;
var() name ReloadAimedAnim;
var Actor CurrentRocket;
var float LastSendTargetTime;
var Vector TargetLocation;
var bool bLaserOn;
var LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var Rotator BarrelRot;
var float MultiRockets;
var float MaxMultiRockets;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;
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

function ServerWeaponSpecial(optional byte i)
{
	// End:0x0B
	if(bServerReloading)
	{
		return;
	}
	ServerSwitchLaser(!bLaserOn);
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		HydraAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0x6D
	if(bLaserOn)
	{
		WeaponModes[0].bUnavailable = true;
		WeaponModes[1].bUnavailable = false;
		CurrentWeaponMode = 1;
		ServerSwitchWeaponMode(1);		
	}
	else
	{
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = true;
		CurrentWeaponMode = 0;
		ServerSwitchWeaponMode(0);
	}
	// End:0xB3
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	// End:0x44
	if(bLaserOn)
	{
		WeaponModes[0].bUnavailable = true;
		WeaponModes[1].bUnavailable = false;
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);		
	}
	else
	{
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = true;
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
		Laser = Spawn(Class'BallisticProV55.LaserActor_G5Painter');
	}
	// End:0x85
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0xBA
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
	}
	// End:0xE0
	if(ThirdPersonActor != none)
	{
		HydraAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
		LaserDot = Spawn(Class'BWBP_APC_Pro.HydraLaserDot',,, loc);
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
			HydraAttachment(ThirdPersonActor).bLaserOn = false;
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
	HitLocation = Class'BCoreProV55.BUtil'.static.ConvertFOVs(Instigator.Location + Instigator.EyePosition(), Instigator.GetViewRotation(), End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x292
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
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
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

simulated function Notify_HydraHatchOpen()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	HydraPrimaryFire(FireMode[0]).FlashHatchSmoke();
	//return;	
}

simulated function Notify_RotateBarrelArray()
{
	RotateHydraBones();
	//return;	
}

simulated function RotateHydraBones()
{
	SetBoneRotation('BarrelArray', BarrelRot);
	//return;	
}

simulated function float ChargeBar()
{
	return MultiRockets / MaxMultiRockets;
	//return;	
}

function Vector GetRocketDir()
{
	local Vector Start, End, HitLocation, HitNormal, AimDir;

	local Actor Other;

	AimDir = BallisticFire(FireMode[0]).GetFireDir(Start);
	End = Start + (Normal(AimDir) * float(32768));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	HitLocation = End;
	return HitLocation;
	//return;	
}

function Vector GetSwoopRocketDir(Vector Start, Vector End, float LaunchTime)
{
	local Vector NewLoc;
	local float t;

	t = FMin(1.0000000, (Level.TimeSeconds - LaunchTime) / (HydraSecondaryFire(FireMode[1]).FireRate * float(2)));
	// End:0x80
	if(VSize(End - Start) > float(100))
	{
		NewLoc = Start + ((t * t) * (End - Start));		
	}
	else
	{
		NewLoc = End;
	}
	return NewLoc;
	//return;	
}

simulated function CommonStartReload(optional byte i)
{
	local int M;

	// End:0x18
	if(int(ClientState) == int(2))
	{
		ClientState = 4;
	}
	// End:0x2C
	if(bShovelLoad)
	{
		ReloadState = 4;		
	}
	else
	{
		ReloadState = 1;
	}
	PlayReload();
	M = 0;
	J0x41:

	// End:0x82 [Loop If]
	if(M < 2)
	{
		// End:0x78
		if(bFireMode[M] != none)
		{
			bFireMode[M].ReloadingGun(i);
		}
		M++;
		// [Loop Continue]
		goto J0x41;
	}
	// End:0x93
	if(bCockAfterReload)
	{
		bNeedCock = true;
	}
	// End:0xB1
	if(bCockOnEmpty && MagAmmo < 1)
	{
		bNeedCock = true;
	}
	bNeedReload = false;
	//return;	
}

simulated function PlayShovelLoop()
{
	// End:0x70
	if((Instigator.Base != none) && VSize(Instigator.Velocity - Instigator.Base.Velocity) < float(50))
	{
		SafePlayAnim(ReloadAimedAnim, ReloadAnimRate * 1.5000000, 0.0000000,, "RELOAD");		
	}
	else
	{
		super.PlayShovelLoop();
	}
	//return;	
}

simulated function PlayReload()
{
	// End:0x39
	if((bShovelLoad && bScopeView) && int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;		
	}
	else
	{
		super.PlayReload();
	}
	//return;	
}

simulated function SkipReload()
{
	// End:0x16
	if(!bScopeView)
	{
		super.SkipReload();
		return;		
	}
	else
	{
		// End:0xB0
		if((((int(ReloadState) == int(5)) || int(ReloadState) == int(6)) || int(ReloadState) == int(3)) || int(ReloadState) == int(7))
		{
			// End:0x7B
			if(bNeedCock && MagAmmo > 0)
			{
				CommonCockGun();				
			}
			else
			{
				bNeedCock = false;
				ReloadState = 0;
				ReloadFinished();
				PlayIdle();
				AimComponent.Reaim(0.0500000);
			}
			return;			
		}
		else
		{
			// End:0xD3
			if(int(ReloadState) == int(1))
			{
				ReloadState = 3;
				SetAnimFrame(ClipInFrame);
			}
		}
	}
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x22
	if(Anim == ZoomInAnim)
	{
		SightingState = 3;
		ScopeUpAnimEnd();
		return;		
	}
	else
	{
		// End:0x41
		if(Anim == ZoomOutAnim)
		{
			SightingState = 0;
			ScopeDownAnimEnd();
			return;
		}
	}
	// End:0x8E
	if((Anim == FireMode[0].FireAnim) || (FireMode[1] != none) && Anim == FireMode[1].FireAnim)
	{
		bPreventReload = false;
	}
	// End:0xFE
	if((MeleeFireMode != none) && Anim == MeleeFireMode.FireAnim)
	{
		// End:0xCE
		if(int(MeleeState) == int(4))
		{
			MeleeState = 1;			
		}
		else
		{
			MeleeState = 0;
		}
		ReloadState = 0;
		// End:0xF6
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		bPreventReload = false;
	}
	// End:0x179
	if((Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0.0000000);
		// End:0x171
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		bPreventReload = false;
	}
	// End:0x326
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0x223
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x292
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x2AA
				if(int(MeleeState) < int(2))
				{
					bPreventReload = false;
				}
			}
		}
		// End:0x326
		if(((Channel == 0) && bNeedReload || ((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring) && int(MeleeState) < int(2))
		{
			PlayIdle();
		}
	}
	// End:0x346
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x3AB
	if(int(ReloadState) == int(6))
	{
		// End:0x39B
		if((MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			ReloadState = 7;
			// End:0x398
			if(!bScopeView)
			{
				PlayShovelEnd();
				return;
			}			
		}
		else
		{
			ReloadState = 5;
			PlayShovelLoop();
			return;
		}
	}
	// End:0x41E
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x3EC
		if(bNeedCock && MagAmmo > 0)
		{
			CommonCockGun();			
		}
		else
		{
			bNeedCock = false;
			ReloadState = 0;
			ReloadFinished();
			PlayIdle();
			AimComponent.Reaim(0.0500000);
		}
		return;
	}
	// End:0x45E
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	// End:0x494
	if(int(ReloadState) == int(9))
	{
		// End:0x486
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		ReloadState = 0;
		PlayIdle();
	}
	//return;	
}

simulated function bool CanUseSights()
{
	// End:0x76
	if((((((SprintControl != none) && SprintControl.bSprinting) || int(ClientState) == int(2)) || int(ClientState) == int(3)) || !bScopeView && int(ReloadState) != int(0)) || int(MeleeState) != int(0))
	{
		return false;
	}
	return true;
	//return;	
}

simulated function bool CheckScope()
{
	// End:0x1A
	if(Level.TimeSeconds < NextCheckScopeTime)
	{
		return true;
	}
	NextCheckScopeTime = Level.TimeSeconds + 0.2500000;
	// End:0xDD
	if(((AimComponent.IsDisplaced() || (!bScopeView && int(ReloadState) != int(0)) && int(ReloadState) != int(8)) || (int(Instigator.Controller.bRun) == 0) && int(Instigator.Physics) == int(1)) || (SprintControl != none) && SprintControl.bSprinting)
	{
		StopScopeView();
		return false;
	}
	return true;
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
	local float dist, rating;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	// End:0x60
	if(Vehicle(B.Enemy) != none)
	{
		return 1.2000000;
	}
	rating = super.GetAIRating();
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0xB2
	if(dist < float(1024))
	{
		return 0.4000000;
	}
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 3072.0000000, 4096.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.9000000;
	//return;	
}

defaultproperties
{
	LaserAimSpread=(Min=0,Max=256)
	ReloadAimedAnim="ReloadLoopAimed"
	LaserOnSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserOffSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	BarrelRot=(Pitch=0,Yaw=0,Roll=-10923)
	MaxMultiRockets=6.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;40.0;1.0;80.0;0.6;4.0;1.2")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BWBP_APC_Pro.HydraWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_APC_Pro.HydraWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.HydraWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_APC_Pro.HydraWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_APC_Tex.RL.BigIcon_CruRL'
	BigIconCoords=(X1=0,Y1=36,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="HV Rockets",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Guided Rockets",bUnavailable=true,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNonCocking=true
	ReloadAnim="ReloadLoop"
	ClipInSound=(Sound=Sound'BWBP_APC_Sounds.Launcher.Launcher-RelSlideClosed',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCanSkipReload=true
	bShovelLoad=true
	StartShovelAnim="ReloadPrep"
	EndShovelAnim="ReloadFinish"
	NDCrosshairCfg=(Pic1=TexRotator'BW_Core_WeaponTex.NovaStaff.NovaOutA-Rot',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc11',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=0,A=236),Color2=(R=100,G=0,B=0,A=236),StartSize1=121,StartSize2=43)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	bWT_Super=true
	ManualLines[0]="Fires a rocket. These rockets have an arming delay and will ricochet off surfaces when unarmed.|In Laser mode, the rocket flies directly to the point of aim."
	ManualLines[1]="Builds up between One and Six rockets to be shot. The beep indicates the addition of a rocket into the charged shot. Upon fired, the rockets will cone around the target in the shape of a hexagon, to ensure the rockets dont colide and enclose the target. These rockets are affected by the guidance laser."
	ManualLines[2]="Weapon Function Toggles the guidance laser. With the guidance laser active, rockets will fly towards the point indicated by the laser at any given time.|The Robotic Arm enables the weapon to be reloaded while aiming down sights. This reload will be much faster than standard reload and can be used in a defensive position"
	SightingTime=0.5000000
	SightOffset=(X=-10.0000000,Y=-10.0000000,Z=15.0000000)
	StartShovelAnimRate=1.2500000
	EndShovelAnimRate=1.2500000
	FireModeClass[0]=Class'BWBP_APC_Pro.HydraPrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.HydraSecondaryFire'
	SelectAnimRate=0.6000000
	PutDownAnimRate=0.8000000
	PutDownTime=1.4000000
	BringUpTime=1.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bShowChargingBar=true
	Description="Many centuries have gone by since the introduction of the rocket, though the method has remained the same of launching explosive ordinance through tubes, the tech has improved tenfold.  Now as the second skrith wars rage on, the pinnacle of rocket launchers has reached its pinnacle with the M-11X ''Hydra'' MRL.  With 6 barrels ready to launch rockets, it is a multi-purpose launcher, able to lock on to anything, or it can fire them unguided or even in a swooping manner to get over obstacles.  Normally the user would have to load the rockets by hand, taking valuable time in the battlefield, but the Hydra comes with a Hytek arm that automatically pulls the ammo and loads it into the chamber without the user's input whatsoever."
	Priority=44
	HudColor=(R=50,G=50,B=50,A=255)
	CenteredOffsetY=10.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	PickupClass=Class'BWBP_APC_Pro.HydraPickup'
	PlayerViewOffset=(X=2.0000000,Y=11.0000000,Z=-7.0000000)
	AttachmentClass=Class'BWBP_APC_Pro.HydraAttachment'
	IconMaterial=Texture'BWBP_APC_Tex.RL.SmallIcon_CruRL'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="M11-X Hydra MRL"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_APC_Anim.CruRL_FPm'
	DrawScale=0.3000000
}
