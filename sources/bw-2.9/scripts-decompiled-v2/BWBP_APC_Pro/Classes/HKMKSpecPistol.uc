class HKMKSpecPistol extends BallisticHandgun
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var bool bSilenced;
var() name SilencerBone;
var() name SilencerOnAnim;
var() name SilencerOffAnim;
var() Sound SilencerOnSound;
var() Sound SilencerOffSound;
var() Sound SilencerOnTurnSound;
var() Sound SilencerOffTurnSound;
var name ReloadAltAnim;
var int AltAmmo;
var FullSound DrumInSound;
var FullSound DrumOutSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		AltAmmo, ServerSwitchSilencer;
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local int i, Count;
	local float AmmoDimensions, ScaleFactor, XL, YL, YL2, SprintFactor;

	local string Temp;

	DrawCrosshairs(C);
	ScaleFactor = C.ClipX / float(1600);
	AmmoDimensions = C.ClipY * 0.0600000;
	C.Style = 5;
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	Count = Min(6, AltAmmo);
	i = 0;
	J0x87:

	// End:0x132 [Loop If]
	if(i < Count)
	{
		C.SetPos(C.ClipX - (((0.5000000 * float(i)) + float(1)) * AmmoDimensions), C.ClipY * (float(1) - (0.1200000 * Class'Engine.HUD'.default.HudScale)));
		C.DrawTile(Texture'BWBP_SKC_Tex.CYLO.CYLO-SGIcon', AmmoDimensions, AmmoDimensions, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
		i++;
		// [Loop Continue]
		goto J0x87;
	}
	// End:0x13D
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x29F
	if(!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		// End:0x1D3
		if(Temp == "0")
		{
			C.DrawColor = Class'Engine.HUD'.default.RedColor;
		}
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
		C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	}
	// End:0x3C4
	if((Ammo[1] != none) && Ammo[1] != Ammo[0])
	{
		Temp = GetHUDAmmoText(1);
		// End:0x2F8
		if(Temp == "0")
		{
			C.DrawColor = Class'Engine.HUD'.default.RedColor;
		}
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(160) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
		C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	}
	// End:0x512
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
		C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
		C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
	}
	// End:0x6A8
	if((SprintControl != none) && SprintControl.Stamina < SprintControl.MaxStamina)
	{
		SprintFactor = SprintControl.Stamina / SprintControl.MaxStamina;
		C.CurX = C.OrgX + ((float(5) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = C.ClipY - ((float(330) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		// End:0x604
		if(SprintFactor < 0.2000000)
		{
			C.SetDrawColor(byte(255), 0, 0);			
		}
		else
		{
			// End:0x62D
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
	if((AltAmmo < 6) && Ammo[1].AmmoAmount > 0)
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
	switch(i)
	{
		// End:0x35
		case 0:
			ReloadState = 4;
			PlayReload();
			// End:0x4E
			break;
		// End:0x4B
		case 1:
			ReloadState = 1;
			PlayReloadAlt();
			// End:0x4E
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0x76
	if(bScopeView && Instigator.IsLocallyControlled())
	{
		TemporaryScopeDown(default.SightingTime);
	}
	M = 0;
	J0x7D:

	// End:0xBE [Loop If]
	if(M < 2)
	{
		// End:0xB4
		if(bFireMode[M] != none)
		{
			bFireMode[M].ReloadingGun(i);
		}
		M++;
		// [Loop Continue]
		goto J0x7D;
	}
	// End:0xCF
	if(bCockAfterReload)
	{
		bNeedCock = true;
	}
	// End:0xED
	if(bCockOnEmpty && MagAmmo < 1)
	{
		bNeedCock = true;
	}
	bNeedReload = false;
	//return;	
}

simulated function PlayReloadAlt()
{
	SafePlayAnim(ReloadAltAnim, 1.0000000,, 0, "RELOAD");
	//return;	
}

simulated function Notify_ReloadAltOut()
{
	PlayOwnedSound(DrumOutSound.Sound, DrumOutSound.Slot, DrumOutSound.Volume, DrumOutSound.bNoOverride, DrumOutSound.Radius, DrumOutSound.Pitch, DrumOutSound.bAtten);
	ReloadState = 2;
	//return;	
}

simulated function Notify_ReloadAltIn()
{
	local int AmmoNeeded;

	PlayOwnedSound(DrumInSound.Sound, DrumInSound.Slot, DrumInSound.Volume, DrumInSound.bNoOverride, DrumInSound.Radius, DrumInSound.Pitch, DrumInSound.bAtten);
	ReloadState = 3;
	// End:0xD7
	if(int(Level.NetMode) != int(NM_Client))
	{
		AmmoNeeded = default.AltAmmo - AltAmmo;
		// End:0xB5
		if(AmmoNeeded > Ammo[1].AmmoAmount)
		{
			AltAmmo += Ammo[1].AmmoAmount;			
		}
		else
		{
			AltAmmo = default.AltAmmo;
		}
		Ammo[1].UseAmmo(AmmoNeeded, true);
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

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	super(Weapon).PostNetReceive();
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

simulated function OnScopeViewChanged()
{
	super(BallisticWeapon).OnScopeViewChanged();
	// End:0x31
	if(hand < float(0))
	{
		SightOffset.Y = default.SightOffset.Y * float(-1);
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x24
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	// End:0x3C
	if(bIsPendingHandGun || PendingHandgun != none)
	{
		return;
	}
	// End:0x4E
	if(int(ClientState) != int(4))
	{
		return;
	}
	// End:0xA0
	if(OtherGun != none)
	{
		// End:0x74
		if(int(OtherGun.ClientState) != int(4))
		{
			return;
		}
		// End:0x81
		if(IsInState('DualAction'))
		{
			return;
		}
		// End:0xA0
		if(!OtherGun.IsInState('Lowered'))
		{
			GotoState('PendingSwitchSilencer');
			return;
		}
	}
	TemporaryScopeDown(0.5000000);
	bSilenced = !bSilenced;
	ServerSwitchSilencer(bSilenced);
	SwitchSilencer(bSilenced);
	//return;	
}

simulated function SwitchSilencer(bool bNewValue)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = false;
	}
	ReloadState = 9;
	// End:0x34
	if(bNewValue)
	{
		PlayAnim(SilencerOnAnim);		
	}
	else
	{
		PlayAnim(SilencerOffAnim);
	}
	//return;	
}

simulated function Notify_SilencerOn()
{
	PlaySound(SilencerOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOnTurn()
{
	PlaySound(SilencerOnTurnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOff()
{
	PlaySound(SilencerOffSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOffTurn()
{
	PlaySound(SilencerOffTurnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerShow()
{
	SetBoneScale(0, 1.0000000, SilencerBone);
	//return;	
}

simulated function Notify_SilencerHide()
{
	SetBoneScale(0, 0.0000000, SilencerBone);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x62
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'IdleOpen';
		ReloadAnim = 'ReloadOpen';
		SilencerOnAnim = 'SilencerAddOpen';
		SilencerOffAnim = 'SilencerRemoveOpen';
		ReloadAltAnim = 'ReloadAltOpen';		
	}
	else
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';
		SilencerOnAnim = 'SilencerAdd';
		SilencerOffAnim = 'SilencerRemove';
		ReloadAltAnim = 'ReloadAlt';
	}
	// End:0xC2
	if(AIController(Instigator.Controller) != none)
	{
		bSilenced = FRand() > 0.5000000;
	}
	// End:0xDF
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
	}
	//return;	
}

function ServerSwitchSilencer(bool bNewValue)
{
	bSilenced = bNewValue;
	bFireMode[0].bAISilent = bSilenced;
	SwitchSilencer(bSilenced);
	// End:0x70
	if(bSilenced)
	{
		bFireMode[0].FireRecoil *= 0.8500000;
		BallisticInstantFire(bFireMode[0]).Damage *= 0.8500000;		
	}
	else
	{
		bFireMode[0].FireRecoil = bFireMode[0].default.FireRecoil;
		BallisticInstantFire(bFireMode[0]).Damage = BallisticInstantFire(bFireMode[0]).default.Damage;
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x119
	if(((((((Anim == 'OpenFire') || Anim == 'Fire') || Anim == CockAnim) || Anim == ReloadAnim) || Anim == ReloadAltAnim) || Anim == DualReloadAnim) || Anim == DualReloadEmptyAnim)
	{
		// End:0xE2
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'IdleOpen';
			ReloadAnim = 'ReloadOpen';
			SilencerOnAnim = 'SilencerAddOpen';
			SilencerOffAnim = 'SilencerRemoveOpen';
			ReloadAltAnim = 'ReloadAltOpen';			
		}
		else
		{
			IdleAnim = 'Idle';
			ReloadAnim = 'Reload';
			SilencerOnAnim = 'SilencerAdd';
			SilencerOffAnim = 'SilencerRemove';
			ReloadAltAnim = 'ReloadAlt';
		}
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(1, 1.0000000, 'Bullet');
	//return;	
}

simulated function PlayReload()
{
	super.PlayReload();
	// End:0x22
	if(MagAmmo < 1)
	{
		SetBoneScale(1, 0.0000000, 'Bullet');
	}
	// End:0x3F
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
	}
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 768.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.1000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BWBP_APC_Pro.AP_HKMKSpecBullets';
	//return;	
}

simulated state PendingSwitchSilencer extends PendingDualAction
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

defaultproperties
{
	SilencerBone="Silencer"
	SilencerOnAnim="SilencerAdd"
	SilencerOffAnim="SilencerRemove"
	SilencerOnSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOff'
	SilencerOnTurnSound=Sound'BW_Core_WeaponSound.Pistol.RSP-SilencerTurn'
	SilencerOffTurnSound=Sound'BW_Core_WeaponSound.Pistol.RSP-SilencerTurn'
	ReloadAltAnim="ReloadAlt"
	AltAmmo=6
	DrumInSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOn',Volume=0.5000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DrumOutSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOff',Volume=0.5000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;12.0;0.6;50.0;0.0;1.0;0.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_APC_Pro.HKMKSpecWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.HKMKSpecWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_APC_Pro.HKMKSpecWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconCoords=(X1=64,Y1=70,X2=418,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Pullout',Volume=0.1500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.1450000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross4',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=82,G=78,B=79,A=251),Color2=(R=255,G=116,B=0,A=255),StartSize1=79,StartSize2=33)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=6.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	ManualLines[0]="Semi-automatic .45 fire. Moderate damage and fire rate."
	ManualLines[1]="Alt fire is a potent close range shotgun attachment."
	ManualLines[2]="Weapon Function attaches a suppressor, reducing the flash and reducing the noise output."
	SightOffset=(X=0.0000000,Y=-4.3000000,Z=11.6000000)
	CockingBringUpTime=0.6000000
	FireModeClass[0]=Class'BWBP_APC_Pro.HKMKSpecPrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.HKMKSpecSecondaryFire'
	PutDownTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="There's always trouble on the homefront, no matter if it's peaceful or a war is raging on. Criminals are running rampant like the infamous pirate Var Dehidra and other ne'er do-wells, and while there are plenty of personal protection weapons, not a lot can pack a punch.  One such exception is the HKM-26 Assault Pistol, an upgrade kit to the original H&K MK23 which not only allows the use for the .45HVAP rounds, but comes with a miniature shotgun mounted on the underside of the pistol. The idea is to penetrate through whatever armor the bad guys are wearing before putting them down with some double 00 buckshot. It's worked on some of the most dangerous criminals, but as always; Var Dehidra has managed to elude such a fate."
	Priority=17
	HudColor=(R=200,G=200,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=14
	PickupClass=Class'BWBP_APC_Pro.HKMKSpecPickup'
	PlayerViewOffset=(X=-7.0000000,Y=7.0000000,Z=-11.0000000)
	AttachmentClass=Class'BWBP_APC_Pro.HKMKSpecAttachment'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="HKM-26 Assault Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	DrawScale=0.3000000
}
