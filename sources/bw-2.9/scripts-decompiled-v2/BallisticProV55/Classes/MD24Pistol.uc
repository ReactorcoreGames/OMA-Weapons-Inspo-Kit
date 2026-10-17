class MD24Pistol extends BallisticHandgun
	config(BallisticProV55);

var bool bLaserOn;
var bool bStriking;
var() bool bHasKnife;
var LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var name BulletBone;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasKnife = false;
	// End:0x59
	if(InStr(WeaponParams.LayoutTags, "tacknife") != -1)
	{
		bHasKnife = true;
		MeleeFireMode.Damage = 70.0000000;
	}
	//return;	
}

simulated function Notify_ClipIn()
{
	super(BallisticWeapon).Notify_ClipIn();
	SetBoneScale(0, 1.0000000, BulletBone);
	//return;	
}

simulated function Notify_ClipOut()
{
	super(BallisticWeapon).Notify_ClipOut();
	// End:0x22
	if(MagAmmo < 1)
	{
		SetBoneScale(0, 0.0000000, BulletBone);
	}
	//return;	
}

simulated function bool SlaveCanUseMode(int Mode)
{
	// End:0x4F
	if(MD24Pistol(OtherGun) != none)
	{
		return (Mode == 0) || (Mode == 1) && Level.TimeSeconds >= FireMode[Mode].NextFireTime;
	}
	return Mode == 0;
	//return;	
}

simulated function bool MasterCanSendMode(int Mode)
{
	// End:0x1A
	if(MD24Pistol(OtherGun) != none)
	{
		return Mode < 2;
	}
	return Mode == 0;
	//return;	
}

simulated function bool CanAlternate(int Mode)
{
	// End:0x22
	if((MD24Pistol(OtherGun) == none) && Mode != 0)
	{
		return false;		
	}
	else
	{
		// End:0x34
		if(MD24Pistol(OtherGun) != none)
		{
			return true;
		}
	}
	return super.CanAlternate(Mode);
	//return;	
}

simulated function PlayIdle()
{
	super(BallisticWeapon).PlayIdle();
	// End:0x54
	if((((!bLaserOn || bPendingSightUp) || int(SightingState) != int(0)) || bScopeView) || !CanPlayAnim(IdleAnim,, "IDLE"))
	{
		return;
	}
	FreezeAnimAt(0.0000000);
	//return;	
}

simulated function OnLaserSwitched()
{
	// End:0x12
	if(bLaserOn)
	{
		ApplyLaserAim();		
	}
	else
	{
		AimComponent.Recalculate();
	}
	//return;	
}

simulated function OnAimParamsChanged()
{
	super(BallisticWeapon).OnAimParamsChanged();
	// End:0x15
	if(bLaserOn)
	{
		ApplyLaserAim();
	}
	//return;	
}

