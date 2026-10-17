class PKMMachinegun extends BallisticMachinegun
	config(BallisticProV55);

var() name KnifeBackAnim;
var() name KnifeThrowAnim;
var float NextThrowTime;
var() name GrenBone;
var() name GrenBoneBase;
var() Sound GrenLoadSound;
var() Sound GrenDropSound;
var() name KnifeLoadAnim;
var bool bLoaded;

simulated function bool IsKnifeLoaded()
{
	return PKMSecondaryFire(FireMode[1]).bLoaded;
	//return;	
}

simulated function bool IsReloadingKnife()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == KnifeLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x41
	if(Anim == KnifeLoadAnim)
	{
		ReloadState = 0;
		IdleTweenTime = 0.0000000;
		PlayIdle();		
	}
	else
	{
		IdleTweenTime = default.IdleTweenTime;
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function LoadKnife()
{
	// End:0x33
	if((Ammo[1].AmmoAmount < 1) || PKMSecondaryFire(FireMode[1]).bLoaded)
	{
		return;
	}
	// End:0x5A
	if(int(ReloadState) == int(0))
	{
		ReloadState = 8;
		PlayAnim(KnifeLoadAnim, 1.1000000,, 0);
	}
	//return;	
}

function ServerStartReload(optional byte i)
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x0B
	if(bPreventReload)
	{
		return;
	}
	// End:0x1D
	if(int(ReloadState) != int(0))
	{
		return;
	}
	GetAnimParams(Channel, seq, frame, Rate);
	// End:0x48
	if(seq == KnifeLoadAnim)
	{
		return;
	}
	// End:0xA8
	if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		// End:0xA6
		if(((AmmoAmount(1)) > 0) && !IsReloadingKnife())
		{
			LoadKnife();
			ClientStartReload(1);
		}
		return;
	}
	super(BallisticWeapon).ServerStartReload();
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x7D
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x72
		if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			// End:0x6F
			if(((AmmoAmount(1)) > 0) && !IsReloadingKnife())
			{
				LoadKnife();
			}			
		}
		else
		{
			CommonStartReload(i);
		}
	}
	//return;	
}

simulated function Notify_BladeLaunch()
{
	SetBoneScale(0, 0.0000000, GrenBone);
	//return;	
}

simulated function Notify_BladeDrop()
{
	PlaySound(GrenDropSound, 1, 1.5000000,, 32.0000000);
	//return;	
}

simulated function Notify_BladeAppear()
{
	SetBoneScale(0, 1.0000000, GrenBone);
	SetBoneScale(1, 1.0000000, GrenBoneBase);
	//return;	
}

simulated function Notify_BladeLoaded()
{
	PlaySound(GrenLoadSound, 1, 1.5000000,, 32.0000000);
	bLoaded = true;
	PKMSecondaryFire(FireMode[1]).bLoaded = true;
	PKMAttachment(ThirdPersonActor).bLoaded = true;
	FireMode[1].PreFireTime = FireMode[1].default.PreFireTime;
	//return;	
}

simulated function BladeOut()
{
	bLoaded = false;
	PKMAttachment(ThirdPersonActor).bLoaded = false;
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x3B
	if(PKMSecondaryFire(FireMode[1]).bLoaded)
	{
		SetBoneScale(0, 0.0000000, GrenBone);
		SetBoneScale(1, 0.0000000, GrenBoneBase);
	}
	super.BringUp(PrevWeapon);
	//return;	
}

function AttachToPawn(Pawn P)
{
	super(Inventory).AttachToPawn(P);
	// End:0x3A
	if(PKMSecondaryFire(FireMode[1]).bLoaded)
	{
		PKMAttachment(ThirdPersonActor).bLoaded = true;
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
	GrenLoadSound=Sound'BWBP_SKC_Sounds.AK47.Knife-Load'
	GrenDropSound=Sound'BWBP_SKC_Sounds.AK47.Knife-Drop'
	KnifeLoadAnim="KnifeReload"
	BoxBone="MagDrum"
	BoxOnSound=(Sound=Sound'BWBP_APC_Sounds.rpk940.RPK-BoxOn',Volume=1.4000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	BoxOffSound=(Sound=Sound'BWBP_APC_Sounds.rpk940.RPK-BoxOff',Volume=1.4000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlapUpSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-FlapUp',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlapDownSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-FlapDown',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;25.0;0.7;-1.0;0.3;0.4;1.0")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.PKMMachinegunWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_APC_Tex.PKM.BigIcon_PKMA'
	BigIconCoords=(X1=0,Y1=50,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Putaway',Volume=0.2700000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst of Five",bUnavailable=false,ModeID="WM_BigBurst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=3
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_APC_Sounds.rpk940.RPK-Bolt',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_APC_Sounds.rpk940.RPK-Bolt',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ReloadAnim="ReloadStart"
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-ShellOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-ShellIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M353OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M353InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=137,G=39,B=0,A=255),Color2=(R=149,G=145,B=148,A=255),StartSize1=96,StartSize2=96)
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic 7.62mm fire. Has a high rate of fire, moderate damage and good sustained damage output. As a machinegun, it has a very long effective range. Large magazine capacity allows the weapon to fire for a long time, but the reload time is long."
	ManualLines[1]=" If a knife is attached, it will be launched, dealing high damage. This attack is hip-accurate and has no recoil. If no knife is attached, one will be attached if available.||This weapon is effective at medium range."
	ManualLines[2]="Rugged, reliable, no fancy attachments needed.  That's the mantra of ZTV Exports PKMA-420 General Purpose Machine Gun, an old timey design brought back from the glory days of the MSR (Merged States Republic).  A 7.62mm belt-fed machine gun that can get the job done even without the frills of optics and other attachments, however there have been upgrades so that it can mount the infamous X8 seen on the AK-490. The PKMA can fight, no matter how harsh the conditions are or how many Krao come surging, nothing can stop this machine gun from performing above and beyond."
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.8500000
	SightPivot=(Pitch=-64,Yaw=0,Roll=0)
	SightOffset=(X=5.0000000,Y=-1.1150000,Z=14.1000000)
	CockAnimRate=1.2500000
	CockingBringUpTime=1.6000000
	FireModeClass[0]=Class'BWBP_APC_Pro.PKMPrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.PKMSecondaryFire'
	PutDownTime=0.5500000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	Description="Rugged, reliable, no fancy attachments needed.  That's the mantra of ZTV Exports PKM-420 General Purpose Machine Gun, an old timey design brought back from the glory days of the MSR (Merged States Republic).  A 7.62mm belt-fed machine gun that can get the job done even without the frills of optics and other attachments, however there have been upgrades so that it can mount the infamous X8 seen on the AK-490. The PKM can fight, no matter how harsh the conditions are or how many Krao come surging, nothing can stop this machine gun from performing above and beyond."
	Priority=43
	HudColor=(R=100,G=150,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	PickupClass=Class'BWBP_APC_Pro.PKMPickup'
	PlayerViewOffset=(X=0.0000000,Y=5.0000000,Z=-11.0000000)
	AttachmentClass=Class'BWBP_APC_Pro.PKMAttachment'
	IconMaterial=Texture'BWBP_APC_Tex.PKM.SmallIcon_PKMA'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="PKM-420 GP Machine Gun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_APC_Anim.PKMA_FPm'
	DrawScale=0.2500000
}
