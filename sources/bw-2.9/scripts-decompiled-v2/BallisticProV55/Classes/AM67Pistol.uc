class AM67Pistol extends BallisticHandgun
	config(BallisticProV55);

var() bool bHasLaserSight;
var() bool bLaserOn;
var() bool bOldLaserOn;
var() bool bStriking;
var() LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var bool bHasCombatLaser;
var Emitter LaserBlast;
var() float LaserAmmo;
var() float LaserChargeRate;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		LaserAmmo, bHasCombatLaser, 
		bLaserOn;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasCombatLaser = false;
	bHasLaserSight = false;
	// End:0x51
	if(InStr(WeaponParams.LayoutTags, "combat_laser") != -1)
	{
		bHasCombatLaser = true;
	}
	// End:0x89
	if(InStr(WeaponParams.LayoutTags, "target_laser") != -1)
	{
		bHasLaserSight = true;
		bShowChargingBar = false;
	}
	//return;	
}

simulated function bool MasterCanSendMode(int Mode)
{
	return ((Mode == 0) || OtherGun.Class == Class) || Level.TimeSeconds <= FireMode[1].NextFireTime;
	//return;	
}

simulated function bool CanAlternate(int Mode)
{
	// End:0x0D
	if(Mode != 0)
	{
		return true;
	}
	return super.CanAlternate(Mode);
	//return;	
}

simulated function bool CanSynch(byte Mode)
{
	return false;
	// End:0x11
	if(int(Mode) != 0)
	{
		return false;
	}
	return super.CanSynch(Mode);
	//return;	
}

simulated function OnAimParamsChanged()
{
	super(BallisticWeapon).OnAimParamsChanged();
	// End:0x15
	if(bLaserOn)
	{
		ApplyLaserAim();
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x14
	if(bNeedCock)
	{
		BringUpTime = 0.4000000;
	}
	super.BringUp(PrevWeapon);
	BringUpTime = default.BringUpTime;
	// End:0x85
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		// End:0x77
		if(bHasCombatLaser)
		{
			Laser = Spawn(Class'BallisticProV55.LaserActor_GRSNine');			
		}
		else
		{
			Laser = Spawn(Class'BallisticProV55.LaserActor');
		}
	}
	// End:0xBE
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0x118
	if(((Instigator != none) && LaserBlast == none) && PlayerController(Instigator.Controller) != none)
	{
		LaserBlast = Spawn(Class'BallisticProV55.GRS9LaserOnFX');
		Class'BCoreProV55.DGVEmitter'.static.ScaleEmitter(LaserBlast, DrawScale);
	}
	// End:0x158
	if(((Instigator != none) && bHasLaserSight) && AIController(Instigator.Controller) != none)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
	}
	// End:0x17E
	if(ThirdPersonActor != none)
	{
		AM67Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x25
	if(bHasCombatLaser)
	{
		return FClamp(LaserAmmo / default.LaserAmmo, 0.0000000, 1.0000000);		
	}
	else
	{
		// End:0xB5
		if(Level.TimeSeconds >= FireMode[1].NextFireTime)
		{
			// End:0x86
			if(FireMode[1].bIsFiring)
			{
				return FMin(1.0000000, FireMode[1].HoldTime / FireMode[1].MaxHoldTime);
			}
			return FMin(1.0000000, AM67SecondaryFire(FireMode[1]).DecayCharge / FireMode[1].MaxHoldTime);
		}
		return (FireMode[1].NextFireTime - Level.TimeSeconds) / FireMode[1].FireRate;
	}
	//return;	
}

