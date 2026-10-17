class FM13Shotgun extends BallisticProShotgun
	config(BallisticProV55);

var bool bAltLoaded;
var bool bLoadsShot;
var name SingleLoadAnim;
var() FullSound BigLoadSound;
var FM13FireControl FireControl;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerLoadShell;
}

simulated function OnWeaponParamsChanged()
{
	super(BallisticWeapon).OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bLoadsShot = false;
	// End:0xB8
	if(InStr(WeaponParams.LayoutTags, "8Gauge") != -1)
	{
		bLoadsShot = true;
		CockSound.Sound = Sound'BWBP_OP_Sounds.FM13.FM13-CockHeavyQuick';
		CockSelectSound.Sound = Sound'BWBP_OP_Sounds.FM13.FM13-CockHeavyQuick';
		ClipInSound.Sound = BigLoadSound.Sound;
		CockSound.Volume = 1.2000000;
		CockSelectSound.Volume = 1.2000000;
		ClipInSound.Volume = 1.5000000;
		ClipInSound.Pitch = 1.2000000;
	}
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x1C
	if(int(MeleeState) >= int(2))
	{
		Momentum *= 0.5000000;
	}
	super(BallisticWeapon).AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	super(BallisticWeapon).DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(byte(255), 128, 0);
	Canvas.DrawText((("bNeedCock: " $ string(bNeedCock)) $ ", bAltLoaded: ") $ string(bAltLoaded));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super(BallisticWeapon).BringUp(PrevWeapon);
	GunLength = default.GunLength;
	//return;	
}

simulated function Notify_CockStart()
{
	// End:0x12
	if(int(ReloadState) == int(0))
	{
		return;
	}
	ReloadState = 8;
	PlayOwnedSound(CockSound.Sound, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x69
	if(Anim == SingleLoadAnim)
	{
		bAltLoaded = true;
		WeaponModes[0].ModeName = "Grenade Loaded";
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();		
	}
	else
	{
		WeaponModes[0].ModeName = default.WeaponModes[0].ModeName;
		super(BallisticWeapon).AnimEnd(Channel);
	}
	//return;	
}

simulated function PrepPriFire()
{
	WeaponModes[0].ModeName = default.WeaponModes[0].ModeName;
	//return;	
}

simulated function float RateSelf()
{
	// End:0x54
	if(((PlayerController(Instigator.Controller) != none) && Ammo[0].AmmoAmount <= 0) && MagAmmo <= 0)
	{
		CurrentRating = super(BallisticWeapon).RateSelf() * 0.2000000;		
	}
	else
	{
		return super(BallisticWeapon).RateSelf();
	}
	return CurrentRating;
	//return;	
}

simulated function FirePressed(float F)
{
	// End:0x14
	if(!HasAmmo())
	{
		OutOfAmmo();		
	}
	else
	{
		// End:0x43
		if(((F == float(0)) && bNeedReload) && int(ClientState) == int(4))
		{
			return;			
		}
		else
		{
			// End:0x95
			if(bCanSkipReload && (int(ReloadState) == int(5)) || int(ReloadState) == int(6))
			{
				ServerSkipReload();
				// End:0x95
				if(int(Level.NetMode) == int(NM_Client))
				{
					SkipReload();
				}
			}
		}
	}
	// End:0x137
	if(F == float(0))
	{
		// End:0x134
		if(((((int(ReloadState) == int(0)) && bNeedCock || bAltLoaded) && MagAmmo > 0) && !IsFiring()) && Level.TimeSeconds > FireMode[0].NextFireTime)
		{
			bAltLoaded = false;
			CommonCockGun();
			// End:0x134
			if(int(Level.NetMode) == int(NM_Client))
			{
				ServerCockGun();
			}
		}		
	}
	else
	{
		// End:0x1B8
		if(((((int(ReloadState) == int(0)) && !bAltLoaded) && HasNonMagAmmo(1)) && !IsFiring()) && Level.TimeSeconds > FireMode[1].NextFireTime)
		{
			CommonLoadShell();
			// End:0x1B8
			if(int(Level.NetMode) == int(NM_Client))
			{
				ServerLoadShell();
			}
		}
	}
	//return;	
}

simulated function CommonLoadShell()
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 8;
	// End:0x3F
	if(int(CurrentWeaponMode) == 0)
	{
		PlayAnim(SingleLoadAnim, 1.6000000, 0.0000000);
	}
	//return;	
}

