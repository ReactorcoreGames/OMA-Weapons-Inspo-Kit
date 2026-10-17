class A800SkrithMinigun extends BallisticWeapon
	config(BallisticProV55);

var() bool bNoReload;
var float DesiredSpeed;
var float BarrelSpeed;
var int BarrelTurn;
var() Sound BarrelSpinSound;
var() Sound BarrelStopSound;
var() Sound BarrelStartSound;
var() Sound NoAmmoSound;
var() Sound ChargeLoadSound;
var float NextTickTime;
var Pawn Target;
var Actor Glow;
var float RotationSpeeds[3];

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		SetServerTurnVelocity;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		Target;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bNoReload = false;
	// End:0x67
	if(InStr(WeaponParams.LayoutTags, "no_reload") != -1)
	{
		// End:0x5F
		if(AIController(Instigator.Controller) != none)
		{
			bNoMag = true;
		}
		bNoReload = true;
	}
	//return;	
}

simulated exec function Reload(optional byte i)
{
	// End:0x0B
	if(bNoReload)
	{
		return;
	}
	super.Reload(i);
	//return;	
}

function ServerStartReload(optional byte i)
{
	// End:0x0B
	if(bNoReload)
	{
		return;
	}
	super.ServerStartReload(i);
	//return;	
}

function SetServerTurnVelocity(int NewTVYaw, int NewTVPitch)
{
	A800MinigunPrimaryFire(FireMode[0]).TurnVelocity.Yaw = NewTVYaw;
	A800MinigunPrimaryFire(FireMode[0]).TurnVelocity.Pitch = NewTVPitch;
	A800MinigunSecondaryFire(FireMode[1]).TurnVelocity.Yaw = NewTVYaw;
	A800MinigunSecondaryFire(FireMode[1]).TurnVelocity.Pitch = NewTVPitch;
	//return;	
}

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	//return;	
}

function InitWeaponFromTurret(BallisticTurret Turret)
{
	bNeedCock = false;
	//return;	
}

simulated function ClientInitWeaponFromTurret(BallisticTurret Turret)
{
	bNeedCock = false;
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	A800MinigunPrimaryFire(FireMode[0]).Minigun = self;
	A800MinigunSecondaryFire(FireMode[1]).Minigun = self;
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Rotator bt;
	local float bestAim, BestDist;
	local Vector Start;
	local Pawn NewTarget;

	bt.Roll = BarrelTurn;
	SetBoneRotation('BarrelArray', bt);
	DesiredSpeed = RotationSpeeds[int(CurrentWeaponMode)];
	super.WeaponTick(dt);
	// End:0x79
	if(FireMode[1].bIsFiring)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Glow, Class'BWBP_SWC_Pro.A800MinigunChargeGlow', DrawScale, self, 'tip');		
	}
	else
	{
		// End:0x90
		if(Glow != none)
		{
			Glow.Destroy();
		}
	}
	// End:0xBE
	if(bNoReload && !HasAmmo())
	{
		Instigator.Controller.SwitchToBestWeapon();
	}
	// End:0xD0
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	Start = Instigator.Location + Instigator.EyePosition();
	bestAim = 0.9950000;
	NewTarget = Instigator.Controller.PickTarget(bestAim, BestDist, Vector(Instigator.GetViewRotation()), Start, 20000.0000000);
	// End:0x165
	if(NewTarget != none)
	{
		// End:0x165
		if(NewTarget != Target)
		{
			Target = NewTarget;
		}
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x51
	if(super.PutDown())
	{
		// End:0x26
		if(A800MinigunSecondaryFire(FireMode[1]).BurstSize > 0)
		{
			return false;
		}
		// End:0x3D
		if(Glow != none)
		{
			Glow.Destroy();
		}
		AmbientSound = none;
		BarrelSpeed = 0.0000000;
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Glow != none)
	{
		Glow.Destroy();
	}
	AmbientSound = none;
	super.Destroyed();
	//return;	
}