simulated event Tick(float dt)
{
	super(BallisticWeapon).Tick(dt);
	// End:0x9E
	if(bHasCombatLaser)
	{
		// End:0x6A
		if((LaserAmmo < default.LaserAmmo) && (FireMode[1] == none) || !FireMode[1].IsFiring())
		{
			LaserAmmo = FMin(default.LaserAmmo, LaserAmmo + (dt * LaserChargeRate));
		}
		// End:0x9E
		if(bLaserOn && AM67Attachment(ThirdPersonActor) != none)
		{
			AM67Attachment(ThirdPersonActor).LaserSizeAdjust = LaserAmmo;
		}
	}
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

simulated function ApplyLaserAim()
{
	AimComponent.AimAdjustTime *= 0.6500000;
	AimComponent.AimSpread.Max *= 0.6500000;
	AimComponent.AimSpread.Min *= 0.6500000;
	//return;	
}

simulated function PlayIdle()
{
	super(BallisticWeapon).PlayIdle();
	// End:0x54
	if((((!bLaserOn || bPendingSightUp) || int(SightingState) != int(0)) || bScopeView) || !CanPlayAnim(IdleAnim,, "IDLE"))
	{
		return;
	}
	FreezeAnimAt(0.0000000);
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x3F
	if(bLaserOn != default.bLaserOn)
	{
		default.bLaserOn = bLaserOn;
		ClientSwitchLaser();
	}
	super(Weapon).PostNetReceive();
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		AM67Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	OnLaserSwitched();
	// End:0x51
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	OnLaserSwitched();
	// End:0x37
	if(bLaserOn)
	{
		SpawnLaserDot();
		// End:0x34
		if(!bHasCombatLaser)
		{
			PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);
		}		
	}
	else
	{
		KillLaserDot();
		// End:0x5C
		if(!bHasCombatLaser)
		{
			PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
		}
	}
	PlayIdle();
	//return;	
}

