class M763Shotgun extends BallisticProShotgun
	config(BallisticProV55);

var M763GasControl gc;
var bool bAltLoaded;
var() bool bIsSlug;
var name SingleLoadAnim;

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
	bIsSlug = false;
	// End:0x41
	if(InStr(WeaponParams.LayoutTags, "slug") != -1)
	{
		bIsSlug = true;
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

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	gc = Spawn(Class'BallisticProV55.M763GasControl', self);
	gc.InstigatorController = Instigator.Controller;
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

simulated event AnimEnded(int Channel, name Anim, float frame, float Rate)
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
	// End:0x186
	if((Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0.0000000);
		AnimBlendParams(2, 0.0000000);
		// End:0x17E
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		bPreventReload = false;
	}
	// End:0x333
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0x230
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x29F
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x2B7
				if(int(MeleeState) < int(2))
				{
					bPreventReload = false;
				}
			}
		}
		// End:0x333
		if(((Channel == 0) && bNeedReload || ((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring) && int(MeleeState) < int(2))
		{
			PlayIdle();
		}
	}
	// End:0x340
	if(Channel > 0)
	{
		return;
	}
	// End:0x360
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x3E2
	if(int(ReloadState) == int(6))
	{
		// End:0x3D2
		if(((MagAmmo - ((int(!bNeedCock) * int(!bNonCocking)) * int(bMagPlusOne))) >= WeaponParams.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x455
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x423
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
	// End:0x4ED
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		// End:0x4B2
		if(Anim == SingleLoadAnim)
		{
			bAltLoaded = true;
			WeaponModes[0].ModeName = "Grenade Loaded";			
		}
		else
		{
			bAltLoaded = false;
			WeaponModes[0].ModeName = default.WeaponModes[0].ModeName;
		}
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	// End:0x523
	if(int(ReloadState) == int(9))
	{
		// End:0x515
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		ReloadState = 0;
		PlayIdle();
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
	// End:0x12F
	if(F == float(0))
	{
		// End:0x12C
		if(((((int(ReloadState) == int(0)) && bNeedCock || bAltLoaded) && MagAmmo > 0) && !IsFiring()) && Level.TimeSeconds > FireMode[0].NextFireTime)
		{
			CommonCockGun();
			// End:0x12C
			if(int(Level.NetMode) == int(NM_Client))
			{
				ServerCockGun();
			}
		}		
	}
	else
	{
		// End:0x1B0
		if(((((int(ReloadState) == int(0)) && !bAltLoaded) && HasNonMagAmmo(1)) && !IsFiring()) && Level.TimeSeconds > FireMode[1].NextFireTime)
		{
			CommonLoadShell();
			// End:0x1B0
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

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	super(BallisticWeapon).GiveTo(Other, Pickup);
	// End:0x2F
	if(gc != none)
	{
		gc.Instigator = Other;
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
	rating = super(BallisticWeapon).GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
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

simulated function PlayCocking(optional byte Type)
{
	local float Rand, AdjustedCockAnimRate;

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
		Rand = FRand();
		// End:0xAC
		if(Rand > 0.8000000)
		{
			CockAnim = 'Cock';			
		}
		else
		{
			// End:0xDB
			if((Rand > 0.6000000) && int(SightingState) != int(3))
			{
				CockAnim = 'Cock2';				
			}
			else
			{
				// End:0xF8
				if(Rand > 0.4000000)
				{
					CockAnim = 'Cock3';					
				}
				else
				{
					// End:0x115
					if(Rand > 0.2000000)
					{
						CockAnim = 'Cock4';						
					}
					else
					{
						CockAnim = 'Cock5';
					}
				}
			}
		}
		SafePlayAnim(CockAnim, AdjustedCockAnimRate, 0.2000000,, "RELOAD");
	}
	//return;	
}

simulated function PlayShovelLoop()
{
	local float Rand;

	Rand = FRand();
	// End:0x25
	if(Rand > 0.8000000)
	{
		ReloadAnim = 'ReloadLoop';		
	}
	else
	{
		// End:0x42
		if(Rand > 0.6000000)
		{
			ReloadAnim = 'ReloadLoop2';			
		}
		else
		{
			// End:0x5F
			if(Rand > 0.4000000)
			{
				ReloadAnim = 'ReloadLoop3';				
			}
			else
			{
				// End:0x7C
				if(Rand > 0.2000000)
				{
					ReloadAnim = 'ReloadLoop4';					
				}
				else
				{
					ReloadAnim = 'ReloadLoop5';
				}
			}
		}
	}
	SafePlayAnim(ReloadAnim, ReloadAnimRate, 0.0000000,, "RELOAD");
	// End:0xE8
	if((BallisticAttachment(ThirdPersonActor) != none) && BallisticAttachment(ThirdPersonActor).ReloadAnim != 'None')
	{
		Instigator.SetAnimAction('Shovel');
	}
	//return;	
}

simulated function Notify_CockAimed()
{
	bNeedCock = false;
	PlayOwnedSound(CockSound.Sound, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
	//return;	
}

simulated function Destroyed()
{
	// End:0x21
	if(gc.Clouds.Length == 0)
	{
		gc.Destroy();
	}
	super(BallisticWeapon).Destroyed();
	//return;	
}

defaultproperties
{
	SingleLoadAnim="LoadSingle"
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;20.0;0.7;50.0;0.0;0.5;0.0")
	ParamsClasses[0]=Class'BallisticProV55.M763WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.M763WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.M763WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.M763WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_M763'
	BigIconCoords=(X1=0,Y1=35,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Putaway',Volume=0.2600000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	SightBobScale=0.2000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Cock1',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
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
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M763OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M763InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=192),Color2=(R=255,G=255,B=0,A=255),StartSize1=126,StartSize2=105)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=0.7500000,Y1=1.0000000,X2=0.7500000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	MeleeFireClass=Class'BallisticProV55.M763MeleeFire'
	bWT_Shotgun=true
	ManualLines[0]="Long-ranged pump-action shotgun fire. Tight spread and high damage, but relatively slow fire rate. Sustained damage output is lower than that of shorter-ranged shotguns."
	ManualLines[1]="Loads a gas shell. Once loaded, the gas shell can be fired, generating a linear cloud of toxic gas in front of the weapon. Anyone standing in this cloud will receive damage over time."
	ManualLines[2]="Has a melee attack. The damage of the attack increases the longer altfire is held, up to 1.5 seconds for maximum damage output. As a blunt attack, has lower base damage compared to bayonets but inflicts a short-duration blinding effect when striking. This attack inflicts more damage from behind.||As a shotgun, has poor penetration.||Most effective at medium range."
	SightOffset=(X=1.1000000,Y=-0.0400000,Z=1.1000000)
	StartShovelAnimRate=1.1000000
	EndShovelAnimRate=1.1000000
	GunLength=48.0000000
	FireModeClass[0]=Class'BallisticProV55.M763PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.M763SecondaryFire'
	PutDownAnimRate=1.5000000
	PutDownTime=0.3500000
	AIRating=0.7500000
	CurrentRating=0.7500000
	Description="The Avenger single barreled shotgun is the standard spread weapon of the UTC infantry divisions. Its high damage, reliability and good range for a shotgun have made this gun one of the humans' favourites; the M763 has blown open more Krao drones than can be counted. After its many successes, even during trials by the UTC's Reunited Jamaican Army, defending from wave upon wave of Krao minions during the 'Red Storm' Skrith invasion, the Avenger became the standard issue shotgun and a favorite of many forces including the UTC RJA Division."
	Priority=37
	HudColor=(R=200,G=255,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	GroupOffset=2
	PickupClass=Class'BallisticProV55.M763Pickup'
	PlayerViewOffset=(X=3.0000000,Y=4.0000000,Z=-5.0000000)
	AttachmentClass=Class'BallisticProV55.M763Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_M763'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="M763 Shotgun"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M763_FPm'
	DrawScale=0.3000000
}
