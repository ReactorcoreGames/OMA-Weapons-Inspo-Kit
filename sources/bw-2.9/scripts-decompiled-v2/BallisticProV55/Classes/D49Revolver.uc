class D49Revolver extends BallisticHandgun
	config(BallisticProV55);

enum EBarrelMode
{
	BM_Neither,                     // 0
	BM_Primary,                     // 1
	BM_Secondary,                   // 2
	BM_Both                         // 3
};

enum EShellState
{
	SS_Loaded,                      // 0
	SS_Fired,                       // 1
	SS_Empty                        // 2
};

struct RevShell
{
	var() D49Revolver.EShellState ShellState;
	var() name BulletName;
	var() name ShellName;
	var() byte NextShell;
};

var() FullSound RevReloadSound;
var() FullSound RevOpenSound;
var() FullSound RevCloseSound;
var() FullSound RevSpinSound;
var() FullSound DryFireSound;
var() Rotator CylinderRotation;
var bool bRevCocked;
var() RevShell Shells[6];
var() byte PrimaryShell;
var() byte SecondaryShell;
var D49Revolver.EBarrelMode NetBarrelMode;
var D49Revolver.EBarrelMode RealBarrelMode;
var bool bBarrelModeUsed;
var byte BMByte;
var byte OldBMByte;
var Emitter LaserDot;
var bool bLaserOn;

simulated function RevolverFired(D49Revolver.EBarrelMode BarrelsFired)
{
	// End:0x4A
	if(int(BarrelsFired) == int(0))
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, DryFireSound);
		// End:0x4A
		if(int(ClientState) != int(1))
		{
			SafePlayAnim('Cock', 1.0000000, 0.2000000);
		}
	}
	// End:0xC4
	if(((int(BarrelsFired) == int(1)) || int(BarrelsFired) == int(3)) && int(Shells[int(PrimaryShell)].ShellState) == int(0))
	{
		Shells[int(PrimaryShell)].ShellState = 1;
		SetBoneScale(int(PrimaryShell), 0.0000000, Shells[int(PrimaryShell)].BulletName);
	}
	// End:0x12C
	if((int(BarrelsFired) >= int(2)) && int(Shells[int(SecondaryShell)].ShellState) == int(0))
	{
		Shells[int(SecondaryShell)].ShellState = 1;
		SetBoneScale(int(SecondaryShell), 0.0000000, Shells[int(SecondaryShell)].BulletName);
	}
	CylinderRotation.Roll -= 10922;
	SetBoneRotation('Revolver', CylinderRotation, 0, 1.0000000);
	PrimaryShell = Shells[int(PrimaryShell)].NextShell;
	SecondaryShell = Shells[int(SecondaryShell)].NextShell;
	bRevCocked = false;
	SetBoneRotation('Hammer', rot(0, 0, 0));
	// End:0x1BB
	if(Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading)
	{
		NoReloadingCheckUo();
	}
	//return;	
}

simulated function NoReloadingCheckUo()
{
	local int i;

	// End:0xEE
	if((AmmoAmount(0)) > 0)
	{
		i = 0;
		J0x14:

		// End:0x47 [Loop If]
		if(i < 6)
		{
			// End:0x3D
			if(int(Shells[i].ShellState) == int(0))
			{
				return;
			}
			i++;
			// [Loop Continue]
			goto J0x14;
		}
		i = 0;
		J0x4E:

		// End:0xDE [Loop If]
		if(i < 6)
		{
			// End:0xA1
			if((AmmoAmount(0)) <= i)
			{
				Shells[i].ShellState = 2;
				SetBoneScale(i, 0.0000000, Shells[i].ShellName);
				// [Explicit Continue]
				goto J0xD4;
			}
			Shells[i].ShellState = 0;
			SetBoneScale(i, 1.0000000, Shells[i].ShellName);
			J0xD4:

			i++;
			// [Loop Continue]
			goto J0x4E;
		}
		PrimaryShell = 0;
		SecondaryShell = 1;
	}
	//return;	
}

