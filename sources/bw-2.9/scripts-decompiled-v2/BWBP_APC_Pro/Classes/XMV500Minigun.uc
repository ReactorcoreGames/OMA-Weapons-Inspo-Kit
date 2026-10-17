class XMV500Minigun extends BallisticWeapon
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var float DesiredSpeed;
var float BarrelSpeed;
var int BarrelTurn;
var() Sound BarrelSpinSound;
var() Sound BarrelStopSound;
var() Sound BarrelStartSound;
var() Sound DeploySound;
var() Sound UndeploySound;
var bool bRunOffsetting;
var() Rotator RunOffset;
var float RotationSpeeds[5];
var bool bLaserOn;
var LaserActor Laser;
var float lastModeChangeTime;
var() Sound LaserOnSound;
var() Sound ModeCycleSound;
var() Sound LaserOffSound;
var Emitter LaserDot;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		SetServerTurnVelocity;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x4C
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor');
	}
	// End:0x85
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0xBA
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
	}
	// End:0xF0
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';		
	}
	else
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';
	}
	// End:0x12C
	if(ThirdPersonActor != none)
	{
		XMV500MinigunAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	bRunOffsetting = false;
	//return;	
}

simulated function PlayIdle()
{
	super.PlayIdle();
	// End:0x54
	if((((!bLaserOn || bPendingSightUp) || int(SightingState) != int(0)) || bScopeView) || !CanPlayAnim(IdleAnim,, "IDLE"))
	{
		return;
	}
	FreezeAnimAt(0.0000000);
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
	AimComponent.AimAdjustTime *= 1.5000000;
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

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		XMV500MinigunAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
	// End:0x26
	if(bLaserOn)
	{
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 3.7000000,, 32.0000000);		
	}
	else
	{
		KillLaserDot();
		PlaySound(LaserOffSound,, 3.7000000,, 32.0000000);
	}
	// End:0x62
	if(!IsInState('DualAction') && !IsInState('PendingDualAction'))
	{
		PlayIdle();
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

	// End:0x4F
	if(((((int(ClientState) == int(1)) || !bLaserOn) || Instigator == none) || Instigator.Controller == none) || Laser == none)
	{
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	loc = GetBoneCoords('ejector').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xE7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x126
	if(((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction'))
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x148
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x22F
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('ejector');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	super.RenderOverlays(Canvas);
	// End:0x23
	if(!IsInState('Lowered'))
	{
		DrawLaserSight(Canvas);
	}
	//return;	
}

function SetServerTurnVelocity(int NewTVYaw, int NewTVPitch)
{
	XMV500MinigunPrimaryFire(FireMode[0]).TurnVelocity.Yaw = NewTVYaw;
	XMV500MinigunPrimaryFire(FireMode[0]).TurnVelocity.Pitch = NewTVPitch;
	//return;	
}

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	local string S;

	super.DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(byte(255), 128, 128);
	S = (((((("XMV500Minigun: TraceCount: " $ string(XMV500MinigunPrimaryFire(FireMode[0]).TraceCount)) $ ", FireRate: ") $ string(1.0000000 / FireMode[0].FireRate)) $ "TurnVelocity: ") $ string(XMV500MinigunPrimaryFire(FireMode[0]).TurnVelocity.Pitch)) $ ", ") $ string(XMV500MinigunPrimaryFire(FireMode[0]).TurnVelocity.Yaw);
	Canvas.DrawText(S);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	XMV500MinigunPrimaryFire(FireMode[0]).Minigun = self;
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
	// End:0x44
	if(super.PutDown())
	{
		KillLaserDot();
		// End:0x30
		if(ThirdPersonActor != none)
		{
			XMV500MinigunAttachment(ThirdPersonActor).bLaserOn = false;
		}
		AmbientSound = none;
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
	// End:0x73
	if(FireMode[0].IsFiring())
	{
		BarrelSpeed = BarrelSpeed + FClamp(DesiredSpeed - BarrelSpeed, -0.2000000 * dt, 0.6500000 * dt);
		BarrelTurn += int((BarrelSpeed * float(655360)) * dt);		
	}
	else
	{
		// End:0x14D
		if(BarrelSpeed > float(0))
		{
			BarrelSpeed = FMax(BarrelSpeed - (0.0750000 * dt), 0.0100000);
			OldBarrelTurn = float(BarrelTurn);
			BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
			// End:0x14D
			if((BarrelSpeed <= 0.0250000) && int(OldBarrelTurn / 10922.6700000) < int(float(BarrelTurn) / 10922.6700000))
			{
				BarrelTurn = int(float(int(float(BarrelTurn) / 10922.6700000)) * 10922.6700000);
				BarrelSpeed = 0.0000000;
				PlaySound(BarrelStopSound, 0, 0.5000000,, 32.0000000, 1.0000000, true);
				AmbientSound = none;
			}
		}
	}
	// End:0x17E
	if(BarrelSpeed > float(0))
	{
		AmbientSound = BarrelSpinSound;
		SoundPitch = byte(float(32) + (float(96) * BarrelSpeed));
	}
	// End:0x1A2
	if(ThirdPersonActor != none)
	{
		XMV500MinigunAttachment(ThirdPersonActor).BarrelSpeed = BarrelSpeed;
	}
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	super.NewDrawWeaponInfo(C, YPos);
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

simulated function ServerSwitchWeaponMode(byte newmode)
{
	PlaySound(ModeCycleSound,, 4.7000000,, 32.0000000);
	newmode = byte(int(CurrentWeaponMode) + 1);
	J0x26:

	// End:0x8C [Loop If]
	if((int(newmode) != int(CurrentWeaponMode)) && (int(newmode) >= WeaponModes.Length) || WeaponModes[int(newmode)].bUnavailable)
	{
		// End:0x82
		if(int(newmode) >= WeaponModes.Length)
		{
			newmode = 0;			
		}
		else
		{
			newmode++;
		}
		// [Loop Continue]
		goto J0x26;
	}
	// End:0xAF
	if(!WeaponModes[int(newmode)].bUnavailable)
	{
		CurrentWeaponMode = newmode;
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

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Pawn ExcludedPawn)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x174
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x173
		if((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && (ExcludedPawn == none) || Victims != ExcludedPawn)
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

simulated function float ChargeBar()
{
	return BarrelSpeed / DesiredSpeed;
	//return;	
}

function Notify_Deploy()
{
	local Vector HitLoc, HitNorm, Start, End;
	local Actor t;
	local Rotator CompressedEq;
	local BallisticAutoTurret Turret;
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
	// End:0x261
	if(Sandbag(t) != none)
	{
		HitLoc = t.Location;
		HitLoc.Z += (Class'BWBP_APC_Pro.XMV500AutoTurret'.default.CollisionHeight + t.CollisionHeight);		
	}
	else
	{
		HitLoc.Z += (Class'BWBP_APC_Pro.XMV500AutoTurret'.default.CollisionHeight - float(9));
	}
	CompressedEq = Instigator.Rotation;
	CompressedEq.Pitch = (CompressedEq.Pitch >> 8) & 255;
	CompressedEq.Yaw = (CompressedEq.Yaw >> 8) & 255;
	CompressedEq.Pitch = CompressedEq.Pitch << 8;
	CompressedEq.Yaw = CompressedEq.Yaw << 8;
	Turret = Spawn(Class'BWBP_APC_Pro.XMV500AutoTurret', none,, HitLoc, CompressedEq);
	// End:0x350
	if(Turret != none)
	{
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
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	// End:0xB6
	if(dist > float(1000))
	{
		Result -= ((dist - float(1000)) / float(3000));
	}
	// End:0x108
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		Result += 0.2000000;		
	}
	else
	{
		// End:0x16A
		if(((B.Enemy.Weapon != none) && B.Enemy.Weapon.bSniping) && dist > float(500))
		{
			Result -= 0.4000000;
		}
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return -1.3000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -1.4000000;
	//return;	
}

defaultproperties
{
	BarrelSpinSound=Sound'BWBP_SKC_Sounds.550.Mini-Rotor'
	BarrelStopSound=Sound'BWBP_SKC_Sounds.550.Mini-Down'
	BarrelStartSound=Sound'BWBP_SKC_Sounds.550.Mini-Up'
	DeploySound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Deploy'
	UndeploySound=Sound'BW_Core_WeaponSound.XMV-850.XMV-UnDeploy'
	RotationSpeeds[0]=0.1600000
	RotationSpeeds[1]=0.3300000
	RotationSpeeds[2]=0.6600000
	RotationSpeeds[3]=1.0000000
	RotationSpeeds[4]=1.3200000
	LaserOnSound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOn'
	ModeCycleSound=Sound'BWBP_SKC_Sounds.AH104.AH104-ModeCycle'
	LaserOffSound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOff'
	SpecialInfo[0]=(Id="EvoDefs",Info="480.0;55.0;2.0;100.0;0.5;0.5;0.7")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BWBP_APC_Pro.XMV500WeaponParams'
	ParamsClasses[1]=Class'BWBP_APC_Pro.XMV500WeaponParamsClassic'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="600 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="1200 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="2400 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="3600 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="4800 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightBobScale=0.5000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bNonCocking=true
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	bWT_Bullet=true
	bWT_Machinegun=true
	bWT_Super=true
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	SightOffset=(X=15.0000000,Y=-17.0000000,Z=75.0000000)
	MagAmmo=800
	FireModeClass[0]=Class'BWBP_APC_Pro.XMV500MinigunPrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.XMV500MinigunSecondaryFire'
	SelectAnimRate=0.7500000
	PutDownTime=0.8000000
	BringUpTime=2.0000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	bShowChargingBar=true
	Description="XMB-500 Smart Minigun|Manuacturer: Enravion Combat Solutions|Primary: Auto fire||The XMB-500 Personal Suppression System is a prototype weapon being developed by Enravion as a low-recoil, precision minigun. The XMB-500 has been designed for ease of use with infantry and boasts firerates of 600 to 2400 RPM; combined with the potent incendiary rounds, the accurate XMB-500 is perfect for cutting down large amounts of enemy troops. This weapon has excellent accuracy when stationary but unfortunately cannot be fired safely at the higher speeds while moving. To prevent damage to the user and the weapon, the XMB-500 will automatically lock when mobile at cyclic speeds over 600 RPM. It should be noted that the speed sensor will malfunction if submerged in liquid or not properly cared for."
	Priority=48
	InventoryGroup=6
	GroupOffset=3
	PickupClass=Class'BWBP_APC_Pro.XMV500Pickup'
	PlayerViewOffset=(X=20.0000000,Y=17.0000000,Z=-50.0000000)
	BobDamping=0.5000000
	AttachmentClass=Class'BWBP_APC_Pro.XMV500MinigunAttachment'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=25)
	ItemName="[B] XMB-500 Smart Minigun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	DrawScale=0.6000000
	SoundRadius=128.0000000
}
