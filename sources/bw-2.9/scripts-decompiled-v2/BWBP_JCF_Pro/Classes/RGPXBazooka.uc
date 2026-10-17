class RGPXBazooka extends BallisticWeapon
	config(BallisticProV55);

struct RevInfo
{
	var() name BoneName;
};

var bool bLaserOn;
var LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var bool bNowEmpty;
var() RevInfo MiniRocketBones[7];
var() name FlakBone;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;
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
		RGPXAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
	// End:0x62
	if(!IsInState('DualAction') && !IsInState('PendingDualAction'))
	{
		PlayIdle();
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x4C
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor');
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
		RGPXAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
		LaserDot = Spawn(Class'BWBP_JCF_Pro.RGPXLaserDot',,, loc);
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
			RGPXAttachment(ThirdPersonActor).bLaserOn = false;
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

simulated function HideMiniRockets()
{
	SetBoneScale(MagAmmo + 2, 0.0000000, MiniRocketBones[MagAmmo - 1].BoneName);
	//return;	
}

simulated function HideFlak()
{
	local int i;

	SetBoneScale(1, 0.0000000, FlakBone);
	i = 0;
	J0x18:

	// End:0x52 [Loop If]
	if(i <= 6)
	{
		SetBoneScale(i + 2, 0.0000000, MiniRocketBones[i].BoneName);
		i++;
		// [Loop Continue]
		goto J0x18;
	}
	//return;	
}

simulated function Notify_ShowMiniRockets()
{
	local int i, j;

	// End:0x41
	if((default.MagAmmo - MagAmmo) > Ammo[0].AmmoAmount)
	{
		j = Ammo[0].AmmoAmount + MagAmmo;		
	}
	else
	{
		j = default.MagAmmo;
	}
	i = 0;
	J0x53:

	// End:0x90 [Loop If]
	if(i <= j)
	{
		SetBoneScale(i + 2, 1.0000000, MiniRocketBones[i].BoneName);
		i++;
		// [Loop Continue]
		goto J0x53;
	}
	//return;	
}

simulated function Notify_ShowFlak()
{
	SetBoneScale(1, 1.0000000, FlakBone);
	//return;	
}

simulated function PlayReload()
{
	// End:0x36
	if((MagAmmo == 0) && bNowEmpty)
	{
		PlayAnim('ReloadFull', ReloadAnimRate,, int(0.2500000));
		bNowEmpty = false;		
	}
	else
	{
		PlayAnim('Reload', ReloadAnimRate,, int(0.2500000));
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
	// End:0xA7
	if(dist < float(500))
	{
		Result -= 0.6000000;		
	}
	else
	{
		// End:0xC4
		if(dist > float(3000))
		{
			Result -= 0.3000000;
		}
	}
	Result += (0.2000000 - (FRand() * 0.4000000));
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
	return -0.9000000;
	//return;	
}

defaultproperties
{
	LaserOnSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserOffSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	MiniRocketBones[0]=(BoneName="Rocket1")
	MiniRocketBones[1]=(BoneName="Rocket2")
	MiniRocketBones[2]=(BoneName="Rocket3")
	MiniRocketBones[3]=(BoneName="Rocket4")
	MiniRocketBones[4]=(BoneName="Rocket5")
	MiniRocketBones[5]=(BoneName="Rocket6")
	MiniRocketBones[6]=(BoneName="ihateiteration")
	FlakBone="RocketMain"
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;35.0;1.0;80.0;0.8;0.8;1.0")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BWBP_JCF_Pro.RGPXWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_JCF_Pro.RGPXWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_JCF_Pro.RGPXWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_JCF_Pro.RGPXWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_JCF_Tex.RGP-X350.BigIcon_RGPX'
	BigIconCoords=(X1=0,Y1=36,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Rocket",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Lever',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_JCF_Sounds.RGX.RGX_RocketOut',Volume=2.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_JCF_Sounds.RGX.RGX_RocketIn',Volume=2.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50Out',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M353OutA',USize1=128,VSize1=128,USize2=256,VSize2=256,Color1=(R=255,G=127,B=0,A=180),Color2=(R=255,G=255,B=255,A=119),StartSize1=107,StartSize2=77)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	bWT_Super=true
	ManualLines[0]="Fires a rocket. These rockets have an arming delay and will ricochet off surfaces when unarmed."
	ManualLines[1]="Flak Shot"
	ManualLines[2]="Regular Laser (Non Guidance)"
	SightPivot=(Pitch=0,Yaw=-512,Roll=0)
	SightOffset=(X=-5.0000000,Y=-26.2500000,Z=24.4000000)
	FireModeClass[0]=Class'BWBP_JCF_Pro.RGPXPrimaryFire'
	FireModeClass[1]=Class'BWBP_JCF_Pro.RGPXSecondaryFire'
	SelectAnimRate=0.9000000
	PutDownAnimRate=0.9000000
	PutDownTime=1.6000000
	BringUpTime=1.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="Every country on Earth has their own way to deal with the looming Skrith threat, ZTV Exports has several eastern offerings to combat the foriegn invaders from beyond the stars.  While most of them have armor penetrating capabilities, not a lot of them can tackle heavy threats like the Cryons, suffering several defeats at the hands of the mechanical behemoths. Looking back at their history, ZTV managed to unearth some old RPGs and modified them into the new RPG-350 Cluster Rocket Launcher.  While it doesn't have much explosive prowess, the blast has been known to disorient Cyron troops, stunning them long enough for them to be exposed to getting flaked by it's secondary function. It's a devastating weapon, even some brave ZTV Rocket Soldats have been insane enough to get in close and unleash a storm of flak, reducing the enemy to scraps."
	Priority=44
	HudColor=(R=255,G=150,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	PickupClass=Class'BWBP_JCF_Pro.RGPXPickup'
	PlayerViewOffset=(X=5.0000000,Y=20.0000000,Z=-22.0000000)
	AttachmentClass=Class'BWBP_JCF_Pro.RGPXAttachment'
	IconMaterial=Texture'BWBP_JCF_Tex.RGP-X350.SmallIcon_RGPX'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="RPG-350 Cluster Rocket Launcher"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_JCF_Anims.RGPX_FPm'
	DrawScale=0.6000000
}
