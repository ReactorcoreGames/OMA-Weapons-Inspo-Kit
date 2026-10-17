class RCS715Shotgun extends BallisticProShotgun
	config(BallisticProV55);

struct RevInfo
{
	var() name GrenName;
};

var name BulletBone;
var() bool bLoaded;
var() FullSound GrenLoadSound;
var() name ShovelAnim;
var() array<name> SGPrepAnim;
var() array<name> ReloadAltAnim;
var() float GrenadeLoadAnimRate;
var() float ShovelReloadAnimRate;
var() float VisGrenades;
var() int Grenades;
var() int StartingGrenades;
var() bool bReady;
var() name SightsBone;
var() name SightsBoneHinge;
var() RevInfo GrenadeBones[3];
var() RevInfo GLLoadGrenadeBones[3];

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Grenades, VisGrenades, 
		bLoaded, bReady;
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	// End:0x193
	if((FireMode[M] != none) && FireMode[M].AmmoClass != none)
	{
		Ammo[M] = Ammunition(Instigator.FindInventoryType(FireMode[M].AmmoClass));
		// End:0xB4
		if(Ammo[M] == none)
		{
			Ammo[M] = Spawn(FireMode[M].AmmoClass, Instigator);
			Instigator.AddInventory(Ammo[M]);
		}
		// End:0x11B
		if((WP != none) && WP.bDropped || WP.AmmoAmount[M] > 0)
		{
			Ammo[M].AddAmmo(WP.AmmoAmount[M]);			
		}
		else
		{
			// End:0x17D
			if((bJustSpawned && (WP == none) || !WP.bDropped) && M == 0)
			{
				Ammo[M].AddAmmo(Ammo[M].InitialAmount);
			}
		}
		Ammo[M].GotoState('None');
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x40 [Loop If]
	if(i <= 1)
	{
		SetBoneScale(i + 3, 1.0000000, GLLoadGrenadeBones[i].GrenName);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	super(BallisticWeapon).PostNetBeginPlay();
	Grenades = StartingGrenades;
	VisGrenades = float(Grenades);
	UpdateBones();
	//return;	
}

simulated function PostNetReceive()
{
	super(Weapon).PostNetReceive();
	UpdateBones();
	//return;	
}

simulated function Special_ShellRemove()
{
	local int i;

	Grenades -= 1;
	VisGrenades = float(Grenades);
	i = 0;
	J0x1C:

	// End:0x55 [Loop If]
	if(i <= 1)
	{
		SetBoneScale(i + 3, 1.0000000, GLLoadGrenadeBones[i].GrenName);
		i++;
		// [Loop Continue]
		goto J0x1C;
	}
	SetBoneScale(5, 0.0000000, GLLoadGrenadeBones[2].GrenName);
	UpdateBones();
	//return;	
}

simulated function Special_ShellsIn()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x40 [Loop If]
	if(i <= 1)
	{
		SetBoneScale(i + 3, 1.0000000, GLLoadGrenadeBones[i].GrenName);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0xB2
	if(int(ReloadState) == int(5))
	{
		ReloadState = 6;
		// End:0x8B
		if(int(Role) == int(ROLE_Authority))
		{
			bLoaded = true;
			Grenades += 1;
			Ammo[1].UseAmmo(1, true);
		}
		PlaySound(GrenLoadSound.Sound, 1, 0.5000000,, 64.0000000);
		VisGrenades = float(Grenades);
	}
	UpdateBones();
	//return;	
}

simulated function Special_GrenadeReady()
{
	local int i;

	ReloadState = 0;
	// End:0x20
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = false;
	}
	bReady = true;
	i = 0;
	J0x2F:

	// End:0x69 [Loop If]
	if(i <= 2)
	{
		SetBoneScale(i + 3, 1.0000000, GLLoadGrenadeBones[i].GrenName);
		i++;
		// [Loop Continue]
		goto J0x2F;
	}
	WeaponModes[0].ModeName = "Grenade Loaded";
	//return;	
}

simulated function PrepPriFire()
{
	WeaponModes[0].ModeName = default.WeaponModes[0].ModeName;
	//return;	
}

