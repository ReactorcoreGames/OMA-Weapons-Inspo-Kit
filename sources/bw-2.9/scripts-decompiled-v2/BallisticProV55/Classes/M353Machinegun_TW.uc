class M353Machinegun_TW extends BallisticMachinegun
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M;
	local Weapon W;
	local bool bPossiblySwitch, bJustSpawned;

	Instigator = Other;
	bJustSpawned = true;
	super(BallisticWeapon).GiveTo(Other);
	bPossiblySwitch = true;
	W = self;
	M = 0;
	J0x34:

	// End:0x99 [Loop If]
	if(M < 2)
	{
		// End:0x8F
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			W.GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0x34;
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

simulated function ApplyAimToView()
{
	local Rotator AimPivotDelta, RecoilPivotDelta;

	// End:0x47
	if(((Instigator.Controller == none) || AIController(Instigator.Controller) != none) || !Instigator.IsLocallyControlled())
	{
		return;
	}
	RecoilPivotDelta = RcComponent.CalcViewPivotDelta();
	AimPivotDelta = AimComponent.CalcViewPivotDelta();
	// End:0xA2
	if(RcComponent.ShouldUpdateView())
	{
		Instigator.SetViewRotation(AimPivotDelta + RecoilPivotDelta);		
	}
	else
	{
		Instigator.SetViewRotation(AimPivotDelta);
	}
	//return;	
}

simulated function Notify_M353FlapOpenedReload()
{
	PlayReload();
	//return;	
}

function InitTurretWeapon(BallisticTurret Turret)
{
	Ammo[0].AmmoAmount = Turret.AmmoAmount[0];
	//return;	
}

simulated function PostBeginPlay()
{
	super(BallisticWeapon).PostBeginPlay();
	BallisticFire(FireMode[0]).BrassOffset = vect(0.0000000, 0.0000000, 0.0000000);
	//return;	
}

simulated function Notify_Undeploy()
{
	// End:0x36
	if((BallisticTurret(Instigator) != none) && int(Role) == int(ROLE_Authority))
	{
		BallisticTurret(Instigator).UndeployTurret();
	}
	//return;	
}

simulated function Notify_Deploy()
{
	//return;	
}

simulated function PreDrawFPWeapon()
{
	SetRotation(Instigator.Rotation);
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x2D
	if(Anim == 'Undeploy')
	{
		Notify_Undeploy();
		return;
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated event Timer()
{
	local int Mode;

	AimComponent.Reaim(0.1000000);
	// End:0x185
	if(int(ClientState) == int(2))
	{
		Mode = 0;
		J0x2B:

		// End:0x67 [Loop If]
		if(Mode < 2)
		{
			// End:0x5D
			if(FireMode[Mode] != none)
			{
				FireMode[Mode].InitEffects();
			}
			Mode++;
			// [Loop Continue]
			goto J0x2B;
		}
		PlayIdle();
		ClientState = 4;
		// End:0xEC
		if(((int(CrosshairMode) != int(2)) && PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).myHUD != none)
		{
			PlayerController(Instigator.Controller).myHUD.bCrosshairShow = false;
		}
		// End:0x106
		if(bNeedCock)
		{
			// End:0x106
			if(MagAmmo > 0)
			{
				CommonCockGun();
			}
		}
		// End:0x118
		if(int(Role) < int(ROLE_Authority))
		{
			return;
		}
		// End:0x157
		if(ThirdPersonActor != none)
		{
			ThirdPersonActor.Destroy();
			ThirdPersonActor = Spawn(AttachmentClass, Owner);
			InventoryAttachment(ThirdPersonActor).InitFor(self);
		}
		ThirdPersonActor.SetLocation(Instigator.Location);
		ThirdPersonActor.SetBase(Instigator);		
	}
	else
	{
		// End:0x26F
		if(int(ClientState) == int(3))
		{
			// End:0x1B3
			if(SightFX != none)
			{
				SightFX.Destroy();
				SightFX = none;
			}
			// End:0x1D8
			if(Instigator.PendingWeapon == none)
			{
				PlayIdle();
				ClientState = 4;				
			}
			else
			{
				ClientState = 1;
				Instigator.ChangedWeapon();
				Mode = 0;
				J0x1F6:

				// End:0x232 [Loop If]
				if(Mode < 2)
				{
					// End:0x228
					if(FireMode[Mode] != none)
					{
						FireMode[Mode].DestroyEffects();
					}
					Mode++;
					// [Loop Continue]
					goto J0x1F6;
				}
				// End:0x26C
				if((PlayerSpeedFactor != float(0)) && PlayerSpeedUp)
				{
					Instigator.GroundSpeed *= (float(1) / PlayerSpeedFactor);
					PlayerSpeedUp = false;
				}
			}			
		}
		else
		{
			// End:0x2B1
			if(((int(ClientState) == int(0)) && Instigator.PendingWeapon == none) && bNeedCock)
			{
				// End:0x2B1
				if(MagAmmo > 0)
				{
					CommonCockGun();
				}
			}
		}
	}
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	DisplayFOV = Instigator.Controller.FovAngle;
	super(BallisticWeapon).RenderOverlays(C);
	//return;	
}

simulated function ApplyAimRotation()
{
	ApplyAimToView();
	BallisticTurret(Instigator).WeaponPivot = GetFireRot() * (DisplayFOV / Instigator.Controller.FovAngle);
	//return;	
}

simulated function PlayReload()
{
	PlayAnim('ReloadHandle', ReloadAnimRate,, int(0.2500000));
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
		PlayAnim('ReloadFinishHandle', ReloadAnimRate, 0.2000000);
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

defaultproperties
{
	BoxOnSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-BoxOn',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	BoxOffSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-BoxOff',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlapUpSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-FlapUp',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlapDownSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-FlapDown',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;25.0;0.7;-1.0;0.4;0.4;-999.0")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BallisticProV55.M353TW_WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.M353TW_WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.M353TW_WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.M353TW_WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_M353'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst of Five",bUnavailable=false,ModeID="WM_BigBurst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=3
	SightFXClass=Class'BallisticProV55.M353SightLEDs'
	bUseSights=false
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ReloadAnim="ReloadStart"
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-ShellOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-ShellIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M353OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M353InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=128),Color2=(R=255,G=255,B=0,A=246),StartSize1=89,StartSize2=96)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.1000000,X2=0.5000000,Y2=0.1000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	bWT_Machinegun=true
	SightPivot=(Pitch=100,Yaw=0,Roll=0)
	SightOffset=(X=-4.0000000,Y=0.0000000,Z=5.2000000)
	bUseSpecialAim=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BallisticProV55.M353TW_PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.M353SecondaryFire'
	SelectAnim="Deploy"
	PutDownTime=0.4000000
	BringUpTime=1.0000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	bCanThrow=false
	bNoInstagibReplace=true
	Description="M353 MachineGun||Manufacturer: Enravion Combat Solutions|Primary: Very fast inaccurate fire|Secondary: Mount Machinegun||The M353 'Guardian' Machinegun, has seen some of the most brutal battles ever recorded in recent history, and has helped win many of them, the most famous being the bloody 'Wasteland Seige' where 12 million Krao were slaughtered along a 500 mile line of defences. Used primarily as a defensive weapon, the M353's incredible rate of fire can quickly and effectively destroy masses of oncoming foes, especially melee attackers. When the secondary mode is activated, the Guardian, becomes much more accurate when the user mounts it on the ground, allowing it to be a very effective defensive weapon. With it's high rate of fire and high damage, the M353 becomes very inaccurate after just a few rounds and with its high ammo capacity, comes the difficulty of longer reload times than smaller weapons."
	DisplayFOV=90.0000000
	ClientState=2
	Priority=1
	HudColor=(R=100,G=150,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	PickupClass=Class'BallisticProV55.M353Pickup'
	PlayerViewOffset=(X=11.0000000,Y=0.0000000,Z=-14.0000000)
	AttachmentClass=Class'BallisticProV55.M353Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_M353'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="M353 Machinegun Turret"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M353Turret_FPm'
	DrawScale=0.6000000
	CollisionHeight=26.0000000
}
