class TridentMachinegun extends BallisticMachinegun
	config(BallisticProV55);

var float DesiredSpeed;
var float BarrelSpeed;
var int BarrelTurn;
var() Sound BarrelSpinSound;
var() Sound BarrelStopSound;
var() Sound BarrelStartSound;
var float RotationSpeeds[3];
var() FullSound LeverUpSound;
var() FullSound LeverDownSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		SetServerTurnVelocity;
}

function SetServerTurnVelocity(int NewTVYaw, int NewTVPitch)
{
	TridentPrimaryFire(FireMode[0]).TurnVelocity.Yaw = NewTVYaw;
	TridentPrimaryFire(FireMode[0]).TurnVelocity.Pitch = NewTVPitch;
	TridentSecondaryFire(FireMode[1]).TurnVelocity.Yaw = NewTVYaw;
	TridentSecondaryFire(FireMode[1]).TurnVelocity.Pitch = NewTVPitch;
	//return;	
}

simulated event PostBeginPlay()
{
	super(BallisticWeapon).PostBeginPlay();
	TridentPrimaryFire(FireMode[0]).TridentWeapon = self;
	TridentSecondaryFire(FireMode[1]).TridentWeapon = self;
	//return;	
}

simulated function float GetRampUpSpeed()
{
	local float mult;

	mult = 1.0000000 - (BarrelSpeed / RotationSpeeds[2]);
	return 0.0750000 + ((0.0700000 * mult) * mult);
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Rotator bt;

	bt.Roll = BarrelTurn;
	SetBoneRotation('Barrels', bt);
	DesiredSpeed = RotationSpeeds[int(CurrentWeaponMode)];
	super(BallisticWeapon).WeaponTick(dt);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x26
	if(super(BallisticWeapon).PutDown())
	{
		Instigator.AmbientSound = none;
		BarrelSpeed = 0.0000000;
		return true;
	}
	return false;
	//return;	
}

simulated event Tick(float dt)
{
	local float OldBarrelTurn;

	super(BallisticWeapon).Tick(dt);
	// End:0x97
	if((FireMode[0].IsFiring() || FireMode[1].IsFiring()) && !bServerReloading)
	{
		BarrelSpeed = BarrelSpeed + FClamp(DesiredSpeed - BarrelSpeed, -0.3500000 * dt, (GetRampUpSpeed()) * dt);
		BarrelTurn += int((BarrelSpeed * float(655360)) * dt);		
	}
	else
	{
		// End:0x17A
		if(BarrelSpeed > float(0))
		{
			BarrelSpeed = FMax(BarrelSpeed - (0.5000000 * dt), 0.0100000);
			OldBarrelTurn = float(BarrelTurn);
			BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
			// End:0x17A
			if((BarrelSpeed <= 0.0250000) && int(OldBarrelTurn / 10922.6700000) < int(float(BarrelTurn) / 10922.6700000))
			{
				BarrelTurn = int(float(int(float(BarrelTurn) / 10922.6700000)) * 10922.6700000);
				BarrelSpeed = 0.0000000;
				PlaySound(BarrelStopSound, 0, 0.5000000,, 32.0000000, 1.0000000, true);
				Instigator.AmbientSound = none;
			}
		}
	}
	// End:0x1BD
	if(BarrelSpeed > float(0))
	{
		Instigator.AmbientSound = BarrelSpinSound;
		Instigator.SoundPitch = byte(float(32) + (float(96) * BarrelSpeed));
	}
	// End:0x1E1
	if(ThirdPersonActor != none)
	{
		TridentAttachment(ThirdPersonActor).BarrelSpeed = BarrelSpeed;
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x20
	if(int(newmode) == 255)
	{
		newmode = byte(int(CurrentWeaponMode) + 1);
	}
	J0x20:

	// End:0x86 [Loop If]
	if((int(newmode) != int(CurrentWeaponMode)) && (int(newmode) >= WeaponModes.Length) || WeaponModes[int(newmode)].bUnavailable)
	{
		// End:0x7C
		if(int(newmode) >= WeaponModes.Length)
		{
			newmode = 0;			
		}
		else
		{
			newmode++;
		}
		// [Loop Continue]
		goto J0x20;
	}
	// End:0xA9
	if(!WeaponModes[int(newmode)].bUnavailable)
	{
		CurrentWeaponMode = newmode;
	}
	//return;	
}

simulated function float ChargeBar()
{
	return BarrelSpeed / DesiredSpeed;
	//return;	
}

simulated function Notify_LeverUp()
{
	// End:0x6A
	if(int(Level.NetMode) != int(NM_Client))
	{
		PlayOwnedSound(LeverUpSound.Sound, LeverUpSound.Slot, LeverUpSound.Volume, LeverUpSound.bNoOverride, LeverUpSound.Radius, LeverUpSound.Pitch, LeverUpSound.bAtten);		
	}
	else
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LeverUpSound);
	}
	//return;	
}