simulated function Notify_RemoveGrenadeGLLoad()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x40 [Loop If]
	if(i <= 1)
	{
		SetBoneScale(i + 3, 0.0000000, GLLoadGrenadeBones[i].GrenName);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	SetBoneScale(5, 1.0000000, GLLoadGrenadeBones[2].GrenName);
	//return;	
}

simulated function Notify_ReturnGrenadeToHand()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x40 [Loop If]
	if(i <= 1)
	{
		SetBoneScale(i + 3, 1.0000000, GLLoadGrenadeBones[i].GrenName);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	local int i;

	VisGrenades = float(Grenades);
	i = 0;
	J0x14:

	// End:0x4D [Loop If]
	if(i <= 1)
	{
		SetBoneScale(i + 3, 1.0000000, GLLoadGrenadeBones[i].GrenName);
		i++;
		// [Loop Continue]
		goto J0x14;
	}
	UpdateBones();
	super(BallisticWeapon).BringUp(PrevWeapon);
	GunLength = default.GunLength;
	//return;	
}

simulated event AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x7B
	if((Anim == bFireMode[0].AimedFireAnim) || Anim == bFireMode[1].AimedFireAnim)
	{
		AnimBlendParams(1, 0.0000000);
		// End:0x73
		if((float(SightingState) > FireAnimCutThreshold) && SafePlayAnim(IdleAnim, 1.0000000))
		{
			FreezeAnimAt(0.0000000);
		}
		bPreventReload = false;
	}
	// End:0x228
	if(((int(ClientState) == int(4)) || (int(ClientState) == int(0)) && Instigator.Weapon == self) && int(ReloadState) == int(0))
	{
		// End:0x125
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			SafePlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0x194
			if(((FireMode[1] != none) && Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				SafePlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x1AC
				if(int(MeleeState) < int(2))
				{
					bPreventReload = false;
				}
			}
		}
		// End:0x228
		if(((Channel == 0) && bNeedReload || ((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring) && int(MeleeState) < int(2))
		{
			PlayIdle();
		}
	}
	// End:0x248
	if(int(ReloadState) == int(4))
	{
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x29C
	if(int(ReloadState) == int(6))
	{
		// End:0x28C
		if((Grenades >= 3) || Ammo[1].AmmoAmount < 1)
		{
			PlayShovelEnd();
			ReloadState = 7;
			return;
		}
		ReloadState = 5;
		PlayShovelLoop();
		return;
	}
	// End:0x30F
	if((int(ReloadState) == int(3)) || int(ReloadState) == int(7))
	{
		// End:0x2DD
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
	// End:0x33B
	if(int(ReloadState) == int(8))
	{
		bNeedCock = false;
		ReloadState = 0;
		ReloadFinished();
		PlayIdle();
	}
	//return;	
}

simulated function LoadGrenadeLoop()
{
	// End:0x26
	if((Ammo[1].AmmoAmount < 1) && Grenades > 3)
	{
		return;
	}
	// End:0x77
	if(((int(ReloadState) == int(0)) || int(ReloadState) == int(4)) && Ammo[1].AmmoAmount >= 1)
	{
		PlayAnim(StartShovelAnim, ReloadAnimRate,, 0);
		ReloadState = 4;
	}
	//return;	
}

simulated function EmptyAltFire(byte Mode)
{
	// End:0x49
	if((((Grenades <= 0) && int(ClientState) == int(4)) && FireCount < 1) && Instigator.IsLocallyControlled())
	{
		ServerStartReload(Mode);
	}
	//return;	
}

function ServerStartReload(optional byte i)
{
	local int M;
	local byte Loadings[2];

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
	// End:0x4E
	if((MagAmmo < default.MagAmmo) && Ammo[0].AmmoAmount > 0)
	{
		Loadings[0] = 1;
	}
	// End:0x7C
	if((Grenades < 3) && Ammo[1].AmmoAmount > 0)
	{
		Loadings[1] = 1;
	}
	// End:0x9E
	if((int(Loadings[0]) == 0) && int(Loadings[1]) == 0)
	{
		return;
	}
	M = 0;
	J0xA5:

	// End:0xF1 [Loop If]
	if(M < 2)
	{
		// End:0xE7
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0xA5;
	}
	bServerReloading = true;
	// End:0x110
	if(int(i) == 1)
	{
		M = 0;		
	}
	else
	{
		M = 1;
	}
	// End:0x145
	if(int(Loadings[int(i)]) == 1)
	{
		ClientStartReload(i);
		CommonStartReload(i);		
	}
	else
	{
		// End:0x172
		if(int(Loadings[M]) == 1)
		{
			ClientStartReload(byte(M));
			CommonStartReload(byte(M));
		}
	}
	// End:0x1B5
	if((BallisticAttachment(ThirdPersonActor) != none) && BallisticAttachment(ThirdPersonActor).ReloadAnim != 'None')
	{
		Instigator.SetAnimAction('ReloadGun');
	}
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x39
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x31
		if(int(i) == 1)
		{
			CommonStartReload(1);			
		}
		else
		{
			CommonStartReload(0);
		}
	}
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
	// End:0x36
	if(int(i) == 1)
	{
		ReloadState = 4;
		PlayReloadAlt();		
	}
	else
	{
		ReloadState = 1;
		PlayReload();
	}
	// End:0x6C
	if(bScopeView && Instigator.IsLocallyControlled())
	{
		TemporaryScopeDown(default.SightingTime);
	}
	M = 0;
	J0x73:

	// End:0xB4 [Loop If]
	if(M < 2)
	{
		// End:0xAA
		if(bFireMode[M] != none)
		{
			bFireMode[M].ReloadingGun(i);
		}
		M++;
		// [Loop Continue]
		goto J0x73;
	}
	// End:0xC5
	if(bCockAfterReload)
	{
		bNeedCock = true;
	}
	// End:0xE3
	if(bCockOnEmpty && MagAmmo < 1)
	{
		bNeedCock = true;
	}
	bNeedReload = false;
	//return;	
}

simulated function PlayReloadAlt()
{
	SafePlayAnim(StartShovelAnim, StartShovelAnimRate,, 0, "RELOAD");
	//return;	
}

simulated function PlayShovelLoop()
{
	SafePlayAnim(ReloadAltAnim[int(VisGrenades)], ShovelReloadAnimRate, 0.0000000,, "RELOAD");
	//return;	
}

simulated function PlayShovelEnd()
{
	SafePlayAnim(EndShovelAnim, EndShovelAnimRate, 0.0000000,, "RELOAD");
	//return;	
}

simulated function UpdateBones()
{
	local int i;

	// End:0x18
	if(VisGrenades < float(0))
	{
		VisGrenades = 0.0000000;
	}
	i = 2;
	J0x20:

	// End:0x5B [Loop If]
	if(float(i) >= VisGrenades)
	{
		SetBoneScale(i, 0.0000000, GrenadeBones[i].GrenName);
		i--;
		// [Loop Continue]
		goto J0x20;
	}
	// End:0x74
	if(VisGrenades > float(2))
	{
		VisGrenades = 3.0000000;
	}
	i = 0;
	J0x7B:

	// End:0xB6 [Loop If]
	if(float(i) < VisGrenades)
	{
		SetBoneScale(i, 1.0000000, GrenadeBones[i].GrenName);
		i++;
		// [Loop Continue]
		goto J0x7B;
	}
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local int i, Count;
	local float ScaleFactor2, ScaleFactor, XL, YL, YL2, SprintFactor;

	local string Temp;
	local int TempNum;

	DrawCrosshairs(C);
	ScaleFactor = C.ClipX / float(1600);
	ScaleFactor2 = (99.0000000 * C.ClipX) / float(3200);
	C.Style = 5;
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	Count = Min(8, Grenades);
	i = 0;
	J0x90:

	// End:0x13C [Loop If]
	if(i < Count)
	{
		C.SetPos(C.ClipX - (((0.5000000 * float(i)) + float(1)) * ScaleFactor2), C.ClipY - ((float(100) * ScaleFactor) * Class'Engine.HUD'.default.HudScale));
		C.DrawTile(Texture'BWBP_SKC_Tex.M1014.M1014-SGIcon', ScaleFactor2, ScaleFactor2, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
		i++;
		// [Loop Continue]
		goto J0x90;
	}
	// End:0x147
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x262
	if(!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(140) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
	}
	// End:0x34D
	if((Ammo[1] != none) && Ammo[1] != Ammo[0])
	{
		TempNum = Ammo[1].AmmoAmount;
		C.TextSize(string(TempNum), XL, YL);
		C.CurX = (C.ClipX - ((float(160) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(140) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(string(TempNum), false);
	}
	// End:0x49B
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
		C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = ((C.ClipY - ((float(150) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
		C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
	}
	// End:0x631
	if((SprintControl != none) && SprintControl.Stamina < SprintControl.MaxStamina)
	{
		SprintFactor = SprintControl.Stamina / SprintControl.MaxStamina;
		C.CurX = C.OrgX + ((float(5) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = C.ClipY - ((float(330) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		// End:0x58D
		if(SprintFactor < 0.2000000)
		{
			C.SetDrawColor(byte(255), 0, 0);			
		}
		else
		{
			// End:0x5B6
			if(SprintFactor < 0.5000000)
			{
				C.SetDrawColor(64, 128, byte(255));				
			}
			else
			{
				C.SetDrawColor(0, 0, byte(255));
			}
		}
		C.DrawTile(Texture'Engine.MenuWhite', ((200.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale) * SprintFactor, (30.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale, 0.0000000, 0.0000000, 1.0000000, 1.0000000);
	}
	//return;	
}

simulated function PrepAltFire()
{
	// End:0x4B
	if(int(ReloadState) == int(0))
	{
		ReloadState = 8;
		// End:0x30
		if(int(Role) == int(ROLE_Authority))
		{
			bServerReloading = true;
		}
		PlayAnim(SGPrepAnim[Grenades - 1], GrenadeLoadAnimRate, 0.0000000);
	}
	//return;	
}

simulated function bool IsGrenadeLoaded()
{
	return bLoaded;
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	super(BallisticWeapon).AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated function Notify_ClipUp()
{
	SetBoneScale(10, 1.0000000, 'Shell1');
	SetBoneScale(11, 0.0000000, 'Shell2');
	//return;	
}

simulated function Notify_ClipOut()
{
	super(BallisticWeapon).Notify_ClipOut();
	// End:0x35
	if(MagAmmo < 1)
	{
		SetBoneScale(10, 0.0000000, 'Shell1');
		SetBoneScale(11, 0.0000000, 'Shell2');
	}
	//return;	
}

simulated function float RateSelf()
{
	// End:0x16
	if(!HasAmmo())
	{
		CurrentRating = 0.0000000;
	}
	// End:0x6A
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
	// End:0x8B
	if(dist > float(400))
	{
		return 0;
	}
	// End:0xB7
	if((dist < FireMode[1].MaxRange()) && FRand() > 0.3000000)
	{
		return 1;
	}
	// End:0x141
	if(((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000) && (VSize(B.Enemy.Velocity) < float(100)) || (Normal(B.Enemy.Velocity) Dot Normal(B.Velocity)) < 0.5000000)
	{
		return 1;
	}
	return byte(Rand(2));
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

simulated function Notify_BrassOut()
{
	//return;	
}

defaultproperties
{
	GrenLoadSound=(Sound=Sound'BWBP_OP_Sounds.AssaultShotgun.GLShovel',Volume=1.8000000,Radius=0.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	ShovelAnim="GLReload1"
	SGPrepAnim[0]="GLLoad1"
	SGPrepAnim[1]="GLLoad2"
	SGPrepAnim[2]="GLLoad3"
	ReloadAltAnim[0]="GLReload1"
	ReloadAltAnim[1]="GLReload2"
	ReloadAltAnim[2]="GLReload3"
	GrenadeLoadAnimRate=1.0000000
	ShovelReloadAnimRate=1.0000000
	Grenades=3
	StartingGrenades=3
	SightsBone="LadderSight"
	SightsBoneHinge="LadderSightHinge"
	GrenadeBones[0]=(GrenName="Grenade1")
	GrenadeBones[1]=(GrenName="Grenade2")
	GrenadeBones[2]=(GrenName="Grenade3")
	GLLoadGrenadeBones[0]=(GrenName="GrenadeHandle")
	GLLoadGrenadeBones[1]=(GrenName="HeldGrenade")
	GLLoadGrenadeBones[2]=(GrenName="EmptyGrenade")
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;30.0;0.5;60.0;0.0;1.0;0.0")
	ParamsClasses[0]=Class'BWBP_OP_Pro.RCS715WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.RCS715WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.RCS715WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.RCS715WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.AssaultShotgun.BigIcon_AssaultShotgun'
	BigIconCoords=(X1=0,Y1=40,X2=511,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Putaway',Volume=0.2600000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Semi-Automatic",bUnavailable=true,ModeID="WM_SemiAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	SightBobScale=0.2000000
	CockSound=(Sound=Sound'BWBP_OP_Sounds.AssaultShotgun.Cock',Volume=1.1500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_OP_Sounds.AssaultShotgun.Cock',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_OP_Sounds.AssaultShotgun.MagOut',Volume=1.3000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_OP_Sounds.AssaultShotgun.MagIn',Volume=1.3000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	StartShovelAnim="PrepReload"
	EndShovelAnim="FinishReload"
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Dot1',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.PentagramOutA',USize1=128,VSize1=128,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=61),Color2=(R=255,G=148,B=0,A=158),StartSize1=90,StartSize2=96)
	bWT_Shotgun=true
	bWT_Machinegun=true
	bWT_Projectile=true
	ManualLines[0]="Automatic shotgun blasts with high DPS, good accuracy and controllable recoil."
	ManualLines[1]="Loads an incendiary grenade and fires. Deals good impact damage and minor radius damage, as well as a blast of fire upon impact."
	ManualLines[2]="This weapon is heavy and has poor shoulder fire properties.||Effective at close range."
	SightOffset=(X=0.0000000,Y=0.0000000,Z=1.4000000)
	CockingBringUpTime=1.6000000
	StartShovelAnimRate=1.3000000
	EndShovelAnimRate=1.3000000
	GunLength=48.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.RCS715PrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.RCS715SecondaryFire'
	SelectAnimRate=0.9000000
	PutDownTime=0.5500000
	BringUpTime=0.7000000
	AIRating=0.8500000
	CurrentRating=0.8500000
	Description="RCS-715 Assault Shotgun||Manufacturer: JAX Industrial Firm|Primary: Automatic Shotgun Blast|Secondary: Incendiary Grenade||While not as prevalent as the Skrith menace, Cryon and Krao are just as deadly if not more in some situations.  The skrith may think they're inferior, but the combined menace has wreaked some damage across the universe, such as the tragedy that was the fall of Neo Cairo. Jaeger Firearms and Axo-tek Industries saw the damage to their home, deciding to team up under a new banner. The newly JAX Industrial Firm combined their forces to create not just a potent anti-krao weapon, but an anti-cryon weapon as well. The result is the RCS-715 Tactical Buster shotgun, a low recoil, high damaging shotgun that can destroy not just the Krao or Cryon, but the Skrith as well.  Though chambered in 12 gauge buckshot, it can also fire FRAG-12 or Inciendary shells without damaging the bolt."
	Priority=245
	HudColor=(R=255,G=25,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	GroupOffset=7
	PickupClass=Class'BWBP_OP_Pro.RCS715Pickup'
	PlayerViewOffset=(X=9.0000000,Y=4.5000000,Z=-5.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.RCS715Attachment'
	IconMaterial=Texture'BWBP_OP_Tex.AssaultShotgun.SmallIcon_AssaultShotgun'
	IconCoords=(X1=0,Y1=0,X2=125,Y2=32)
	ItemName="RCS-715 Assault Shotgun"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.RCS715_FPm'
	DrawScale=0.3000000
}