simulated event Tick(float dt)
{
	local float OldBarrelTurn;

	super.Tick(dt);
	// End:0x89
	if(FireMode[0].IsFiring() || FireMode[1].IsFiring())
	{
		BarrelSpeed = BarrelSpeed + FClamp(DesiredSpeed - BarrelSpeed, -0.2000000 * dt, 0.4000000 * dt);
		BarrelTurn += int((BarrelSpeed * float(655360)) * dt);		
	}
	else
	{
		// End:0x163
		if(BarrelSpeed > float(0))
		{
			BarrelSpeed = FMax(BarrelSpeed - (0.2500000 * dt), 0.0100000);
			OldBarrelTurn = float(BarrelTurn);
			BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
			// End:0x163
			if((BarrelSpeed <= 0.0250000) && int(OldBarrelTurn / 10922.6700000) < int(float(BarrelTurn) / 10922.6700000))
			{
				BarrelTurn = int(float(int(float(BarrelTurn) / 10922.6700000)) * 10922.6700000);
				BarrelSpeed = 0.0000000;
				PlaySound(BarrelStopSound, 0, 0.5000000,, 32.0000000, 1.0000000, true);
				AmbientSound = none;
			}
		}
	}
	// End:0x194
	if(BarrelSpeed > float(0))
	{
		AmbientSound = BarrelSpinSound;
		SoundPitch = byte(float(32) + (float(96) * BarrelSpeed));
	}
	// End:0x1B8
	if(ThirdPersonActor != none)
	{
		A800MinigunAttachment(ThirdPersonActor).BarrelSpeed = BarrelSpeed;
	}
	// End:0x1F2
	if(((int(ClientState) == int(1)) && bNoReload) && MagAmmo == 0)
	{
		PickupClass = none;
		DropFrom(Location);
	}
	//return;	
}

simulated function SetGlowSize(float Size)
{
	// End:0x24
	if(Glow != none)
	{
		A800MinigunChargeGlow(Glow).SetSize(Size);
	}
	//return;	
}

simulated function bool CheckWeaponMode(int Mode)
{
	return super.CheckWeaponMode(Mode);
	//return;	
}

simulated function Notify_ClipIn()
{
	local int AmmoNeeded;

	// End:0x12
	if(int(ReloadState) == int(0))
	{
		return;
	}
	ReloadState = 3;
	PlayOwnedSound(ClipInSound.Sound, ClipInSound.Slot, ClipInSound.Volume, ClipInSound.bNoOverride, ClipInSound.Radius, ClipInSound.Pitch, ClipInSound.bAtten);
	// End:0xE9
	if(int(Level.NetMode) != int(NM_Client))
	{
		AmmoNeeded = default.MagAmmo - MagAmmo;
		// End:0xC7
		if(AmmoNeeded > Ammo[0].AmmoAmount)
		{
			MagAmmo += Ammo[0].AmmoAmount;			
		}
		else
		{
			MagAmmo = default.MagAmmo;
		}
		Ammo[0].UseAmmo(AmmoNeeded, true);
	}
	//return;	
}