function ServerLoadShell()
{
	CommonLoadShell();
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	// End:0x88
	if(dist > float(250))
	{
		return 0;
	}
	// End:0xB4
	if((dist < FireMode[1].MaxRange()) && FRand() > 0.3000000)
	{
		return 1;
	}
	// End:0x13E
	if(((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000) && (VSize(B.Enemy.Velocity) < float(100)) || (Normal(B.Enemy.Velocity) Dot Normal(Instigator.Velocity)) < 0.5000000)
	{
		return 1;
	}
	return byte(Rand(2));
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
	rating = super(BallisticWeapon).GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, BallisticProShotgunFire(bFireMode[0]).DecayRange.Min, BallisticProShotgunFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.5000000;
	//return;	
}

simulated function Notify_CockAimed()
{
	bNeedCock = false;
	PlayOwnedSound(CockSound.Sound, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
	//return;	
}

simulated function PostNetBeginPlay()
{
	local FM13FireControl FC;

	super(BallisticWeapon).PostNetBeginPlay();
	// End:0x52
	if((int(Role) == int(ROLE_Authority)) && FireControl == none)
	{
		// End:0x42
		foreach DynamicActors(Class'BWBP_OP_Pro.FM13FireControl', FC)
		{
			FireControl = FC;			
			return;			
		}		
		FireControl = Spawn(Class'BWBP_OP_Pro.FM13FireControl', none);
	}
	//return;	
}

function FM13FireControl GetFireControl()
{
	return FireControl;
	//return;	
}

defaultproperties
{
	SingleLoadAnim="LoadSpecial"
	BigLoadSound=(Sound=Sound'BWBP_SKC_Sounds.MGL.MGL-NadeInsert',Volume=1.0000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;20.0;0.7;50.0;0.0;0.5;0.8")
	ParamsClasses[0]=Class'BWBP_OP_Pro.FM13WeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_OP_Pro.FM13WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.FM13WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.FM13WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.FM13.BigIcon_Pitbull'
	BigIconCoords=(X1=0,Y1=35,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Putaway',Volume=0.2600000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_OP_Sounds.FM13.FM13-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_OP_Sounds.FM13.FM13-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ReloadAnim="ReloadLoop"
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763LoadShell1',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.3750000
	bCanSkipReload=true
	bAltTriggerReload=true
	bShovelLoad=true
	StartShovelAnim="ReloadStart"
	EndShovelAnim="ReloadEnd"
	EndShovelEmptyAnim="ReloadEndEmpty"
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc3',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.G5OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=109),Color2=(R=0,G=0,B=0,A=255),StartSize1=83,StartSize2=55)
	MeleeFireClass=Class'BWBP_OP_Pro.FM13MeleeFire'
	bWT_Shotgun=true
	ManualLines[0]="Long-ranged pump-action shotgun fire. Tight spread and high damage, but relatively slow fire rate. Sustained damage output is lower than that of shorter-ranged shotguns."
	ManualLines[1]="Loads a gas shell. Once loaded, the gas shell can be fired, generating a linear cloud of toxic gas in front of the weapon. Anyone standing in this cloud will receive damage over time."
	ManualLines[2]="Has a melee attack. The damage of the attack increases the longer altfire is held, up to 1.5 seconds for maximum damage output. As a blunt attack, has lower base damage compared to bayonets but inflicts a short-duration blinding effect when striking. This attack inflicts more damage from behind.||As a shotgun, has poor penetration.||Most effective at medium range."
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	SightOffset=(X=10.0000000,Y=-0.1000000,Z=27.0000000)
	CockingBringUpTime=2.2000000
	ReloadAnimRate=1.1000000
	StartShovelAnimRate=1.1000000
	EndShovelAnimRate=1.1000000
	GunLength=48.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.FM13PrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.FM13SecondaryFire'
	PutDownAnimRate=1.5000000
	PutDownTime=0.3500000
	BringUpTime=1.4000000
	AIRating=0.7500000
	CurrentRating=0.7500000
	Description="A constant complaint with dragon's breath shells is that while they spit out hot phosphorous with ease, they're finicky with pump action shotguns. Feeding issues, jams and melting riflings among other things, but Black and Wood are attempting to pioneer the shotgun industry with their latest offering; the FM13 'Pitbull' Incendiary Shotgun. Exclusively chambered in 10 Gauge Dragon's breath rounds, this weapon was designed to make sure the shells would properly load and not melt anything other than those sitting on the opposite ends of the barrel. Currently, the Pitbull is being put through its paces on Kylanmajero, home to Krao breeding nests in desperate need of a good cleansing."
	Priority=37
	HudColor=(R=200,G=255,B=50,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	GroupOffset=2
	PickupClass=Class'BWBP_OP_Pro.FM13Pickup'
	PlayerViewOffset=(X=-20.0000000,Y=5.0000000,Z=-25.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.FM13Attachment'
	IconMaterial=Texture'BWBP_OP_Tex.FM13.SmallIcon_Pitbull'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="FM13 Dragon Shotgun"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.FM13_FPm'
	DrawScale=0.5000000
}