simulated function Notify_LeverDown()
{
	// End:0x6A
	if(int(Level.NetMode) != int(NM_Client))
	{
		PlayOwnedSound(LeverDownSound.Sound, LeverDownSound.Slot, LeverDownSound.Volume, LeverDownSound.bNoOverride, LeverDownSound.Radius, LeverDownSound.Pitch, LeverDownSound.bAtten);		
	}
	else
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LeverDownSound);
	}
	//return;	
}

simulated function PlayReload()
{
	PlayAnim('ReloadHold', ReloadAnimRate,, int(0.2500000));
	//return;	
}

simulated function Notify_M353FlapOpenedReload()
{
	PlayReload();
	//return;	
}

simulated function Notify_CockAfterReload()
{
	// End:0x21
	if(bNeedCock && MagAmmo > 0)
	{
		CommonCockGun(2);		
	}
	else
	{
		PlayAnim('ReloadFinishHold', ReloadAnimRate, 0.2000000);
	}
	//return;	
}

simulated function PositionSights()
{
	super(BallisticWeapon).PositionSights();
	// End:0x30
	if(SightingPhase <= 0.0000000)
	{
		SetBoneRotation('TopHandle', rot(0, 0, 0));		
	}
	else
	{
		// End:0x5A
		if(SightingPhase >= 1.0000000)
		{
			SetBoneRotation('TopHandle', rot(0, 0, -8192));			
		}
		else
		{
			SetBoneRotation('TopHandle', Class'BCoreProV55.BUtil'.static.RSmerp(SightingPhase, rot(0, 0, 0), rot(0, 0, -8192)));
		}
	}
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x2B
	if((FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0x70
	if(((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	return false;
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.7500000, dist, 1024.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

defaultproperties
{
	BarrelSpinSound=Sound'IndoorAmbience.machinery14'
	BarrelStopSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelStop'
	BarrelStartSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelStart'
	RotationSpeeds[0]=0.2300000
	RotationSpeeds[1]=0.3400000
	RotationSpeeds[2]=0.5100000
	LeverUpSound=(Sound=Sound'BWBP_APC_Sounds.CruMG.MG-LeverUp',Volume=0.0000000,Radius=0.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	LeverDownSound=(Sound=Sound'BWBP_APC_Sounds.CruMG.MG-LeverDown',Volume=0.0000000,Radius=0.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	BeltBones[0]="Bullet2"
	BeltBones[1]="Bullet2"
	BeltBones[2]="Bullet3"
	BeltBones[3]="Bullet4"
	BeltBones[4]="Bullet5"
	BeltBones[5]="Bullet6"
	BeltBones[6]="Bullet7"
	BeltBones[7]="Bullet8"
	BeltBones[8]="Bullet9"
	BeltBones[9]="Bullet10"
	BoxOnSound=(Sound=Sound'BWBP_APC_Sounds.CruMG.MG-BoxOn',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	BoxOffSound=(Sound=Sound'BWBP_APC_Sounds.CruMG.MG-BoxOff',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlapUpSound=(Sound=Sound'BWBP_APC_Sounds.CruMG.MG-FlapUp',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlapDownSound=(Sound=Sound'BWBP_APC_Sounds.CruMG.MG-FlapDown',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;25.0;0.7;-1.0;0.4;0.4;-999.0")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BWBP_APC_Pro.TridentMachinegunWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_APC_Pro.TridentMachinegunWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.TridentMachinegunWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_APC_Tex.CruMG.BigIcon_CruML'
	BigIconCoords=(X1=0,Y1=50,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="800 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="1200 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="1800 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_APC_Sounds.CruMG.MG-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_APC_Sounds.CruMG.MG-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ReloadAnim="ReloadStart"
	ClipOutSound=(Sound=Sound'BWBP_APC_Sounds.CruMG.MG-BulletsOff',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_APC_Sounds.CruMG.MG-BulletsOn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]=""
	ManualLines[1]=""
	ManualLines[2]=""
	SightOffset=(X=5.0000000,Y=-0.9000000,Z=19.3000000)
	CockAnimRate=1.2500000
	CockingBringUpTime=1.6000000
	ReloadAnimRate=1.2500000
	FireModeClass[0]=Class'BWBP_APC_Pro.TridentPrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.TridentSecondaryFire'
	PutDownTime=0.6000000
	BringUpTime=1.1000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	bShowChargingBar=true
	Priority=43
	HudColor=(R=50,G=255,B=150,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	PickupClass=Class'BWBP_APC_Pro.TridentPickup'
	PlayerViewOffset=(X=-5.0000000,Y=10.0000000,Z=-16.0000000)
	AttachmentClass=Class'BWBP_APC_Pro.TridentAttachment'
	IconMaterial=Texture'BWBP_APC_Tex.CruMG.SmallIcon_CruML'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="[B] Trident Splitter Machinegun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_APC_Anim.CruMG_FPm'
	DrawScale=0.3500000
}