simulated function string GetHUDAmmoText(int Mode)
{
	return string(Ammo[Mode].AmmoAmount);
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x56
	if(((FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire) || (FireMode[1] != none) && MagAmmo >= FireMode[1].AmmoPerFire)
	{
		return true;
	}
	// End:0x61
	if(bNoReload)
	{
		return false;
	}
	// End:0xEB
	if((((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire) || ((Ammo[1] != none) && FireMode[1] != none) && Ammo[1].AmmoAmount >= FireMode[1].AmmoPerFire)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x38
	if(FireMode[1].bIsFiring == true)
	{
		return FMin(FireMode[1].HoldTime / float(4), 1.0000000);		
	}
	else
	{
		return BarrelSpeed / DesiredSpeed;
	}
	//return;	
}

function byte BestMode()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy != none)
	{
		return 0;
	}
	// End:0x82
	if((Instigator.bIsCrouched && B.Squad.IsDefending(B)) && FRand() > 0.6000000)
	{
		return 1;
	}
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
	// End:0xB6
	if(dist > float(1000))
	{
		Result -= ((dist - float(1000)) / float(3000));
	}
	// End:0x108
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		Result += 0.2000000;		
	}
	else
	{
		// End:0x16A
		if(((B.Enemy.Weapon != none) && B.Enemy.Weapon.bSniping) && dist > float(500))
		{
			Result -= 0.4000000;
		}
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

defaultproperties
{
	DesiredSpeed=0.3300000
	BarrelSpinSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelSpinLoop'
	BarrelStopSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelStop'
	BarrelStartSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelStart'
	NoAmmoSound=Sound'BWBP_SWC_Sounds.SkrithMinigun.A800-NoAmmo'
	ChargeLoadSound=Sound'BWBP_SWC_Sounds.SkrithMinigun.A800-Load2'
	RotationSpeeds[0]=0.1500000
	RotationSpeeds[1]=0.3300000
	RotationSpeeds[2]=0.6600000
	SpecialInfo[0]=(Id="EvoDefs",Info="480.0;60.0;2.0;100.0;0.5;0.5;0.5")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SWC_Tex.SkrithHyperBlaster.BigIcon_HyperBlaster'
	BringUpSound=(Sound=Sound'BWBP_SWC_Sounds.SkrithMinigun.A800-Pullout',Volume=0.2180000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SWC_Sounds.SkrithMinigun.A800-Putaway',Volume=0.2180000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="600 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="2400 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=2.0000000
	MaxZoom=8.0000000
	ScopeViewTex=Texture'BWBP_SWC_Tex.SkrithHyperBlaster.HyperBlaster-Scope'
	bNoCrosshairInScope=true
	bNonCocking=true
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc7',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc10',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=88,G=80,B=160,A=137),Color2=(R=0,G=150,B=151,A=202),StartSize1=84,StartSize2=61)
	bWT_Machinegun=true
	bWT_Super=true
	PlayerSpeedFactor=0.7800000
	PlayerJumpFactor=0.7500000
	SightingTime=0.6000000
	SightOffset=(X=-15.0000000,Y=-25.0000000,Z=6.5000000)
	MagAmmo=90
	ReloadAnimRate=1.3000000
	FireModeClass[0]=Class'BWBP_SWC_Pro.A800MinigunPrimaryFire'
	FireModeClass[1]=Class'BWBP_SWC_Pro.A800MinigunSecondaryFire'
	SelectAnimRate=1.2000000
	PutDownTime=1.2000000
	BringUpTime=1.2000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	bShowChargingBar=true
	Description="One of the more devastating skrith tools of destruction, the Y11 is their answer to the XMV-850 Minigun. Able to spit out a deluge of plasma bolts at a rapid pace of fire, the Y11 can cut down anyone who isn't prepared; such was the case when only 3 skrith warriors were able to mow down a small battalion of UTC troops in the dense forests. Without their armor, the soldiers fell quickly, leaving only a few scarred survivors to tell the tale; calling them 'Warthogs' due to the voracious firepower and speed. Newer models of the Y11 have the capabilities to fire HV Plasma Rockets, making it even more potent against personnel."
	Priority=78
	CustomCrossHairColor=(R=255,G=255,B=255,A=219)
	CustomCrossHairScale=1.0088030
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	PickupClass=Class'BWBP_SWC_Pro.A800MinigunPickup'
	PlayerViewOffset=(X=25.0000000,Y=25.0000000,Z=-15.0000000)
	PlayerViewPivot=(Pitch=0,Yaw=0,Roll=-256)
	BobDamping=2.2000000
	AttachmentClass=Class'BWBP_SWC_Pro.A800MinigunAttachment'
	IconMaterial=Texture'BWBP_SWC_Tex.SkrithHyperBlaster.SmallIcon_HyperBlaster'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="A800 Skrith Hyperblaster"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SWC_Anims.A800_FPm'
	DrawScale=0.4000000
	SoundRadius=128.0000000
}
