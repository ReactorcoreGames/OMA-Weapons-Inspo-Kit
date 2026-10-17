class CoachGun extends BallisticProShotgun
	config(BallisticProV55);

const DeployRange = 512;

struct DeployableInfo
{
	var Class<Actor> dClass;
	var float WarpInTime;
	var int SpawnOffset;
	var bool CheckSlope;
	var float CoolDownDelay;
};

var() Sound CoachOpenSound;
var() Sound CoachCloseSound;
var() Sound ShieldFailSound;
var byte OldWeaponMode;
var Actor ReloadSteam;
var Actor ReloadSteam2;
var float lastModeChangeTime;
var() Material MatRedShell;
var() Material MatGreenShell;
var() Material MatBlackShell;
var() name ShellTipBone1;
var() name ShellTipBone2;
var() name ShellTipBone3;
var() name ShellTipBone4;
var() name LastShellBone;
var bool bLastShell;
var bool bNowEmpty;
var() bool bQuickLoad;
var bool bRightLoaded;
var bool bLeftLoaded;
var() float SingleReloadAnimRate;
var() bool bHasShield;
var DeployableInfo AltDeployable;
var float CooldownTime;
var CoachGunFireControl FireControl;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		FireControl;
}

exec function offset(int Index, int Value)
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Standalone))
	{
		return;
	}
	AltDeployable.SpawnOffset = Value;
	//return;	
}

