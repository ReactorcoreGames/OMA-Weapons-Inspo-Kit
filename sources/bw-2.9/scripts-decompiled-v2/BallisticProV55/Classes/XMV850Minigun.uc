class XMV850Minigun extends BallisticWeapon
	config(BallisticProV55);

var float DesiredSpeed;
var float BarrelSpeed;
var int BarrelTurn;
var() Sound BarrelSpinSound;
var() Sound BarrelStopSound;
var() Sound BarrelStartSound;
var() Sound DeploySound;
var() Sound UndeploySound;
var float RotationSpeeds[3];

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		SetServerTurnVelocity;
}

function SetServerTurnVelocity(int NewTVYaw, int NewTVPitch)
{
	XMV850MinigunPrimaryFire(FireMode[0]).TurnVelocity.Yaw = NewTVYaw;
	XMV850MinigunPrimaryFire(FireMode[0]).TurnVelocity.Pitch = NewTVPitch;
	//return;	
}

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x39
	if((Instigator != none) && Instigator.IsLocallyControlled())
	{
		Shader'BW_Core_WeaponTex.XMV850.XMV850_Barrels_SD'.FallbackMaterial = Texture'BW_Core_WeaponTex.XMV850.XMV850_Barrels';
	}
	//return;	
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x30
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism())
	{
		XMV850MinigunPrimaryFire(FireMode[0]).bRequireSpool = true;
	}
	//return;	
}

function InitWeaponFromTurret(BallisticTurret Turret)
{
	bNeedCock = false;
	Ammo[0].AmmoAmount = Turret.AmmoAmount[0];
	// End:0x48
	if(!Instigator.IsLocallyControlled())
	{
		ClientInitWeaponFromTurret(Turret);
	}
	//return;	
}

simulated function ClientInitWeaponFromTurret(BallisticTurret Turret)
{
	bNeedCock = false;
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	local string S;

	super.DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(byte(255), 128, 128);
	S = (((((("XMV850Minigun: TraceCount: " $ string(XMV850MinigunPrimaryFire(FireMode[0]).TraceCount)) $ ", FireRate: ") $ string(1.0000000 / FireMode[0].FireRate)) $ "TurnVelocity: ") $ string(XMV850MinigunPrimaryFire(FireMode[0]).TurnVelocity.Pitch)) $ ", ") $ string(XMV850MinigunPrimaryFire(FireMode[0]).TurnVelocity.Yaw);
	Canvas.DrawText(S);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	XMV850MinigunPrimaryFire(FireMode[0]).Minigun = self;
	//return;	
}

simulated function float GetRampUpSpeed()
{
	local float mult;

	// End:0x5F
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena())
	{
		mult = 1.0000000 - (BarrelSpeed / RotationSpeeds[2]);
		return 0.0750000 + ((0.5000000 * Square(mult)) * (float(1) + (0.2500000 * float(int(bBerserk)))));		
	}
	else
	{
		return 0.4000000;
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Rotator bt;

	bt.Roll = BarrelTurn;
	SetBoneRotation('Barrels', bt);
	DesiredSpeed = RotationSpeeds[int(CurrentWeaponMode)];
	super.WeaponTick(dt);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x26
	if(super.PutDown())
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

	super.Tick(dt);
	// End:0x81
	if(FireMode[0].IsFiring() && !bServerReloading)
	{
		BarrelSpeed = BarrelSpeed + FClamp(DesiredSpeed - BarrelSpeed, -0.3500000 * dt, (GetRampUpSpeed()) * dt);
		BarrelTurn += int((BarrelSpeed * float(655360)) * dt);		
	}
	else
	{
		// End:0x164
		if(BarrelSpeed > float(0))
		{
			BarrelSpeed = FMax(BarrelSpeed - (0.5000000 * dt), 0.0100000);
			OldBarrelTurn = float(BarrelTurn);
			BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
			// End:0x164
			if((BarrelSpeed <= 0.0250000) && int(OldBarrelTurn / 10922.6700000) < int(float(BarrelTurn) / 10922.6700000))
			{
				BarrelTurn = int(float(int(float(BarrelTurn) / 10922.6700000)) * 10922.6700000);
				BarrelSpeed = 0.0000000;
				PlaySound(BarrelStopSound, 0, 0.5000000,, 32.0000000, 1.0000000, true);
				Instigator.AmbientSound = none;
			}
		}
	}
	// End:0x1A7
	if(BarrelSpeed > float(0))
	{
		Instigator.AmbientSound = BarrelSpinSound;
		Instigator.SoundPitch = byte(float(32) + (float(96) * BarrelSpeed));
	}
	// End:0x1CB
	if(ThirdPersonActor != none)
	{
		XMV850MinigunAttachment(ThirdPersonActor).BarrelSpeed = BarrelSpeed;
	}
	//return;	
}

