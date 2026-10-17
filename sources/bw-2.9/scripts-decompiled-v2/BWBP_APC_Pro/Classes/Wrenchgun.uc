class Wrenchgun extends BallisticProShotgun
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

const DeployRange = 512;

struct DeployableInfo
{
	var Class<Actor> dClass;
	var float WarpInTime;
	var Vector SpawnOffset;
	var float CoolDownDelay;
	var bool CheckSlope;
	var string dDescription;
};

var Actor ReloadSteam;
var Actor ReloadSteam2;
var() name LastShellBone;
var bool bLastShell;
var bool bNowEmpty;
var DeployableInfo Deployables;
var float CooldownTime;

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x16
	if(bPreventReload || bServerReloading)
	{
		return;
	}
	ServerWeaponSpecial(i);
	ReloadState = 9;
	PlayAnim('WrenchPoint');
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x16
	if(bPreventReload || bServerReloading)
	{
		return;
	}
	bServerReloading = true;
	ReloadState = 9;
	PlayAnim('WrenchPoint');
	//return;	
}

function Notify_BarrierDeploy()
{
	local Actor HitActor;
	local Vector Start, End, HitNorm, HitLoc, DeployableZOffset;

	local WrenchgunPreconstructor WP;

	Start = Instigator.Location + Instigator.EyePosition();
	End = Start + (Vector(Instigator.GetViewRotation()) * float(512));
	HitActor = Trace(HitLoc, HitNorm, End, Start, true);
	// End:0xA2
	if(HitActor == none)
	{
		HitActor = Trace(HitLoc, HitNorm, End - vect(0.0000000, 0.0000000, 256.0000000), End, true);
	}
	// End:0x107
	if((WrenchDeployable(HitActor) != none) && WrenchDeployable(HitActor).OwningController == Instigator.Controller)
	{
		WrenchDeployable(HitActor).bWarpOut = true;
		WrenchDeployable(HitActor).GotoState('Destroying');
		return;
	}
	// End:0x176
	if(CooldownTime > Level.TimeSeconds)
	{
		Instigator.ClientMessage("Barrier is still recharging.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	// End:0x1F4
	if((HitActor == none) || !HitActor.bWorldGeometry)
	{
		Instigator.ClientMessage("Must target an unoccupied surface.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	// End:0x253
	if(HitLoc == vect(0.0000000, 0.0000000, 0.0000000))
	{
		Instigator.ClientMessage("Out of range.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	// End:0x2E2
	if(Deployables.CheckSlope && (HitNorm Dot vect(0.0000000, 0.0000000, 1.0000000)) < 0.1000000)
	{
		Instigator.ClientMessage("Surface is too steep for construction.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	Start = HitLoc + vect(0.0000000, 0.0000000, 1.0000000);
	DeployableZOffset.Z = Deployables.dClass.default.CollisionHeight * 0.5000000;
	// End:0x496
	if(((!FastTrace(Start + DeployableZOffset, (Start + DeployableZOffset) + (Deployables.dClass.default.CollisionRadius * vect(1.0000000, 0.0000000, 0.0000000))) || !FastTrace(Start + DeployableZOffset, (Start + DeployableZOffset) + (Deployables.dClass.default.CollisionRadius * vect(-1.0000000, 0.0000000, 0.0000000)))) || !FastTrace(Start + DeployableZOffset, (Start + DeployableZOffset) + (Deployables.dClass.default.CollisionRadius * vect(0.0000000, -1.0000000, 0.0000000)))) || !FastTrace(Start + DeployableZOffset, (Start + DeployableZOffset) + (Deployables.dClass.default.CollisionRadius * vect(0.0000000, 1.0000000, 0.0000000))))
	{
		Instigator.ClientMessage("Insufficient space for construction.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	WP = Spawn(Class'BWBP_APC_Pro.WrenchgunPreconstructor', Instigator,, Start + (vect(0.0000000, 0.0000000, 1.0000000) * Deployables.dClass.default.CollisionRadius), Instigator.Rotation);
	// End:0x523
	if(Deployables.SpawnOffset == vect(0.0000000, 0.0000000, 0.0000000))
	{
		WP.GroundPoint = Start - vect(0.0000000, 0.0000000, 1.0000000);		
	}
	else
	{
		WP.GroundPoint = Start + Deployables.SpawnOffset;
	}
	WP.Instigator = Instigator;
	WP.Master = self;
	WP.Initialize(Deployables.dClass, Deployables.WarpInTime);
	CooldownTime = Level.TimeSeconds + Deployables.CoolDownDelay;
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
	// End:0x30
	if((MagAmmo == 1) && !bNowEmpty)
	{
		PlayAnim('ReloadSingle', CockAnimRate,, int(0.2500000));		
	}
	else
	{
		PlayAnim('Reload', ReloadAnimRate,, int(0.2500000));
	}
	//return;	
}

simulated function bool MayNeedReload(byte Mode, float load)
{
	// End:0x0F
	if(!HasNonMagAmmo(0))
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
	// End:0x13D
	if((Anim == bFireMode[0].AimedFireAnim) || Anim == WrenchgunPrimaryFire(FireMode[0]).AimedFireEmptyAnim)
	{
		AnimBlendParams(1, 0.0000000);
		// End:0x135
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		bPreventReload = false;
	}
	// End:0x2EA
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0x1E7
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x256
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x26E
				if(int(MeleeState) < int(2))
				{
					bPreventReload = false;
				}
			}
		}
		// End:0x2EA
		if(((Channel == 0) && bNeedReload || ((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring) && int(MeleeState) < int(2))
		{
			PlayIdle();
		}
	}
	// End:0x30A
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x361
	if(int(ReloadState) == int(6))
	{
		// End:0x351
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
	// End:0x3D4
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x3A2
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
	// End:0x414
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
		AimComponent.Reaim(0.0500000);
	}
	// End:0x44A
	if(int(ReloadState) == int(9))
	{
		// End:0x43C
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = false;
		}
		ReloadState = 0;
		PlayIdle();
	}
	//return;	
}

simulated function Notify_CoachShellDown()
{
	local Vector Start;

	// End:0x103
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Start = (Instigator.Location + Instigator.EyePosition()) + Class'BCoreProV55.BUtil'.static.AlignedOffset(Instigator.GetViewRotation(), vect(5.0000000, 10.0000000, -5.0000000));
		// End:0xA7
		if(MagAmmo == 1)
		{
			Spawn(Class'BallisticProV55.Brass_MRS138Shotgun', self,, Start, Instigator.GetViewRotation() + rot(8192, 0, 0));			
		}
		else
		{
			Spawn(Class'BallisticProV55.Brass_MRS138Shotgun', self,, Start, Instigator.GetViewRotation() + rot(8192, 0, 0));
			Spawn(Class'BallisticProV55.Brass_MRS138Shotgun', self,, Start, Instigator.GetViewRotation() + rot(8192, 0, 0));
		}
	}
	bLastShell = Ammo[0].AmmoAmount == 1;
	// End:0x14F
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
	// End:0x8E
	if(dist > float(700))
	{
		return 1;		
	}
	else
	{
		// End:0xA2
		if(dist < float(300))
		{
			return 0;
		}
	}
	return byte(Rand(2));
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
		return super(BallisticWeapon).GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super(BallisticWeapon).GetAIRating();
	// End:0xA6
	if(dist > float(750))
	{
		Result = 0.1000000;		
	}
	else
	{
		// End:0xD6
		if(dist < float(300))
		{
			Result += (0.0600000 * B.Skill);			
		}
		else
		{
			// End:0x105
			if(dist > float(500))
			{
				Result -= ((dist - float(700)) / float(1400));
			}
		}
	}
	// End:0x167
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		Result += (0.1000000 * B.Skill);		
	}
	else
	{
		// End:0x1C9
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

defaultproperties
{
	LastShellBone="ShellR"
	Deployables=(dClass=Class'BWBP_APC_Pro.WrenchgunEnergyBarrier',WarpInTime=0.5000000,SpawnOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),CoolDownDelay=2.0000000,CheckSlope=false,dDescription="A five-second barrier of infinite durability.")
	SpecialInfo[0]=(Id="EvoDefs",Info="160.0;10.0;0.3;40.0;0.0;1.0;0.0")
	ParamsClasses[0]=Class'BWBP_APC_Pro.WrenchgunWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_APC_Pro.WrenchgunWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconCoords=(X1=0,Y1=35,X2=511,Y2=225)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Wrench. There is only Wrench.",bUnavailable=false,ModeID="WM_SemiAuto",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNonCocking=true
	ClipInFrame=0.8000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc1',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=0,A=101),Color2=(R=0,G=0,B=0,A=255),StartSize1=92,StartSize2=82)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.6000000
	LongGunPivot=(Pitch=6000,Yaw=-9000,Roll=2048)
	LongGunOffset=(X=-30.0000000,Y=11.0000000,Z=-20.0000000)
	MeleeFireClass=Class'BWBP_APC_Pro.WrenchgunMeleeFire'
	bWT_Shotgun=true
	ManualLines[0]="Primary fires two shots with high power and moderate spread. Enemies hit by the shot bleed, dealing damage over time. Bleed duration is proportional to the number of pellets which struck the target.|Alternate fires two wrenches at the enemy. Don't plan on it really being useful but imagine if you do get the kill! Recoil is moderate with both modes."
	ManualLines[1]="Prepares a bludgeoning attack, which will be executed upon release. The damage of the attack increases the longer altfire is held, up to 1.5 seconds for maximum damage output. As a blunt attack, has lower base damage compared to bayonets but inflicts a short-duration blinding effect when striking. This attack inflicts more damage from behind."
	ManualLines[2]="Special deploys a five-second barrier of infinite durability."
	SightingTime=0.2500000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	SightOffset=(X=100.0000000,Y=12.0000000,Z=43.0000000)
	CockAnimRate=0.7000000
	ReloadAnimRate=1.1000000
	GunLength=60.0000000
	FireModeClass[0]=Class'BWBP_APC_Pro.WrenchgunPrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.WrenchgunSecondaryFire'
	SelectAnimRate=2.0000000
	PutDownAnimRate=2.0000000
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="Deep in the mud filled trenches of Indorix Paraxii, the Carcosan Greasers, short on weapons and only days away from a full force Cryon advance, were desperate for a way to weather the impending invasion. A number of the soldiers were able to improvise a rather novel ammo, utilizing their surplus of pocket sized NFUD wrenches as a rather unconventional ammo type that proved to wreak absolute havoc on the mechanical elements of the Cryon soldiers, throwing a literal monkey wrench into their plan and rendering scores of them into immobile obstacles, effectively funneling the remaining grunts into narrow columns easily dispatched with some old fashioned trench guns. Furthermore, they further adapted their signature wrenches into makeshift bayonets, giving them easy access to their energy barriers without having to put down their main combat weapons."
	Priority=38
	HudColor=(R=200,G=100,B=35,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	PickupClass=Class'BWBP_APC_Pro.WrenchgunPickup'
	PlayerViewOffset=(X=-80.0000000,Y=10.0000000,Z=-45.0000000)
	AttachmentClass=Class'BWBP_APC_Pro.WrenchgunAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.CoachGun.SmallIcon_Coach'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=40)
	ItemName="Redwood Wrenchgun"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=180.0000000
	LightRadius=5.0000000
	DrawScale=1.2500000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BWBP_SKC_Tex.CoachGun.Coach-Main'
	Skins[2]=none
	Skins[3]=none
	Skins[4]=Shader'BWBP_OP_Tex.Wrench.WrenchShader'
}