simulated function D49Revolver.EBarrelMode GetBarrelMode()
{
	local byte B;

	// End:0x25
	if(int(Shells[int(SecondaryShell)].ShellState) == int(0))
	{
		B = 2;
	}
	// End:0x49
	if(int(Shells[int(PrimaryShell)].ShellState) == int(0))
	{
		B++;
	}
	return B;
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	local int i, Empties;
	local Vector Start;

	i = 0;
	J0x07:

	// End:0x3F [Loop If]
	if(i < 6)
	{
		// End:0x35
		if(int(Shells[i].ShellState) == int(1))
		{
			Empties++;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x46:

	// End:0xDD [Loop If]
	if(i < 6)
	{
		// End:0xA0
		if(((AmmoAmount(0)) + MagAmmo) <= i)
		{
			Shells[i].ShellState = 2;
			SetBoneScale(i, 0.0000000, Shells[i].ShellName);
			// [Explicit Continue]
			goto J0xD3;
		}
		Shells[i].ShellState = 0;
		SetBoneScale(i, 1.0000000, Shells[i].ShellName);
		J0xD3:

		i++;
		// [Loop Continue]
		goto J0x46;
	}
	PrimaryShell = 0;
	SecondaryShell = 1;
	// End:0x212
	if((Instigator.IsLocallyControlled() && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		// End:0x212
		if(Class'BCoreProV55.BallisticMod'.default.bEjectBrass && int(Level.DetailMode) > int(0))
		{
			Start = (Instigator.Location + Instigator.EyePosition()) + Class'BCoreProV55.BUtil'.static.AlignedOffset(Instigator.GetViewRotation(), vect(5.0000000, 1.0000000, -5.0000000));
			i = 0;
			J0x1C1:

			// End:0x212 [Loop If]
			if(i < Empties)
			{
				Spawn(Class'BallisticProV55.Brass_Magnum', self,, Start + (VRand() * float(2)), Instigator.GetViewRotation() + rot(8192, 0, 0));
				i++;
				// [Loop Continue]
				goto J0x1C1;
			}
		}
	}
	// End:0x24A
	if((int(Role) == int(ROLE_Authority)) && ThirdPersonActor != none)
	{
		D49Attachment(ThirdPersonActor).RevolverEjectBrass(byte(Empties));
	}
	//return;	
}

simulated function Notify_D49Uncock()
{
	bRevCocked = false;
	//return;	
}

simulated function Notify_D49Cock()
{
	bRevCocked = true;
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, CockSound);
	//return;	
}

simulated function Notify_D49CockAfterPullout()
{
	Notify_D49Cock();
	//return;	
}

simulated function Notify_D49CockAfterFire()
{
	Notify_D49Cock();
	//return;	
}

simulated function Notify_D49StartReload()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, RevReloadSound);
	//return;	
}

simulated function Notify_D49SwingOpen()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, RevOpenSound);
	CylinderRotation.Roll = 0;
	SetBoneRotation('Revolver', CylinderRotation);
	// End:0x6E
	if((int(ReloadState) != int(0)) && int(Shells[0].ShellState) == int(2))
	{
		ReloadState = 2;
		SetAnimFrame(0.3800000, 0);
	}
	//return;	
}

simulated function Notify_D49SwingClosed()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, RevCloseSound);
	//return;	
}

simulated function Notify_D49Spin()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, RevSpinSound);
	//return;	
}

