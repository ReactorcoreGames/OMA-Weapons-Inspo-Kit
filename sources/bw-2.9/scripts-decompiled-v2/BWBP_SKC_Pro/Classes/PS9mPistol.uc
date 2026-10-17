class PS9mPistol extends BallisticHandgun
	config(BallisticProV55);

var() bool bToxin;
var() name GrenBone;
var() name GrenBoneBase;
var() name GrenadeLoadAnim;
var bool bLoaded;
var() Sound GrenSlideSound;
var() Sound GrenLoadSound;
var() Sound PartialReloadSound;
var() name HealAnim;
var() Sound HealSound;

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bToxin = false;
	// End:0x40
	if(InStr(WeaponParams.LayoutTags, "tox") != -1)
	{
		bToxin = true;
	}
	//return;	
}

simulated function bool SlaveCanUseMode(int Mode)
{
	return Mode == 0;
	//return;	
}

simulated function bool MasterCanSendMode(int Mode)
{
	return Mode == 0;
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x2D
	if(!bLoaded)
	{
		SetBoneScale(0, 0.0000000, GrenBone);
		SetBoneScale(1, 0.0000000, GrenBoneBase);
	}
	// End:0x63
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		ReloadAnim = 'ReloadOpen';
		IdleAnim = 'IdleOpen';		
	}
	else
	{
		ReloadAnim = 'Reload';
		IdleAnim = 'Idle';
	}
	super.BringUp(PrevWeapon);
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x20
	if(bLoaded)
	{
		PlayAnim(HealAnim, 1.1000000,, 0);
		ReloadState = 8;
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x12
	if(int(ReloadState) != int(0))
	{
		return;
	}
	// End:0x24
	if(int(ClientState) != int(4))
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	ServerWeaponSpecial();
	// End:0xA7
	if(bLoaded)
	{
		PlayAnim(HealAnim, 1.1000000,, 0);
		ReloadState = 8;
		// End:0xA7
		if(OtherGun != none)
		{
			// End:0x7B
			if(int(OtherGun.ClientState) != int(4))
			{
				return;
			}
			// End:0x88
			if(IsInState('DualAction'))
			{
				return;
			}
			// End:0xA7
			if(!OtherGun.IsInState('Lowered'))
			{
				GotoState('PendingSelfHeal');
				return;
			}
		}
	}
	//return;	
}

simulated function Notify_DartHeal()
{
	PlaySound(HealSound, 1, 1.5000000,, 64.0000000);
	DoDartEffect(Instigator, Instigator);
	bLoaded = false;
	//return;	
}