simulated function KillLaserDot()
{
	// End:0x32
	if(LaserDot != none)
	{
		LaserDot.bHidden = false;
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function SpawnLaserDot(optional Vector loc)
{
	// End:0x65
	if(LaserDot == none)
	{
		// End:0x2C
		if(bHasCombatLaser)
		{
			LaserDot = Spawn(Class'BallisticProV55.IE_GRS9LaserHit',,, loc);			
		}
		else
		{
			LaserDot = Spawn(Class'BallisticProV55.M806LaserDot',,, loc);
		}
		// End:0x65
		if(LaserDot != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(LaserDot, 1.5000000);
		}
	}
	//return;	
}

simulated function Destroyed()
{
	default.bLaserOn = false;
	// End:0x1F
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x36
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function bool PutDown()
{
	// End:0x32
	if(super.PutDown())
	{
		KillLaserDot();
		// End:0x30
		if(ThirdPersonActor != none)
		{
			AM67Attachment(ThirdPersonActor).bLaserOn = false;
		}
		return true;
	}
	return false;
	//return;	
}

simulated function Vector ConvertFOVs(Vector InVec, float InFOV, float OutFOV, float Distance)
{
	local Vector ViewLoc, Outvec, Dir, X, Y, Z;

	local Rotator ViewRot;

	ViewLoc = Instigator.Location + Instigator.EyePosition();
	ViewRot = Instigator.GetViewRotation();
	Dir = InVec - ViewLoc;
	GetAxes(ViewRot, X, Y, Z);
	Outvec.X = Distance / Tan((OutFOV * 3.1415930) / float(360));
	Outvec.Y = ((Dir Dot Y) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec.Z = ((Dir Dot Z) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec = Outvec >> ViewRot;
	return Outvec + ViewLoc;
	//return;	
}

simulated function DrawLaserSight(Canvas Canvas)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator AimDir;
	local Actor Other;
	local bool bAimAligned;

	// End:0x1F
	if((int(ClientState) == int(1)) || !bLaserOn)
	{
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	loc = GetBoneCoords('tip2').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(4000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xB7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x11C
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.1000000)
	{
		bAimAligned = true;
	}
	// End:0x140
	if(bAimAligned && Other != none)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x19F
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		LaserDot.SetRotation(Rotator(HitNormal));
		Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	}
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x208
	if(bAimAligned)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip2');
		Laser.SetRotation(AimDir);
	}
	// End:0x28C
	if((LaserBlast != none) && bHasCombatLaser)
	{
		LaserBlast.SetLocation(Laser.Location);
		LaserBlast.SetRotation(Laser.Rotation);
		Canvas.DrawActor(LaserBlast, false, false, DisplayFOV);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	// End:0x2FC
	if(bHasCombatLaser)
	{
		Scale3D.Y = 2.0000000 * (float(1) + (float(4) * FMax(0.0000000, LaserAmmo - 0.5000000)));
		Scale3D.Z = Scale3D.Y;		
	}
	else
	{
		Scale3D.Y = 3.0000000;
		Scale3D.Z = 3.0000000;
	}
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	super.RenderOverlays(Canvas);
	// End:0x18
	if(IsInState('Lowered'))
	{
		return;
	}
	DrawLaserSight(Canvas);
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float Result, dist;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x7B
	if(bNoaltfire)
	{
		return 0;		
	}
	else
	{
		// End:0x157
		if(bHasCombatLaser)
		{
			// End:0xC7
			if((LaserAmmo < 0.3000000) || (Level.TimeSeconds - AM67SecondaryFire(FireMode[1]).StopFireTime) < 0.8000000)
			{
				return 0;
			}
			// End:0xDB
			if(dist > float(3000))
			{
				return 0;
			}
			Result = (FRand() * 0.2000000) + FMin(1.0000000, LaserAmmo / (default.LaserAmmo / float(2)));
			// End:0x125
			if(dist < float(500))
			{
				Result += 0.5000000;				
			}
			else
			{
				// End:0x142
				if(dist > float(1500))
				{
					Result -= 0.3000000;
				}
			}
			// End:0x154
			if(Result > 0.5000000)
			{
				return 1;
			}			
		}
		else
		{
			// End:0x19E
			if(((Level.TimeSeconds >= FireMode[1].NextFireTime) && FRand() > 0.6000000) && dist < float(1200))
			{
				return 1;
			}
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.5000000, dist, 1536.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.7000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.7000000;
	//return;	
}

defaultproperties
{
	LaserAmmo=1.0000000
	LaserChargeRate=0.1250000
	bShouldDualInLoadout=false
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;15.0;0.8;50.0;0.0;0.5;-999.0")
	AIReloadTime=1.5000000
	SightAnimScale=0.3000000
	ParamsClasses[0]=Class'BallisticProV55.AM67WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.AM67WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.AM67WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.AM67WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_AM67'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Pullout',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightFXClass=Class'BallisticProV55.AM67SightLEDs'
	bNoCrosshairInScope=true
	SightBobScale=0.5000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc9',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=0,G=0,B=0,A=194),Color2=(R=0,G=255,B=0,A=255),StartSize1=80,StartSize2=26)
	NDCrosshairInfo=(SpreadRatios=(X1=0.7500000,Y1=0.7500000,X2=0.3000000,Y2=0.3000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	ManualLines[0]="High-powered bullet fire. Recoil is high."
	ManualLines[1]="Engages the integrated flash device. The fire key must be held until the flash triggers. Blinds enemies for a short duration. Enemies closer both to the player and to the point of aim will be blinded for longer."
	ManualLines[2]="Effective at close and medium range."
	SightingTime=0.2500000
	SightOffset=(X=-24.0000000,Y=0.0600000,Z=4.4300000)
	MagAmmo=8
	FireModeClass[0]=Class'BallisticProV55.AM67PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.AM67SecondaryFire'
	PutDownTime=0.6000000
	BringUpTime=0.9000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bShowChargingBar=true
	Description="Another of Enravion's fine creations, the AM67 Assault Pistol was designed for close quarters combat against Cryon and Skrith warriors.|Initially constructed before the second war, Enravion produced the AM67, primarily for anti-Cryon operations, but it later proved to perform well in close-quarters combat when terran forces were ambushed by the stealthy Skrith warriors."
	Priority=24
	HudColor=(R=50,G=150,B=25,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=6
	PickupClass=Class'BallisticProV55.AM67Pickup'
	PlayerViewOffset=(X=20.0000000,Y=3.0000000,Z=-8.0000000)
	AttachmentClass=Class'BallisticProV55.AM67Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_AM67'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="AM67 Assault Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.AM67_FPm'
	DrawScale=0.3000000
}