simulated function Notify_ClipOut()
{
	// End:0x12
	if(int(ReloadState) == int(0))
	{
		return;
	}
	ReloadState = 2;
	PlayOwnedSound(ClipOutSound.Sound, ClipOutSound.Slot, ClipOutSound.Volume, ClipOutSound.bNoOverride, ClipOutSound.Radius, ClipOutSound.Pitch, ClipOutSound.bAtten);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	local int i;

	// End:0xB8
	if(int(PrimaryShell) == int(SecondaryShell))
	{
		i = 0;
		J0x1A:

		// End:0xA8 [Loop If]
		if(i < 6)
		{
			// End:0x6B
			if(MagAmmo <= i)
			{
				Shells[i].ShellState = 2;
				SetBoneScale(i, 0.0000000, Shells[i].ShellName);
				// [Explicit Continue]
				goto J0x9E;
			}
			Shells[i].ShellState = 0;
			SetBoneScale(i, 1.0000000, Shells[i].ShellName);
			J0x9E:

			i++;
			// [Loop Continue]
			goto J0x1A;
		}
		PrimaryShell = 0;
		SecondaryShell = 1;
	}
	SetBoneRotation('Hammer', rot(0, 0, 0));
	super.BringUp(PrevWeapon);
	// End:0xFB
	if(IsSlave())
	{
		HandgunGroup = OtherGun.HandgunGroup;		
	}
	else
	{
		HandgunGroup = default.HandgunGroup;
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x4B
	if(super.PutDown())
	{
		bLaserOn = false;
		KillLaserDot();
		// End:0x49
		if(Instigator.IsLocallyControlled())
		{
			bRevCocked = false;
			SetBoneRotation('Hammer', rot(0, 0, 0));
		}
		return true;
	}
	return false;
	//return;	
}

simulated function PlayIdle()
{
	// End:0x54
	if(((!bRevCocked && int(ClientState) != int(1)) && int(SightingState) != int(3)) && MagAmmo > 0)
	{
		SafePlayAnim('Cock', 1.0000000, 0.2000000);		
	}
	else
	{
		super(BallisticWeapon).PlayIdle();
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x53
	if(bRevCocked && Anim == CockAnim)
	{
		SetBoneRotation('Hammer', rot(-5734, 0, 0));
		IdleTweenTime = 0.0000000;
	}
	super.AnimEnd(Channel);
	IdleTweenTime = default.IdleTweenTime;
	//return;	
}

simulated function CommonCockGun(optional byte Type)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = false;
	}
	ReloadState = 0;
	bNeedCock = false;
	// End:0x48
	if(!bRevCocked)
	{
		SafePlayAnim('Cock', 1.0000000, 0.2000000);
	}
	//return;	
}

