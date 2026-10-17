class MarlinRifle extends BallisticWeapon
	config(BallisticProV55);

var() bool bHasLaser;
var() bool bHasGauss;
var() float GaussLevel;
var() float MaxGaussLevel;
var() Sound GaussOnSound;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var() Actor GaussGlow1;
var() Actor GaussGlow2;
var() Emitter LaserDot;
var() bool bLaserOn;
var() bool bStriking;

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasGauss = false;
	bHasLaser = false;
	// End:0x52
	if(InStr(WeaponParams.LayoutTags, "gauss") != -1)
	{
		bHasGauss = true;
		bShowChargingBar = true;
	}
	// End:0x82
	if(InStr(WeaponParams.LayoutTags, "laser") != -1)
	{
		bHasLaser = true;
		ServerSwitchLaser(true);
	}
	//return;	
}

simulated function Tick(float dt)
{
	super.Tick(dt);
	// End:0x1F
	if(bHasGauss)
	{
		AddGauss(dt);
	}
	//return;	
}

simulated function AddGauss(optional float Amount)
{
	// End:0x15
	if(bBerserk)
	{
		Amount *= 1.2000000;
	}
	GaussLevel = FMin(GaussLevel + Amount, MaxGaussLevel);
	// End:0xA8
	if((GaussLevel == MaxGaussLevel) && int(CurrentWeaponMode) == 0)
	{
		// End:0x68
		if(GaussGlow1 != none)
		{
			GaussGlow1.bHidden = false;
		}
		// End:0x84
		if(GaussGlow2 != none)
		{
			GaussGlow2.bHidden = false;
		}
		PlaySound(GaussOnSound,, 1.2000000,, 32.0000000);
		ServerSwitchWeaponMode(1);
		ClientSwitchWeaponMode(1);
	}
	//return;	
}

simulated exec function SwitchWeaponMode(optional byte modeNum)
{
	// End:0x0B
	if(bHasGauss)
	{
		return;
	}
	super.SwitchWeaponMode(modeNum);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x182
	if(bHasGauss)
	{
		// End:0x9F
		if(((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2) && (GaussGlow1 == none) || GaussGlow1.bDeleteMe)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GaussGlow1, Class'BallisticProV55.MarlinChargeEffect', DrawScale, self, 'Gauss2');
		}
		// End:0x12A
		if(((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2) && (GaussGlow2 == none) || GaussGlow2.bDeleteMe)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GaussGlow2, Class'BallisticProV55.MarlinChargeEffect', DrawScale, self, 'Gauss3');
		}
		// End:0x156
		if(GaussGlow1 != none)
		{
			AttachToBone(GaussGlow1, 'Gauss2');
			GaussGlow1.bHidden = true;
		}
		// End:0x182
		if(GaussGlow2 != none)
		{
			AttachToBone(GaussGlow2, 'Gauss3');
			GaussGlow2.bHidden = true;
		}
	}
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(GaussGlow1 != none)
	{
		GaussGlow1.Destroy();
	}
	// End:0x2E
	if(GaussGlow2 != none)
	{
		GaussGlow2.Destroy();
	}
	// End:0x45
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function bool PutDown()
{
	// End:0x3F
	if(super.PutDown())
	{
		KillLaserDot();
		// End:0x26
		if(GaussGlow1 != none)
		{
			GaussGlow1.Destroy();
		}
		// End:0x3D
		if(GaussGlow2 != none)
		{
			GaussGlow2.Destroy();
		}
		return true;
	}
	return false;
	//return;	
}

simulated function float ChargeBar()
{
	return FMax(0.0000000, GaussLevel / MaxGaussLevel);
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
	super.OnAimParamsChanged();
	// End:0x15
	if(bLaserOn)
	{
		ApplyLaserAim();
	}
	//return;	
}

simulated function ApplyLaserAim()
{
	AimComponent.AimAdjustTime *= 0.6500000;
	AimComponent.AimSpread.Min *= 0.6500000;
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
	// End:0x18
	if(bServerReloading || !bHasLaser)
	{
		return;
	}
	ServerSwitchLaser(!bLaserOn);
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	// End:0x0D
	if(!bHasLaser)
	{
		return;
	}
	bLaserOn = bNewLaserOn;
	OnLaserSwitched();
	// End:0x38
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	OnLaserSwitched();
	// End:0x3A
	if(bLaserOn)
	{
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);
		Skins[4] = FinalBlend'BW_Core_WeaponTex.Marlin.Ivory_UT2_beam_FB';		
	}
	else
	{
		KillLaserDot();
		PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
		Skins[4] = Texture'BW_Core_WeaponTex.Misc.Invisible';
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
		LaserDot = Spawn(Class'BallisticProV55.M806LaserDot',,, loc);
	}
	//return;	
}