simulated function OnWeaponParamsChanged()
{
	super(BallisticWeapon).OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bQuickLoad = false;
	bHasShield = false;
	// End:0x9F
	if(InStr(WeaponParams.LayoutTags, "quickload") != -1)
	{
		bQuickLoad = true;
		AmmoClass[0] = Class'BallisticProV55.Ammo_12Gauge';
		CoachGunPrimaryFire(FireMode[0]).AmmoClass = Class'BallisticProV55.Ammo_12Gauge';
		CoachGunSecondaryFire(FireMode[1]).AmmoClass = Class'BallisticProV55.Ammo_12Gauge';
		Skins[3] = MatRedShell;
	}
	// End:0xC9
	if(InStr(WeaponParams.LayoutTags, "shield") != -1)
	{
		bHasShield = true;
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	local CoachGunFireControl FC;

	super(BallisticWeapon).PostNetBeginPlay();
	// End:0x52
	if((int(Role) == int(ROLE_Authority)) && FireControl == none)
	{
		// End:0x42
		foreach DynamicActors(Class'BWBP_SKC_Pro.CoachGunFireControl', FC)
		{
			FireControl = FC;			
			return;			
		}		
		FireControl = Spawn(Class'BWBP_SKC_Pro.CoachGunFireControl', none);
	}
	//return;	
}

function CoachGunFireControl GetFireControl()
{
	return FireControl;
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x6C
	if(int(CurrentWeaponMode) == 1)
	{
		SetBoneScale(2, 1.0000000, ShellTipBone1);
		SetBoneScale(3, 1.0000000, ShellTipBone2);
		SetBoneScale(4, 1.0000000, ShellTipBone3);
		SetBoneScale(5, 1.0000000, ShellTipBone4);
		Skins[3] = MatBlackShell;		
	}
	else
	{
		SetBoneScale(2, 0.0000000, ShellTipBone1);
		SetBoneScale(3, 0.0000000, ShellTipBone2);
		SetBoneScale(4, 0.0000000, ShellTipBone3);
		SetBoneScale(5, 0.0000000, ShellTipBone4);
		// End:0xCE
		if(bQuickLoad)
		{
			Skins[3] = MatRedShell;			
		}
		else
		{
			Skins[3] = MatGreenShell;
		}
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x1F
	if((int(ReloadState) != int(0)) || !HasAmmo())
	{
		return;
	}
	super(BallisticWeapon).ServerSwitchWeaponMode(newmode);
	ServerStartReload(2);
	//return;	
}

function ServerStartReload(optional byte i)
{
	local int M;

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
	// End:0x3E
	if((int(i) != 2) && MagAmmo >= default.MagAmmo)
	{
		return;
	}
	// End:0x56
	if(Ammo[0].AmmoAmount < 1)
	{
		return;
	}
	M = 0;
	J0x5D:

	// End:0xA9 [Loop If]
	if(M < 2)
	{
		// End:0x9F
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0x5D;
	}
	AnimBlendParams(1, 0.0000000);
	bServerReloading = true;
	CommonStartReload(i);
	ClientStartReload(i);
	//return;	
}

simulated function CommonStartReload(optional byte i)
{
	local int M;

	// End:0x18
	if(int(ClientState) == int(2))
	{
		ClientState = 4;
	}
	// End:0x2C
	if(bShovelLoad)
	{
		ReloadState = 4;		
	}
	else
	{
		ReloadState = 1;
	}
	// End:0x5A
	if(int(i) == 2)
	{
		PlayAnim('Reload', ReloadAnimRate,, int(0.2500000));		
	}
	else
	{
		PlayReload();
	}
	// End:0x88
	if(bScopeView && Instigator.IsLocallyControlled())
	{
		TemporaryScopeDown(default.SightingTime);
	}
	M = 0;
	J0x8F:

	// End:0xD0 [Loop If]
	if(M < 2)
	{
		// End:0xC6
		if(bFireMode[M] != none)
		{
			bFireMode[M].ReloadingGun(i);
		}
		M++;
		// [Loop Continue]
		goto J0x8F;
	}
	// End:0xE1
	if(bCockAfterReload)
	{
		bNeedCock = true;
	}
	// End:0xFF
	if(bCockOnEmpty && MagAmmo < 1)
	{
		bNeedCock = true;
	}
	bNeedReload = false;
	//return;	
}

simulated function PlayReload()
{
	// End:0x38
	if((MagAmmo == 1) && !bNowEmpty)
	{
		PlayAnim('ReloadSingle', SingleReloadAnimRate,, int(0.2500000));
		bLeftLoaded = true;		
	}
	else
	{
		PlayAnim('Reload', ReloadAnimRate,, int(0.2500000));
		bLeftLoaded = true;
		bRightLoaded = true;
	}
	//return;	
}

simulated function bool MayNeedReload(byte Mode, float load)
{
	// End:0x10
	if(bQuickLoad)
	{
		return bNeedReload;
	}
	// End:0x66
	if(((!bNoMag && bFireMode[int(Mode)] != none) && bFireMode[int(Mode)].bUseWeaponMag) && (float(MagAmmo) - load) < float(1))
	{
		return true;
	}
	return bNeedReload;
	//return;	
}

simulated function bool CheckScope()
{
	// End:0x1A
	if(Level.TimeSeconds < NextCheckScopeTime)
	{
		return true;
	}
	NextCheckScopeTime = Level.TimeSeconds + 0.2500000;
	// End:0xDF
	if((((int(Instigator.Controller.bRun) == 0) && int(Instigator.Physics) == int(1)) || (int(Instigator.Physics) == int(2)) && VSize(Instigator.Velocity) > (Instigator.GroundSpeed * 1.5000000)) || (SprintControl != none) && SprintControl.bSprinting)
	{
		StopScopeView();
		return false;
	}
	return true;
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x4D
	if((Anim == FireMode[0].FireAnim) || (FireMode[1] != none) && Anim == FireMode[1].FireAnim)
	{
		bPreventReload = false;
	}
	// End:0xBD
	if((MeleeFireMode != none) && Anim == MeleeFireMode.FireAnim)
	{
		// End:0x8D
		if(int(MeleeState) == int(4))
		{
			MeleeState = 1;			
		}
		else
		{
			MeleeState = 0;
		}
		ReloadState = 0;
		// End:0xB5
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		bPreventReload = false;
	}
	// End:0x15E
	if(((Anim == bFireMode[0].AimedFireAnim) || Anim == CoachGunPrimaryFire(FireMode[0]).AimedFireEmptyAnim) || Anim == CoachGunPrimaryFire(FireMode[0]).AimedFireSingleAnim)
	{
		AnimBlendParams(1, 0.0000000);
		// End:0x156
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		bPreventReload = false;
	}
	// End:0x30B
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0x208
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x277
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x28F
				if(int(MeleeState) < int(2))
				{
					bPreventReload = false;
				}
			}
		}
		// End:0x30B
		if(((Channel == 0) && bNeedReload || ((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring) && int(MeleeState) < int(2))
		{
			PlayIdle();
		}
	}
	// End:0x32B
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x382
	if(int(ReloadState) == int(6))
	{
		// End:0x372
		if((MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x3F5
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x3C3
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
	// End:0x435
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	// End:0x46B
	if(int(ReloadState) == int(9))
	{
		// End:0x45D
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		ReloadState = 0;
		PlayIdle();
	}
	//return;	
}

simulated function CommonSwitchWeaponMode(byte newmode)
{
	super(BallisticWeapon).CommonSwitchWeaponMode(newmode);
	// End:0x63
	if(int(newmode) == 1)
	{
		SetBoneScale(2, 0.0000000, ShellTipBone1);
		SetBoneScale(3, 0.0000000, ShellTipBone2);
		SetBoneScale(4, 1.0000000, ShellTipBone3);
		SetBoneScale(5, 1.0000000, ShellTipBone4);		
	}
	else
	{
		SetBoneScale(2, 1.0000000, ShellTipBone1);
		SetBoneScale(3, 1.0000000, ShellTipBone2);
		SetBoneScale(4, 0.0000000, ShellTipBone3);
		SetBoneScale(5, 0.0000000, ShellTipBone4);
	}
	//return;	
}

simulated function Notify_StartFireReload()
{
	//return;	
}

simulated function Notify_CoachOpen()
{
	PlaySound(CoachOpenSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_CoachCLose()
{
	PlaySound(CoachCloseSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_CoachShellDown()
{
	local Vector Start;

	// End:0x1A5
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Start = (Instigator.Location + Instigator.EyePosition()) + Class'BCoreProV55.BUtil'.static.AlignedOffset(Instigator.GetViewRotation(), vect(5.0000000, 10.0000000, -5.0000000));
		// End:0xE1
		if(MagAmmo == 1)
		{
			// End:0xB0
			if(bQuickLoad)
			{
				Spawn(Class'BallisticProV55.Brass_Shotgun', self,, Start, Instigator.GetViewRotation() + rot(8192, 0, 0));				
			}
			else
			{
				Spawn(Class'BallisticProV55.Brass_MRS138Shotgun', self,, Start, Instigator.GetViewRotation() + rot(8192, 0, 0));
			}			
		}
		else
		{
			// End:0x149
			if(bQuickLoad)
			{
				Spawn(Class'BallisticProV55.Brass_Shotgun', self,, Start, Instigator.GetViewRotation() + rot(8192, 0, 0));
				Spawn(Class'BallisticProV55.Brass_Shotgun', self,, Start, Instigator.GetViewRotation() + rot(8192, 0, 0));				
			}
			else
			{
				Spawn(Class'BallisticProV55.Brass_MRS138Shotgun', self,, Start, Instigator.GetViewRotation() + rot(8192, 0, 0));
				Spawn(Class'BallisticProV55.Brass_MRS138Shotgun', self,, Start, Instigator.GetViewRotation() + rot(8192, 0, 0));
			}
		}
	}
	// End:0x20B
	if(int(CurrentWeaponMode) == 1)
	{
		Skins[3] = MatBlackShell;
		SetBoneScale(2, 1.0000000, ShellTipBone1);
		SetBoneScale(3, 1.0000000, ShellTipBone2);
		SetBoneScale(4, 1.0000000, ShellTipBone3);
		SetBoneScale(5, 1.0000000, ShellTipBone4);		
	}
	else
	{
		// End:0x225
		if(bQuickLoad)
		{
			Skins[3] = MatRedShell;			
		}
		else
		{
			Skins[3] = MatGreenShell;
		}
		SetBoneScale(2, 0.0000000, ShellTipBone1);
		SetBoneScale(3, 0.0000000, ShellTipBone2);
		SetBoneScale(4, 0.0000000, ShellTipBone3);
		SetBoneScale(5, 0.0000000, ShellTipBone4);
	}
	bLastShell = Ammo[0].AmmoAmount == 1;
	// End:0x2C7
	if(bLastShell && MagAmmo != 1)
	{
		SetBoneScale(1, 0.0000000, LastShellBone);
		bNowEmpty = true;		
	}
	else
	{
		SetBoneScale(1, 1.0000000, LastShellBone);
	}
	//return;	
}

simulated function Notify_CoachSteam()
{
	// End:0x17
	if(ReloadSteam != none)
	{
		ReloadSteam.Destroy();
	}
	// End:0x2E
	if(ReloadSteam2 != none)
	{
		ReloadSteam2.Destroy();
	}
	// End:0x60
	if(MagAmmo == 1)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(ReloadSteam, Class'BWBP_SKC_Pro.CoachSteam', DrawScale, self, 'ejector');		
	}
	else
	{
		// End:0xB3
		if(MagAmmo == 0)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(ReloadSteam2, Class'BWBP_SKC_Pro.CoachSteam', DrawScale, self, 'ejector');
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(ReloadSteam, Class'BWBP_SKC_Pro.CoachSteam', DrawScale, self, 'EjectorL');
		}
	}
	// End:0xD5
	if(bNowEmpty)
	{
		SetBoneScale(1, 0.0000000, LastShellBone);
		bNowEmpty = false;
	}
	// End:0xFC
	if(ReloadSteam != none)
	{
		ReloadSteam.SetRelativeRotation(rot(0, 32768, 0));
	}
	// End:0x123
	if(ReloadSteam2 != none)
	{
		ReloadSteam2.SetRelativeRotation(rot(0, 32768, 0));
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(ReloadSteam != none)
	{
		ReloadSteam.Destroy();
	}
	// End:0x2E
	if(ReloadSteam2 != none)
	{
		ReloadSteam2.Destroy();
	}
	super(BallisticWeapon).Destroyed();
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	return;
	// End:0x11
	if(bHasShield)
	{
		Notify_BarrierDeploy();
	}
	//return;	
}

function Rotator GetSlopeRotator(Rotator deploy_rotation_yaw, Vector hit_normal)
{
	local float pitch_degrees, roll_degrees;
	local Rotator Result;

	hit_normal = hit_normal << deploy_rotation_yaw;
	pitch_degrees = (Asin(hit_normal.X) * float(180)) / 3.1415930;
	Result.Pitch = int(-pitch_degrees * float(65536 / 360));
	roll_degrees = (Asin(hit_normal.Y) * float(180)) / 3.1415930;
	Result.Roll = int(roll_degrees * float(65536 / 360));
	return Result;
	//return;	
}

function Notify_BarrierDeploy()
{
	local Actor HitActor;
	local Vector Start, End, HitNorm, HitLoc;
	local CoachGunPreconstructor FSP;
	local Rotator SlopeInputYaw, SlopeRotation;

	Start = Instigator.Location + Instigator.EyePosition();
	End = Start + (Vector(Instigator.GetViewRotation()) * float(512));
	HitActor = Trace(HitLoc, HitNorm, End, Start, true);
	// End:0xA2
	if(HitActor == none)
	{
		HitActor = Trace(HitLoc, HitNorm, End - vect(0.0000000, 0.0000000, 256.0000000), End, true);
	}
	// End:0x107
	if((CoachDeployable(HitActor) != none) && CoachDeployable(HitActor).OwningController == Instigator.Controller)
	{
		CoachDeployable(HitActor).bWarpOut = true;
		CoachDeployable(HitActor).GotoState('Destroying');
		return;
	}
	// End:0x176
	if(CooldownTime > Level.TimeSeconds)
	{
		Instigator.ClientMessage("Barrier is still recharging.");
		PlayerController(Instigator.Controller).ClientPlaySound(ShieldFailSound,, 1.0000000);
		return;
	}
	// End:0x1F4
	if((HitActor == none) || !HitActor.bWorldGeometry)
	{
		Instigator.ClientMessage("Must target an unoccupied surface.");
		PlayerController(Instigator.Controller).ClientPlaySound(ShieldFailSound,, 1.0000000);
		return;
	}
	// End:0x253
	if(HitLoc == vect(0.0000000, 0.0000000, 0.0000000))
	{
		Instigator.ClientMessage("Out of range.");
		PlayerController(Instigator.Controller).ClientPlaySound(ShieldFailSound,, 1.0000000);
		return;
	}
	SlopeInputYaw.Yaw = Instigator.Rotation.Yaw;
	SlopeRotation = GetSlopeRotator(SlopeInputYaw, HitNorm);
	Start = HitLoc + HitNorm;
	// End:0x338
	if(!SpaceToDeploy(HitLoc, HitNorm, SlopeRotation, AltDeployable.dClass.default.CollisionHeight, AltDeployable.dClass.default.CollisionRadius))
	{
		Instigator.ClientMessage("Insufficient space for construction.");
		PlayerController(Instigator.Controller).ClientPlaySound(ShieldFailSound,, 1.0000000);
		return;
	}
	SlopeRotation.Yaw = Instigator.Rotation.Yaw;
	FSP = Spawn(Class'BWBP_SKC_Pro.CoachGunPreconstructor', Instigator,, Start + (HitNorm * AltDeployable.dClass.default.CollisionRadius), SlopeRotation);
	FSP.GroundPoint = Start + (HitNorm * (float(AltDeployable.SpawnOffset) + AltDeployable.dClass.default.CollisionRadius));
	FSP.Instigator = Instigator;
	FSP.Master = self;
	FSP.Initialize(AltDeployable.dClass, AltDeployable.WarpInTime);
	CooldownTime = Level.TimeSeconds + AltDeployable.CoolDownDelay;
	//return;	
}

function bool SpaceToDeploy(Vector hit_location, Vector hit_normal, Rotator slope_rotation, float collision_height, float collision_radius)
{
	local Vector center_point;

	center_point = hit_location + (hit_normal * collision_height);
	return ((FastTrace(center_point, center_point + (collision_radius * (vect(1.0000000, 0.0000000, 0.0000000) >> slope_rotation))) && FastTrace(center_point, center_point + (collision_radius * (vect(-1.0000000, 0.0000000, 0.0000000) >> slope_rotation)))) && FastTrace(center_point, center_point + (collision_radius * (vect(0.0000000, -1.0000000, 0.0000000) >> slope_rotation)))) && FastTrace(center_point, center_point + (collision_radius * (vect(0.0000000, 1.0000000, 0.0000000) >> slope_rotation)));
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
	// End:0x76
	if((Level.TimeSeconds - lastModeChangeTime) < (1.4000000 - (B.Skill * 0.1000000)))
	{
		return 0;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	// End:0xF4
	if(dist > float(1024))
	{
		// End:0xF1
		if(int(CurrentWeaponMode) != 1)
		{
			CurrentWeaponMode = 1;
			CoachGunPrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
		}		
	}
	else
	{
		// End:0x124
		if(int(CurrentWeaponMode) != 0)
		{
			CurrentWeaponMode = 0;
			CoachGunPrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
		}
	}
	lastModeChangeTime = Level.TimeSeconds;
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
	rating = super(BallisticWeapon).GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.9000000, dist, 1024.0000000, 6144.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	// End:0x1F
	if(AIController(Instigator.Controller) == none)
	{
		return 0.5000000;
	}
	return AIController(Instigator.Controller).Skill / float(7);
	//return;	
}

function float SuggestDefenseStyle()
{
	local Bot B;
	local float Result, dist;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return -0.5000000;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Result = -1.0000000 * (B.Skill / float(6));
	Result *= (float(1) - (dist / float(4000)));
	return FClamp(Result, -1.0000000, -0.3000000);
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x43
	if(FireMode[0].bIsFiring)
	{
		return FMin(1.0000000, FireMode[0].HoldTime / CoachGunPrimaryFire(FireMode[0]).ChargeTime);
	}
	return FMin(1.0000000, CoachGunPrimaryFire(FireMode[0]).DecayCharge / CoachGunPrimaryFire(FireMode[0]).ChargeTime);
	//return;	
}

defaultproperties
{
	CoachOpenSound=Sound'BW_Core_WeaponSound.leMat.LM-Open'
	CoachCloseSound=Sound'BW_Core_WeaponSound.leMat.LM-Close'
	ShieldFailSound=Sound'BWBP_OP_Sounds.Wrench.EnergyStationError'
	MatRedShell=Texture'BWBP_SKC_Tex.CoachGun.DBL-MiscRed'
	MatGreenShell=Texture'BWBP_SKC_Tex.CoachGun.DBL-Misc'
	MatBlackShell=Texture'BWBP_SKC_Tex.CoachGun.DBL-MiscBlack'
	ShellTipBone1="ShellLSuper"
	ShellTipBone2="ShellRSuper"
	ShellTipBone3="SpareShellLSuper"
	ShellTipBone4="SpareShellRSuper"
	LastShellBone="ShellR"
	SingleReloadAnimRate=1.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="160.0;10.0;0.3;40.0;0.0;1.0;0.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.CoachWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.CoachWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.CoachWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.CoachWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.CoachGun.BigIcon_Coach'
	BigIconCoords=(X1=0,Y1=35,X2=511,Y2=225)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290Pullout',Volume=0.2180000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290Putaway',Volume=0.2160000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Ammo: Shot",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Ammo: Slug",bUnavailable=false,ModeID="WM_Burst",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Ammo: Electro",bUnavailable=true,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Ammo: Flame",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Ammo: Explosive",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[5]=(ModeName="Ammo: FRAG",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNonCocking=true
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Redwood-ShellOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Redwood-ShellIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.8000000
	FireAnimCutThreshold=1.1000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc1',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=0,A=101),Color2=(R=0,G=0,B=0,A=255),StartSize1=92,StartSize2=82)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.6000000
	LongGunPivot=(Pitch=6000,Yaw=-9000,Roll=2048)
	LongGunOffset=(X=-30.0000000,Y=11.0000000,Z=-20.0000000)
	MeleeFireClass=Class'BWBP_SKC_Pro.CoachGunMeleeFire'
	bWT_Shotgun=true
	ManualLines[0]="Shot mode fires two shots with high power and moderate spread. Enemies hit by the shot bleed, dealing damage over time. Bleed duration is proportional to the number of pellets which struck the target.|Slug mode fires two slugs with long range and penetration. Recoil is moderate with both modes."
	ManualLines[1]="Prepares a bludgeoning attack, which will be executed upon release. The damage of the attack increases the longer altfire is held, up to 1.5 seconds for maximum damage output. As a blunt attack, has lower base damage compared to bayonets but inflicts a short-duration blinding effect when striking. This attack inflicts more damage from behind."
	ManualLines[2]="Effective at close to medium range depending on active mode."
	SightOffset=(X=-4.2500000,Y=0.0000000,Z=1.2000000)
	CockingBringUpTime=0.5000000
	GunLength=60.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.CoachGunPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.CoachGunSecondaryFire'
	SelectAnimRate=2.0000000
	PutDownAnimRate=2.0000000
	AIRating=0.8000000
	CurrentRating=0.8000000
	bShowChargingBar=true
	Description="This primitive artifact has managed to survive the passage of time. Behind it trails a brutal story of bloodshed and sacrifice. For every scar, a life taken; every gouge, a life saved."
	Priority=38
	HudColor=(R=200,G=100,B=35,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	PickupClass=Class'BWBP_SKC_Pro.CoachGunPickup'
	PlayerViewOffset=(X=4.0000000,Y=4.5000000,Z=-7.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.CoachGunAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.CoachGun.SmallIcon_Coach'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=40)
	ItemName="Redwood Coach Gun"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=180.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.Coachgun_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_SKC_Tex.CoachGun.Coach-MainShine'
	Skins[2]=Texture'BWBP_SKC_Tex.CoachGun.DBL-SawnBits'
	Skins[3]=Texture'BWBP_SKC_Tex.CoachGun.Coach-Misc'
}
