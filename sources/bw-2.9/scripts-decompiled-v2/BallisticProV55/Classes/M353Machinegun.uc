class M353Machinegun extends BallisticMachinegun
	config(BallisticProV55);

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

	// End:0x1EC [Loop If]
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
		// End:0x1D2
		if(((((t != none) && HitLoc.Z <= ((Start.Z - float(Class'BCoreProV55.BallisticTurret'.default.MinTurretEyeDepth)) - float(4))) && t.bWorldGeometry && (Sandbag(t) == none) || Sandbag(t).AttachedWeapon == none) && HitNorm.Z >= 0.9000000) && FastTrace(HitLoc, Start))
		{
			// [Explicit Break]
			goto J0x1EC;
		}
		// End:0x1E0
		if(Forward <= 45)
		{
			return;
		}
		Forward -= 15;
		// [Loop Continue]
		goto J0x4A;
	}
	J0x1EC:

	FireMode[1].bIsFiring = false;
	FireMode[1].StopFiring();
	// End:0x268
	if(Sandbag(t) != none)
	{
		HitLoc = t.Location;
		HitLoc.Z += (Class'BallisticProV55.M353Turret'.default.CollisionHeight + (t.CollisionHeight * 0.7500000));		
	}
	else
	{
		HitLoc.Z += (Class'BallisticProV55.M353Turret'.default.CollisionHeight - float(9));
	}
	CompressedEq = Instigator.Rotation;
	CompressedEq.Pitch = (CompressedEq.Pitch >> 8) & 255;
	CompressedEq.Yaw = (CompressedEq.Yaw >> 8) & 255;
	CompressedEq.Pitch = CompressedEq.Pitch << 8;
	CompressedEq.Yaw = CompressedEq.Yaw << 8;
	Turret = Spawn(Class'BallisticProV55.M353Turret', none,, HitLoc, CompressedEq);
	// End:0x380
	if(Turret != none)
	{
		// End:0x356
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
		Log("Notify_Deploy: Could not spawn turret for M353 Machinegun");
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
	BoxOnSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-BoxOn',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	BoxOffSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-BoxOff',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlapUpSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-FlapUp',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlapDownSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-FlapDown',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;25.0;0.7;-1.0;0.4;0.4;-999.0")
	AIReloadTime=4.0000000
	SightAnimScale=0.3000000
	ParamsClasses[0]=Class'BallisticProV55.M353WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.M353WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.M353WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.M353WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_M353'
	BigIconCoords=(X1=0,Y1=50,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Putaway',Volume=0.2700000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst of Five",bUnavailable=false,ModeID="WM_BigBurst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=3
	SightFXClass=Class'BallisticProV55.M353SightLEDs'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ReloadAnim="ReloadStart"
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-ShellOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-ShellIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M353OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M353InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=128),Color2=(R=255,G=255,B=0,A=246),StartSize1=89,StartSize2=96)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic 5.56mm fire. Has a high rate of fire, moderate damage and good sustained damage output. As a machinegun, it has a very long effective range. Large magazine capacity allows the weapon to fire for a long time, but the reload time is long."
	ManualLines[1]="Deploys the machinegun upon the ground or a nearby wall. May also be deployed upon sandbags. Whilst deployed, becomes perfectly accurate, loses its iron sights and gains a reduction in recoil. Locational damage (damage which can target an area on the body) taken from the front is significantly reduced."
	ManualLines[2]="The M353 is a more cumbersome and heavy weapon, and accordingly has poor hipfire and takes some time to aim.||It is effective at medium to long range."
	SightOffset=(X=-3.4000000,Y=0.0000000,Z=1.0000000)
	FireModeClass[0]=Class'BallisticProV55.M353PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.M353SecondaryFire'
	SelectAnimRate=1.3500000
	PutDownTime=0.5500000
	BringUpTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	Description="The M353 'Guardian' Machinegun has seen some of the most brutal battles ever recorded in recent history, and has helped win many of them, the most famous being the bloody 'Wasteland Seige' where 12 million Krao were slaughtered along a 500 mile line of defences. Used primarily as a defensive weapon, the M353's incredible rate of fire can quickly and effectively destroy masses of oncoming foes, especially melee attackers. When the secondary mode is activated, the Guardian becomes much more accurate when the user mounts it on the ground, allowing it to be a very effective defensive weapon. With its high rate of fire and high damage, the M353 becomes very inaccurate after just a few rounds and with its high ammo capacity, comes the difficulty of longer reload times than smaller weapons."
	Priority=43
	HudColor=(R=100,G=150,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	PickupClass=Class'BallisticProV55.M353Pickup'
	PlayerViewOffset=(X=2.0000000,Y=2.5000000,Z=-3.5000000)
	AttachmentClass=Class'BallisticProV55.M353Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_M353'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="M353 Light Machine Gun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M353_FPm'
	DrawScale=0.3000000
}