simulated function DrawLaserSight(Canvas Canvas)
{
	local Vector HitLocation, Start, End, HitNormal;
	local Rotator AimDir;
	local Actor Other;

	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x82
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0xEB
	if(((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x10D
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	super.RenderOverlays(Canvas);
	// End:0x2E
	if(bLaserOn && !IsInState('Lowered'))
	{
		DrawLaserSight(Canvas);
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	ServerSwitchLaser(!bLaserOn);
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x1C
	if(int(MeleeState) >= int(2))
	{
		Momentum *= 0.5000000;
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x2D
	if(Anim != 'MeleePrep')
	{
		bStriking = false;
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
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
	// End:0x179
	if((Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0.0000000);
		// End:0x171
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		bPreventReload = false;
	}
	// End:0x2D6
	if((int(ClientState) == int(4)) && int(ReloadState) == int(0))
	{
		// End:0x1FB
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x26A
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x2D6
				if((((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring) && int(MeleeState) < int(2))
				{
					bPreventReload = false;
					PlayIdle();
				}
			}
		}
	}
	// End:0x2F6
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x34D
	if(int(ReloadState) == int(6))
	{
		// End:0x33D
		if((Ammo[0].AmmoAmount < 1) || MagAmmo >= default.MagAmmo)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x3C0
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x38E
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
	// End:0x400
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	// End:0x436
	if(int(ReloadState) == int(9))
	{
		// End:0x428
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		ReloadState = 0;
		PlayIdle();
	}
	//return;	
}

simulated function CommonCockGun(optional byte Type)
{
	// End:0x21
	if(!FireMode[1].IsFiring())
	{
		super.CommonCockGun(Type);
	}
	//return;	
}

simulated function WeaponTick(float dt)
{
	// End:0x5E
	if(!FireMode[1].IsFiring())
	{
		// End:0x46
		if((int(ReloadState) != int(0)) && int(ReloadState) != int(8))
		{
			GunLength = 1.0000000;			
		}
		else
		{
			// End:0x5E
			if(GunLength == float(1))
			{
				GunLength = default.GunLength;
			}
		}
	}
	super.WeaponTick(dt);
	//return;	
}

simulated function Notify_CockAimed()
{
	bNeedCock = false;
	PlayOwnedSound(CockSound.Sound, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.8000000, dist, 1024.0000000, 4096.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.4000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.4000000;
	//return;	
}

defaultproperties
{
	MaxGaussLevel=3.0000000
	GaussOnSound=Sound'BW_Core_WeaponSound.Gauss.Gauss-Charge'
	LaserOnSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserOffSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.6;50.0;1.0;0.5;-999.0")
	ParamsClasses[0]=Class'BallisticProV55.MarlinWeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.MarlinWeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.MarlinWeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.MarlinWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Marlin.BigIcon_Marlin'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	FullZoomFOV=70.0000000
	bNoCrosshairInScope=true
	SightBobScale=0.2000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.Marlin.Mar-Cock',Volume=0.6500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ReloadAnim="ReloadLoop"
	ClipInSound=(Sound=SoundGroup'BW_Core_WeaponSound.Marlin.Mar-ShellIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	bCanSkipReload=true
	bShovelLoad=true
	StartShovelAnim="StartReload"
	EndShovelAnim="EndReload"
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Cross4',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Dot1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=255,G=0,B=0,A=138),Color2=(R=255,G=255,B=0,A=255),StartSize1=61,StartSize2=10)
	MeleeFireClass=Class'BallisticProV55.MarlinMeleeFire'
	bWT_Bullet=true
	ManualLines[0]="Lever-action rifle fire. High damage per shot with modest recoil and good penetration. Good shoulder fire properties. This mode fires more quickly when the weapon is aimed."
	ManualLines[1]="Prepares a bludgeoning attack, which will be executed upon release. The damage of the attack increases the longer altfire is held, up to 1.5 seconds for maximum damage output. As a blunt attack, has lower base damage compared to bayonets but inflicts a short-duration blinding effect when striking. This attack inflicts more damage from behind."
	ManualLines[2]="As a long-ranged weapon lacking a scope, it has a very quick aiming time. Does not use tracer rounds. Effective at medium to long range."
	SightOffset=(X=6.0000000,Y=-0.0400000,Z=2.8500000)
	FireModeClass[0]=Class'BallisticProV55.MarlinPrimaryFire'
	FireModeClass[1]=Class'BCoreProV55.BallisticScopeFire'
	PutDownTime=0.4000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bSniping=true
	Description="Redwood Firearms are well known for their high quality hunting and sport rifles and ammuntion. One of their most successful rifles, the '6000 Deermaster', is widely recognised as an excellent hunting weapon. It has only ever been used by civilians for hunting and sporting competitions. Although not used by miltary forces, for it's inconvenient operational design, it is still a powerful weapon, using specified .341 cal ammunition. The heavy wooden stock is useful as a blunt instrument should the user require it in a desperate situation."
	Priority=33
	HudColor=(R=140,G=98,B=57,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	GroupOffset=1
	PickupClass=Class'BallisticProV55.MarlinPickup'
	PlayerViewOffset=(X=15.0000000,Y=7.0000000,Z=-10.0000000)
	AttachmentClass=Class'BallisticProV55.MarlinAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Marlin.SmallIcon_Marlin'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="Redwood 6000 'DeerMaster'"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.Marlin_FPm'
	DrawScale=0.3000000
}