simulated function bool CheckWeaponMode(int Mode)
{
	// End:0x1A
	if(IsInState('DualAction') || IsInState('PendingDualAction'))
	{
		return false;
	}
	// End:0x62
	if((WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_FullAuto") || WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_None")
	{
		return true;
	}
	// End:0x9B
	if((((Mode > 0) && OtherGun != none) && D49Revolver(OtherGun) != none) && FireCount < 1)
	{
		return true;
	}
	// End:0x165
	if((float(FireCount) >= WeaponModes[int(CurrentWeaponMode)].Value) && (((!IsSlave() || WeaponModes[int(CurrentWeaponMode)].ModeID != "WM_SemiAuto") || OtherGun.WeaponModes[int(OtherGun.CurrentWeaponMode)].ModeID != "WM_SemiAuto") || int(OtherGun.HandgunGroup) == int(HandgunGroup)) || LastFireTime > (Level.TimeSeconds - SingleHeldRate))
	{
		return false;
	}
	// End:0x1E9
	if(((OtherGun != none) && CanAlternate(Mode)) && Mode == 0)
	{
		// End:0x1E7
		if(((!OtherGun.HasAmmoLoaded(byte(Mode)) || LastFireTime <= OtherGun.LastFireTime) && FireCount < 1) && OtherGun.FireCount < 1)
		{
			return true;
		}
		return false;
	}
	return true;
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
	SpawnLaserDot(HitLocation);
	// End:0xA9
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
	bLaserOn = !bLaserOn;
	// End:0x20
	if(!bLaserOn)
	{
		KillLaserDot();
	}
	//return;	
}

function byte BestMode()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0xC7
	if(B.Skill > float(Rand(6)))
	{
		// End:0xC4
		if((AimComponent.GetChaos() < 0.1000000) || (AimComponent.GetChaos() < 0.5000000) && VSize(B.Enemy.Location - Instigator.Location) < float(500))
		{
			return 1;
		}		
	}
	else
	{
		// End:0xD6
		if(FRand() > 0.7500000)
		{
			return 1;
		}
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.5000000, dist, 768.0000000, 3072.0000000);
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

simulated state Raising
{Begin:

	OtherGun.SetBoneScale(8, 0.0000000, OtherGun.SupportHandBone);
	SafePlayAnim(SelectAnim, 1.5000000, 0.1000000);
	SetBoneRotation('Hammer', rot(0, 0, 0));
	FinishAnim();
	OtherGun.HandgunRaised(self);
	HandgunRaised(self);
	// End:0x81
	if(int(ClientState) == int(4))
	{
		PlayIdle();
	}
	GotoState('None');
	stop;				
}

simulated state Lowering
{Begin:

	SetBoneRotation('Hammer', rot(0, 0, 0));
	SafePlayAnim(PutDownAnim, 1.5000000, 0.1000000);
	FinishAnim();
	GotoState('Lowered');
	stop;					
}

defaultproperties
{
	RevReloadSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-Click',Volume=0.4000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	RevOpenSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-Open',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	RevCloseSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-Close',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	RevSpinSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-Spin',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=0.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	Shells[0]=(ShellState=0,BulletName="Bullet1",ShellName="Shell1",NextShell=2)
	Shells[1]=(ShellState=0,BulletName="Bullet4",ShellName="Shell4",NextShell=3)
	Shells[2]=(ShellState=0,BulletName="Bullet2",ShellName="Shell2",NextShell=4)
	Shells[3]=(ShellState=0,BulletName="Bullet5",ShellName="Shell5",NextShell=5)
	Shells[4]=(ShellState=0,BulletName="Bullet3",ShellName="Shell3",NextShell=1)
	Shells[5]=(ShellState=0,BulletName="Bullet6",ShellName="Shell6",NextShell=0)
	bShouldDualInLoadout=false
	HandgunGroup=1
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;10.0;0.6;50.0;1.0;0.0;-999.0")
	AIReloadTime=1.5000000
	SightAnimScale=0.5000000
	ParamsClasses[0]=Class'BallisticProV55.D49WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.D49WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.D49WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.D49WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_D49'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Pullout',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightFXClass=Class'BallisticProV55.D49SightLEDs'
	bNoCrosshairInScope=true
	SightBobScale=1.0000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-ShellOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-ShellIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	bAltTriggerReload=true
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc6',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Dot1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=255,G=0,B=0,A=142),Color2=(R=255,G=255,B=0,A=255),StartSize1=144,StartSize2=15)
	NDCrosshairInfo=(SpreadRatios=(X1=0.7500000,Y1=0.7500000,X2=0.3000000,Y2=0.3000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	ManualLines[0]="Fires from a single barrel. Powerful, but short-ranged and has high recoil."
	ManualLines[1]="Fires both barrels at once. Twice as much recoil as the single fire with lower sustained damage output."
	ManualLines[2]="The D49 is very effective at close range. However, it suffers from a cripplingly long reload time. When dual wielded, both pistols will fire simultaneously, allowing the altfire to be used for an extremely powerful attack."
	SightPivot=(Pitch=350,Yaw=-48,Roll=-500)
	SightOffset=(X=-11.0000000,Y=-4.6000000,Z=25.5000000)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-2500,Roll=0)
	RootAdjust=(Pitch=2000,Yaw=-375,Roll=0)
	FireModeClass[0]=Class'BallisticProV55.D49PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.D49SecondaryFire'
	PutDownAnimRate=1.2500000
	PutDownTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bSniping=true
	Description="Another fine weapon designed by the acclaimed 'Black & Wood' company, the D49 revolver is a true hand cannon. Based on weapons of old, the D49 was intended for non-military use, but rather for self defense and civilian purposes. The dual-barrel design has made it a favourite among it's users, capable of causing massive damage if used correctly, able to easily kill an armored Terran."
	Priority=22
	HudColor=(R=200,G=200,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=2
	PickupClass=Class'BallisticProV55.D49Pickup'
	PlayerViewOffset=(X=10.0000000,Y=7.0000000,Z=-16.5000000)
	AttachmentClass=Class'BallisticProV55.D49Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_D49'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="D49 Revolver"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.D49_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BW_Core_WeaponTex.D49.D49-Shiney'
	Skins[2]=Shader'BW_Core_WeaponTex.D49.D49Shells-Shiney'
}