simulated function ApplyLaserAim()
{
	AimComponent.AimAdjustTime *= 1.5000000;
	AimComponent.AimSpread.Max *= 0.6500000;
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x45
	if(bLaserOn != default.bLaserOn)
	{
		OnLaserSwitched();
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
		MD24Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	OnLaserSwitched();
	// End:0x51
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	OnLaserSwitched();
	// End:0x2C
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
	// End:0x68
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
	// End:0x106
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'OpenIdle';
		ReloadAnim = 'OpenReload';
		SelectAnim = 'PulloutOpen';
		PutDownAnim = 'PutawayOpen';		
	}
	else
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';
		SelectAnim = 'Pullout';
		PutDownAnim = 'putaway';
	}
	// End:0x158
	if(ThirdPersonActor != none)
	{
		MD24Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
		LaserDot = Spawn(Class'BallisticProV55.MD24LaserDot',,, loc);
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
			MD24Attachment(ThirdPersonActor).bLaserOn = false;
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
	loc = GetBoneCoords('tip2').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xE7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x18B
	if(((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000) && (Level.TimeSeconds - FireMode[1].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x1AD
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x2CD
	if(((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000) && (Level.TimeSeconds - FireMode[1].NextFireTime) > 0.2000000)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip2');
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

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x2D
	if(Anim != 'PrepMelee')
	{
		bStriking = false;
	}
	// End:0x109
	if((((((Anim == 'OpenFire') || Anim == 'Fire') || Anim == CockAnim) || Anim == ReloadAnim) || Anim == DualReloadAnim) || Anim == DualReloadEmptyAnim)
	{
		// End:0xDD
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'OpenIdle';
			ReloadAnim = 'OpenReload';
			SelectAnim = 'PulloutOpen';
			PutDownAnim = 'PutawayOpen';			
		}
		else
		{
			IdleAnim = 'Idle';
			ReloadAnim = 'Reload';
			SelectAnim = 'Pullout';
			PutDownAnim = 'putaway';
		}
	}
	super.AnimEnd(Channel);
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

simulated function OnScopeViewChanged()
{
	super(BallisticWeapon).OnScopeViewChanged();
	// End:0x5E
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		// End:0x45
		if(bScopeView)
		{
			bFireMode[0].FireAnim = 'SightOpenFire';			
		}
		else
		{
			bFireMode[0].FireAnim = 'NewOpenFire';
		}		
	}
	else
	{
		// End:0x80
		if(bScopeView)
		{
			bFireMode[0].FireAnim = 'SightFire';			
		}
		else
		{
			bFireMode[0].FireAnim = 'NewFire';
		}
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
	local float dist, rating;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	rating = super.GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 768.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.8000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.8000000;
	//return;	
}

defaultproperties
{
	LaserOnSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserOffSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	BulletBone="Bullet"
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;10.0;-999.0;25.0;0.0;0.0;-999.0")
	AIReloadTime=1.5000000
	ParamsClasses[0]=Class'BallisticProV55.MD24WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.MD24WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.MD24WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.MD24WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.MD24.BigIcon_MD24'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Pullout',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_Cock',Volume=0.6750000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_ClipHit',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_ClipHit',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_ClipOut',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_ClipIn',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.5800000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc1',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M806InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=255,B=0,A=140),Color2=(R=255,G=0,B=0,A=162),StartSize1=76,StartSize2=101)
	NDCrosshairInfo=(SpreadRatios=(X1=0.7500000,Y1=0.7500000,X2=0.3000000,Y2=0.3000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	MeleeFireClass=Class'BallisticProV55.MD24MeleeFire'
	bWT_Bullet=true
	ManualLines[0]="Low-recoil pistol fire. Has the option of burst fire. Very controllable."
	ManualLines[1]="Prepares a bludgeoning attack, which will be executed upon release. The damage of the attack increases the longer altfire is held, up to 1.5 seconds for maximum damage output. As a blunt attack, has lower base damage compared to bayonets but inflicts a short-duration blinding effect when striking. This attack inflicts more damage from behind."
	ManualLines[2]="The Weapon Function key toggles a laser sight, which reduces the spread of the weapon's hipfire, but exposes the user's position to the enemy. This laser sight makes the MD24 a strong choice for dual wielding.||Effective at close range."
	SightOffset=(X=-7.0000000,Y=0.0000000,Z=1.7000000)
	CockingBringUpTime=1.0000000
	FireModeClass[0]=Class'BallisticProV55.MD24PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.MD24SecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="The MD24 is a lightweight, medium powered pistol, recently developed by the internal UTC Defense Tech manufacturer for those troops in need of the simple maneuverability. The MD24 is primarily made up of specialised polymers and lightweight metals to make it useful to stealth and Commando units. Fitted with a stock laser pointing device, the MD24 is an easy to use sidearm, especially useful in tight spots."
	Priority=19
	HudColor=(R=50,G=150,B=25,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=6
	PickupClass=Class'BallisticProV55.MD24Pickup'
	PlayerViewOffset=(X=5.0000000,Y=2.5000000,Z=-5.0000000)
	AttachmentClass=Class'BallisticProV55.MD24Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.MD24.SmallIcon_MD24'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="MD24 Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.MD24_FPm'
	DrawScale=0.3000000
}