static function DoDartEffect(Actor Victim, Pawn Instigator)
{
	local PS9mDartHeal HP;

	// End:0x3F
	if(((Pawn(Victim) == none) || Vehicle(Victim) != none) || Pawn(Victim).Health <= 0)
	{
		return;
	}
	HP = Victim.Level.Spawn(Class'BWBP_SKC_Pro.PS9mDartHeal', Pawn(Victim).Owner);
	HP.Instigator = Instigator;
	// End:0xDF
	if(((int(Victim.Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
	{
		HP.InstigatorController = Instigator.Controller;
	}
	HP.Initialize(Victim);
	//return;	
}

simulated function LoadGrenade()
{
	// End:0x23
	if((Ammo[1].AmmoAmount < 1) || bLoaded)
	{
		return;
	}
	// End:0x49
	if(int(ReloadState) == int(0))
	{
		PlayAnim(GrenadeLoadAnim, ReloadAnimRate + 0.1000000,, 0);
	}
	// End:0x9B
	if(OtherGun != none)
	{
		// End:0x6F
		if(int(OtherGun.ClientState) != int(4))
		{
			return;
		}
		// End:0x7C
		if(IsInState('DualAction'))
		{
			return;
		}
		// End:0x9B
		if(!OtherGun.IsInState('Lowered'))
		{
			GotoState('PendingLoadGrenade');
			return;
		}
	}
	//return;	
}

simulated function Notify_GrenVisible()
{
	SetBoneScale(0, 1.0000000, GrenBone);
	SetBoneScale(1, 1.0000000, GrenBoneBase);
	ReloadState = 1;
	//return;	
}

simulated function Notify_GrenLoaded()
{
	PS9mAttachment(ThirdPersonActor).bGrenadier = true;
	PS9mAttachment(ThirdPersonActor).IAOverride(true);
	PlaySound(GrenLoadSound, 1, 0.5000000,, 64.0000000);
	Ammo[1].UseAmmo(1, true);
	//return;	
}

simulated function Notify_GrenReady()
{
	ReloadState = 0;
	bLoaded = true;
	//return;	
}

simulated function Notify_GrenLaunch()
{
	SetBoneScale(0, 0.0000000, GrenBone);
	PS9mAttachment(ThirdPersonActor).IAOverride(false);
	PS9mAttachment(ThirdPersonActor).bGrenadier = false;
	//return;	
}

simulated function Notify_GrenInvisible()
{
	SetBoneScale(1, 0.0000000, GrenBoneBase);
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x2D
	if(Anim == HealAnim)
	{
		ReloadState = 0;
	}
	// End:0x13C
	if(((((((((Anim == 'FireOpen') || Anim == 'Pullout') || Anim == 'Fire') || Anim == 'DartFire') || Anim == 'DartFireOpen') || Anim == CockAnim) || Anim == ReloadAnim) || Anim == DualReloadAnim) || Anim == DualReloadEmptyAnim)
	{
		// End:0x110
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'IdleOpen';
			ReloadAnim = 'ReloadOpen';
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

simulated function bool CanAlternate(int Mode)
{
	// End:0x0D
	if(Mode != 0)
	{
		return false;
	}
	return super.CanAlternate(Mode);
	//return;	
}

simulated function OnRecoilParamsChanged()
{
	super(BallisticWeapon).OnRecoilParamsChanged();
	// End:0x15
	if(IsInDualMode())
	{
		ApplyDualModeRecoilModifiers();
	}
	//return;	
}

simulated function OnAimParamsChanged()
{
	super(BallisticWeapon).OnAimParamsChanged();
	// End:0x15
	if(IsInDualMode())
	{
		ApplyDualModeAimModifiers();
	}
	//return;	
}

simulated function OnDualModeChanged(bool bDualMode)
{
	// End:0x18
	if(bDualMode)
	{
		ApplyDualModeAimModifiers();
		ApplyDualModeRecoilModifiers();		
	}
	else
	{
		AimComponent.Recalculate();
		RcComponent.Recalculate();
	}
	//return;	
}

simulated function ApplyDualModeAimModifiers()
{
	AimComponent.AimSpread.Min *= 1.4000000;
	AimComponent.AimSpread.Max *= 1.2000000;
	AimComponent.ChaosDeclineTime *= 1.2000000;
	AimComponent.ChaosSpeedThreshold *= 0.8000000;
	//return;	
}

simulated function ApplyDualModeRecoilModifiers()
{
	RcComponent.PitchFactor *= 1.2000000;
	RcComponent.YawFactor *= 1.2000000;
	RcComponent.XRandFactor *= 1.2000000;
	RcComponent.YRandFactor *= 1.2000000;
	RcComponent.DeclineTime *= 1.2000000;
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 768.0000000, 1536.0000000);
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

simulated state PendingSelfHeal extends PendingDualAction
{
	simulated function BeginState()
	{
		OtherGun.LowerHandGun();
		//return;		
	}

	simulated function HandgunLowered(BallisticHandgun Other)
	{
		global.HandgunLowered(Other);
		// End:0x20
		if(Other == OtherGun)
		{
			WeaponSpecial();
		}
		//return;		
	}

	simulated event AnimEnd(int Channel)
	{
		OtherGun.RaiseHandGun();
		global.AnimEnd(Channel);
		//return;		
	}
	stop;	
}

simulated state PendingLoadGrenade extends PendingDualAction
{
	simulated function BeginState()
	{
		OtherGun.LowerHandGun();
		//return;		
	}

	simulated function HandgunLowered(BallisticHandgun Other)
	{
		global.HandgunLowered(Other);
		// End:0x20
		if(Other == OtherGun)
		{
			LoadGrenade();
		}
		//return;		
	}

	simulated event AnimEnd(int Channel)
	{
		OtherGun.RaiseHandGun();
		global.AnimEnd(Channel);
		//return;		
	}
	stop;	
}

simulated state Lowering
{Begin:

	SafePlayAnim(PutDownAnim, 1.7500000, 0.1000000);
	FinishAnim();
	GotoState('Lowered');
	stop;					
}

defaultproperties
{
	GrenBone="Dart"
	GrenBoneBase="MuzzleAttachment"
	GrenadeLoadAnim="DartOn"
	GrenSlideSound=Sound'BW_Core_WeaponSound.M50.M50GrenOpen'
	GrenLoadSound=Sound'BW_Core_WeaponSound.M50.M50GrenLoad'
	PartialReloadSound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-MagInS2'
	HealAnim="Heal"
	HealSound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-Heal'
	SupportHandBone="l_upperarm"
	SpecialInfo[0]=(Id="EvoDefs",Info="320.0;15.0;1.0;110.0;2.0;0.1;0.1")
	AIReloadTime=1.0000000
	SightAnimScale=0.3500000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.PS9mWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.PS9mWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.PS9mWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.PS9mWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.Stealth.BigIcon_PS9M'
	BigIconCoords=(X1=96,Y1=16,X2=418,Y2=255)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-Pickup',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Repeating",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806-Cock',Volume=0.5000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-MagInS1',Volume=1.1000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-MagOut',Volume=1.1000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-MagIn',Volume=1.1000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Cross4',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.A73OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=11,G=122,B=25,A=255),Color2=(R=255,G=255,B=255,A=255),StartSize1=22,StartSize2=59)
	bWT_Bullet=true
	bWT_Heal=true
	ManualLines[0]="Rapid automatic dart fire. Very low recoil and accurate from point shooting, but no penetration and very low magazine capacity."
	ManualLines[1]="Readies a medical dart. When a medical dart has been readied, firing again will launch the dart. Allies will receive a significant health boost."
	ManualLines[2]="Effective at close range and support."
	SightOffset=(X=-10.0000000,Y=0.0000000,Z=1.1500000)
	FireModeClass[0]=Class'BWBP_SKC_Pro.PS9mPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.PS9mSecondaryFire'
	PutDownTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="PS-9m Stealth Pistol||Manufacturer: Zavod Tochnogo Voorujeniya (ZTV Export)|Primary: Tranquilizer Dart Fire|Secondary: FMD Medical Dart||The PS-9m Stealth Pistol is a rare weapon seldom seen outside the walls of the Earth-based Russian Federation and black ops PMCs. It is mainly used as a tool for covert assassination and as such fires darts filled with highly potent neurotoxins. Every dart carries a 100% chance of death without medical aid and a 95% chance with. Subjects injected with the concoction report immediate vision impairment and excruciating pain, after 20 minutes subjects lose the ability to respond, and after 1 hour lethal convulsions set in. In order to make up for that unacceptable 95% success rate, the stealth pistol additionally comes with a fully automatic firing mode. This has been a cause for major concern, because there have been several times where the weapon's rapid fire recoil has directed darts into hapless civilians. It should be noted that the PS-9m's darts are instantly lethal on a headshot and are additionally filled with corrosive acids to neutralize mechanized threats. General Alexi 'Rasputin' Volkov is the only known man to have survived more than 9 darts and famously killed his attacker in hand-to-hand combat."
	Priority=65
	HudColor=(R=100,G=100,B=130,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	PickupClass=Class'BWBP_SKC_Pro.PS9mPickup'
	PlayerViewOffset=(X=5.0000000,Y=2.5000000,Z=-5.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.PS9mAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.Stealth.SmallIcon_PS9M'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="PS-9m Stealth Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.PS9M_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BWBP_SKC_Tex.Stealth.Stealth-Main'
}