simulated function bool CheckWeaponMode(int Mode)
{
	// End:0x1A
	if((Mode > 0) && FireCount >= 1)
	{
		return false;
	}
	return super.CheckWeaponMode(Mode);
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

function Notify_Deploy()
{
	local Vector HitLoc, HitNorm, Start, End;
	local Actor t;
	local Rotator CompressedEq;
	local BallisticTurret Turret;
	local int Forward;

	// End:0x1D
	if(Instigator.HeadVolume.bWaterVolume)
	{
		return;
	}
	Start = Instigator.Location + Instigator.EyePosition();
	Forward = 75;
	J0x4A:

	// End:0x1E6 [Loop If]
	if(Forward >= 45)
	{
		End = Start + (Vector(Instigator.Rotation) * float(Forward));
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0xCD
		if((t != none) && VSize(HitLoc - Start) < float(30))
		{
			return;
		}
		// End:0xE3
		if(t == none)
		{
			HitLoc = End;
		}
		End = HitLoc - vect(0.0000000, 0.0000000, 100.0000000);
		t = Trace(HitLoc, HitNorm, End, HitLoc, true, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0x1CC
		if(((((t != none) && HitLoc.Z <= (Start.Z - float(Class'BCoreProV55.BallisticTurret'.default.MinTurretEyeDepth))) && t.bWorldGeometry && (Sandbag(t) == none) || Sandbag(t).AttachedWeapon == none) && HitNorm.Z >= 0.9000000) && FastTrace(HitLoc, Start))
		{
			// [Explicit Break]
			goto J0x1E6;
		}
		// End:0x1DA
		if(Forward <= 45)
		{
			return;
		}
		Forward -= 15;
		// [Loop Continue]
		goto J0x4A;
	}
	J0x1E6:

	FireMode[1].bIsFiring = false;
	FireMode[1].StopFiring();
	// End:0x262
	if(Sandbag(t) != none)
	{
		HitLoc = t.Location;
		HitLoc.Z += (Class'BallisticProV55.XMV850Turret'.default.CollisionHeight + (t.CollisionHeight * 0.7500000));		
	}
	else
	{
		HitLoc.Z += (Class'BallisticProV55.XMV850Turret'.default.CollisionHeight - float(9));
	}
	CompressedEq = Instigator.Rotation;
	CompressedEq.Pitch = (CompressedEq.Pitch >> 8) & 255;
	CompressedEq.Yaw = (CompressedEq.Yaw >> 8) & 255;
	CompressedEq.Pitch = CompressedEq.Pitch << 8;
	CompressedEq.Yaw = CompressedEq.Yaw << 8;
	Turret = Spawn(Class'BallisticProV55.XMV850Turret', none,, HitLoc, CompressedEq);
	// End:0x37A
	if(Turret != none)
	{
		// End:0x350
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
		Log("Notify_Deploy: Could not spawn turret for XMV850 Minigun");
	}
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M;
	local Weapon W;
	local bool bPossiblySwitch, bJustSpawned;

	Instigator = Other;
	W = Weapon(Other.FindInventoryType(Class));
	// End:0x170
	if((W == none) || Class != W.Class)
	{
		bJustSpawned = true;
		super(Inventory).GiveTo(Other);
		bPossiblySwitch = true;
		W = self;
		// End:0x104
		if((Pickup != none) && BallisticWeaponPickup(Pickup) != none)
		{
			GenerateLayout(BallisticWeaponPickup(Pickup).LayoutIndex);
			GenerateCamo(BallisticWeaponPickup(Pickup).CamoIndex);
			// End:0xE8
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = BallisticWeaponPickup(Pickup).MagAmmo;			
		}
		else
		{
			GenerateLayout(byte(255));
			GenerateCamo(byte(255));
			// End:0x140
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = MagAmmo + ((int(!bNonCocking) * int(bMagPlusOne)) * int(!bNeedCock));
		}		
	}
	else
	{
		// End:0x18C
		if(!W.HasAmmo())
		{
			bPossiblySwitch = true;
		}
	}
	// End:0x19F
	if(Pickup == none)
	{
		bPossiblySwitch = true;
	}
	M = 0;
	J0x1A6:

	// End:0x20B [Loop If]
	if(M < 2)
	{
		// End:0x201
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			W.GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0x1A6;
	}
	// End:0x22A
	if(MeleeFireMode != none)
	{
		MeleeFireMode.Instigator = Instigator;
	}
	// End:0x263
	if((Instigator.Weapon != none) && Instigator.Weapon.IsFiring())
	{
		bPossiblySwitch = false;
	}
	// End:0x290
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	bAimDisabled = default.bAimDisabled || !Instigator.IsHumanControlled();
	// End:0x2EB
	if(!bJustSpawned)
	{
		M = 0;
		J0x2C5:

		// End:0x2E8 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x2C5;
		}
		Destroy();
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

simulated function float ChargeBar()
{
	return BarrelSpeed / DesiredSpeed;
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.7500000, dist, 2048.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 1.0000000;
	//return;	
}

defaultproperties
{
	BarrelSpinSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelSpinLoop'
	BarrelStopSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelStop'
	BarrelStartSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelStart'
	DeploySound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Deploy'
	UndeploySound=Sound'BW_Core_WeaponSound.XMV-850.XMV-UnDeploy'
	RotationSpeeds[0]=0.3300000
	RotationSpeeds[1]=0.6600000
	RotationSpeeds[2]=1.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="480.0;60.0;2.0;100.0;0.5;0.5;0.5")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BallisticProV55.XMV850WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.XMV850WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.XMV850WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.XMV850WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_XMV850'
	BigIconCoords=(X1=0,Y1=48,X2=511,Y2=255)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Pullout',Volume=0.2120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Putaway',Volume=0.2120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="1200 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="2400 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="3600 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightBobScale=0.5000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bNonCocking=true
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc7',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc9',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=119),Color2=(R=0,G=255,B=220,A=206),StartSize1=101,StartSize2=96)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Spins up the barrel. Once spun up to speed, unleashes a hail of bullets. Incredible fire rate and moderate damage. Sustained damage output is extremely high. Large ammo reserves due to the attached backpack mean the weapon can fire continuously for long periods."
	ManualLines[1]="Deploys the minigun upon the ground or a nearby wall. May also be deployed upon sandbags. Whilst deployed, becomes perfectly accurate, loses its iron sights and gains a reduction in recoil. Locational damage (damage which can target an area on the body) taken from the front is significantly reduced."
	ManualLines[2]="The XMV-850 is one of the heaviest weapons in the game and halves your movement speed when equipped.||Effective at medium range. Extremely effective from ambush and deployed mode."
	SightPivot=(Pitch=700,Yaw=0,Roll=2048)
	SightOffset=(X=-6.5000000,Y=-1.0000000,Z=7.5000000)
	FireModeClass[0]=Class'BallisticProV55.XMV850MinigunPrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.XMV850MinigunSecondaryFire'
	SelectAnimRate=0.7500000
	PutDownTime=0.8000000
	BringUpTime=2.0000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bShowChargingBar=true
	Description="Anti-Krao weapons are a common thing these days, with many being designed specifically to kill as many as possible in a short time. However, no infantry weapon does this better, than the XMV-850. A weapon to be feared, this monster is capable of firing as many as sixty 5.56mm rounds a second. While most miniguns are capable of firing ten or twelve thousand rounds-per-minute, the XMV-850 has been designed for infantry use, as a fire-rate that high, would generate far to much recoil. To make the weapon usable in a defensive position, it can be deployed to stabilise it, and allows the user to become that much more effective. To help with recoil, and allow the soldier to use the weapon more efectively when not deployed, the fire-rate can be limited to a lower RPM. Though not terribly accurate or damaging, the fact that it can pour out bullets at such a rate, means that it will be difficult to miss the target."
	Priority=47
	HudColor=(R=0,G=200,B=200,A=255)
	CustomCrossHairColor=(R=255,G=255,B=255,A=219)
	CustomCrossHairScale=1.0088030
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	GroupOffset=2
	PickupClass=Class'BallisticProV55.XMV850Pickup'
	PlayerViewOffset=(X=4.5000000,Y=4.0000000,Z=-5.0000000)
	AttachmentClass=Class'BallisticProV55.XMV850MinigunAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_XMV850'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="XMV-850 Minigun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.XMV850_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BW_Core_WeaponTex.XMV850.XMV850_Main'
	Skins[2]=Shader'BW_Core_WeaponTex.XMV850.XMV850_Barrels_SD'
	SoundRadius=128.0000000
}
