class MG36Machinegun extends BallisticWeapon
	config(BallisticProV55);

var byte GearStatus;
var() FullSound ThermalOnSound;
var() FullSound ThermalOffSound;
var() FullSound NVOnSound;
var() FullSound NVOffSound;
var array<Pawn> PawnList;
var() Material WallVisionSkin;
var bool bThermal;
var bool bUpdatePawns;
var Pawn UpdatedPawns[128];
var() Material Flaretex;
var() float ThermalRange;
var bool bMeatVision;
var Pawn Target;
var float targettime;
var float LastSendTargetTime;
var Vector TargetLocation;
var Actor NVLight;
var Texture ScopeViewTex1X;
var Texture ScopeViewTex3X;
var Texture ScopeViewTexThermal;
var Texture ScopeViewTexTracker;
var bool bLowZoom;
var bool bHasGauss;
var bool bHasDrum;
var bool bHasScope;
var bool bHasSuppressor;
var bool bSilenced;
var() name SilencerBone;
var() Sound SilencerOnSound;
var() Sound SilencerOffSound;
var() name SilencerOnAnim;
var() name SilencerOffAnim;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Target, bLowZoom, 
		bMeatVision, bThermal;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerAdjustThermal;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasGauss = false;
	bHasScope = true;
	bHasDrum = true;
	bHasSuppressor = false;
	// End:0xC6
	if(InStr(WeaponParams.LayoutTags, "gauss") != -1)
	{
		bHasGauss = true;
		bHasDrum = false;
		AmmoClass[0] = Class'BWBP_SKC_Pro.Ammo_42HVG';
		CoachGunPrimaryFire(FireMode[0]).AmmoClass = Class'BWBP_SKC_Pro.Ammo_42HVG';
		CoachGunSecondaryFire(FireMode[1]).AmmoClass = Class'BWBP_SKC_Pro.Ammo_42HVG';
		// End:0xC6
		if(ThirdPersonActor != none)
		{
			MG36Attachment(ThirdPersonActor).bHasGauss = true;
		}
	}
	// End:0xFC
	if(InStr(WeaponParams.LayoutTags, "ar") != -1)
	{
		bHasSuppressor = true;
		bHasScope = false;
		bHasDrum = false;
	}
	//return;	
}

simulated function StartScopeZoom()
{
	super.StartScopeZoom();
	bLowZoom = true;
	//return;	
}

simulated function ChangeZoom(float Value)
{
	local PlayerController PC;
	local float OldZoomLevel, NewZoomLevel;
	local int SoughtFOV;

	PC = PlayerController(InstigatorController);
	// End:0x1D
	if(PC == none)
	{
		return;
	}
	// End:0x34
	if(bInvertScope)
	{
		Value *= float(-1);
	}
	OldZoomLevel = PC.ZoomLevel;
	switch(ZoomType)
	{
		// End:0x8B
		case 4:
			NewZoomLevel = FClamp(PC.ZoomLevel + Value, 0.0500000, (90.0000000 - FullZoomFOV) / float(88));
			// End:0x19E
			break;
		// End:0xF4
		case 3:
			NewZoomLevel = FClamp(PC.ZoomLevel + (Value * (((float(90) - FullZoomFOV) / float(88)) - (((float(90) - FullZoomFOV) / float(88)) * MinFixedZoomLevel))), MinFixedZoomLevel, (90.0000000 - FullZoomFOV) / float(88));
			// End:0x19E
			break;
		// End:0x19B
		case 2:
			Value *= (float(1) - (Loge(MinZoom) / Loge(MaxZoom)));
			LogZoomLevel = FClamp(LogZoomLevel + Value, Loge(MinZoom) / Loge(MaxZoom), 1.0000000);
			SoughtFOV = int(Class'BCoreProV55.BUtil'.static.CalcZoomFOV(PC.DefaultFOV, 2.0000000 ** ((Loge(MaxZoom) / Loge(2.0000000)) * LogZoomLevel)));
			NewZoomLevel = (90.0000000 - float(SoughtFOV)) / float(88);
		// End:0xFFFF
		default:
			break;
	}
	// End:0x1DD
	if(NewZoomLevel > OldZoomLevel)
	{
		bLowZoom = false;
		// End:0x1DA
		if(ZoomInSound.Sound != none)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ZoomInSound);
		}		
	}
	else
	{
		// End:0x219
		if(NewZoomLevel < OldZoomLevel)
		{
			bLowZoom = true;
			// End:0x219
			if(ZoomOutSound.Sound != none)
			{
				Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ZoomOutSound);
			}
		}
	}
	PC.bZooming = true;
	// End:0x23B
	if(NewZoomLevel == OldZoomLevel)
	{
		return;
	}
	// End:0x275
	if(int(ZoomType) == int(2))
	{
		PC.SetFOV(float(SoughtFOV));
		PC.ZoomLevel = NewZoomLevel;
	}
	PC.DesiredZoomLevel = NewZoomLevel;
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	switch(i)
	{
		// End:0x26
		case 0:
			bThermal = false;
			bMeatVision = false;
			ServerAdjustThermal(false);
			// End:0x67
			break;
		// End:0x45
		case 1:
			bThermal = true;
			bMeatVision = false;
			ServerAdjustThermal(true);
			// End:0x67
			break;
		// End:0x64
		case 2:
			bThermal = false;
			bMeatVision = true;
			ServerAdjustThermal(false);
			// End:0x67
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Actor t;
	local float bestAim, BestDist;
	local Pawn targ;
	local Vector HitLoc, HitNorm, Start, End;

	super.WeaponTick(dt);
	// End:0x124
	if((bThermal && bScopeView) && !bLowZoom)
	{
		SetNVLight(true);
		Start = Instigator.Location + Instigator.EyePosition();
		End = Start + (Vector(Instigator.GetViewRotation()) * float(1500));
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(16.0000000, 16.0000000, 16.0000000));
		// End:0xC0
		if(t == none)
		{
			HitLoc = End;
		}
		// End:0x103
		if(VSize(HitLoc - Start) > float(400))
		{
			NVLight.SetLocation(Start + ((HitLoc - Start) * 0.5000000));			
		}
		else
		{
			NVLight.SetLocation(HitLoc + (HitNorm * float(30)));
		}		
	}
	else
	{
		SetNVLight(false);
	}
	// End:0x14A
	if(!bScopeView || int(Role) < int(ROLE_Authority))
	{
		return;
	}
	Start = Instigator.Location + Instigator.EyePosition();
	bestAim = 0.9950000;
	targ = Instigator.Controller.PickTarget(bestAim, BestDist, Vector(Instigator.GetViewRotation()), Start, 20000.0000000);
	// End:0x24A
	if(targ != none)
	{
		// End:0x1ED
		if(targ != Target)
		{
			Target = targ;
			targettime = 0.0000000;			
		}
		else
		{
			// End:0x227
			if(Vehicle(targ) != none)
			{
				targettime += (((1.2000000 * dt) * (bestAim - 0.9500000)) * float(20));				
			}
			else
			{
				targettime += ((dt * (bestAim - 0.9500000)) * float(20));
			}
		}		
	}
	else
	{
		targettime = FMax(0.0000000, targettime - (dt * 0.5000000));
	}
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	Target = none;
	targettime = 0.0000000;
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated event DrawScopeOverlays(Canvas C)
{
	// End:0x17
	if(bLowZoom)
	{
		ScopeViewTex = ScopeViewTex1X;		
	}
	else
	{
		// End:0x2E
		if(bThermal)
		{
			ScopeViewTex = ScopeViewTexThermal;			
		}
		else
		{
			// End:0x45
			if(bMeatVision)
			{
				ScopeViewTex = ScopeViewTexTracker;				
			}
			else
			{
				ScopeViewTex = ScopeViewTex3X;
			}
		}
	}
	// End:0x71
	if(bThermal && !bLowZoom)
	{
		DrawThermalMode(C);
	}
	// End:0x92
	if(bMeatVision && !bLowZoom)
	{
		DrawMeatVisionMode(C);
	}
	super.DrawScopeOverlays(C);
	//return;	
}

simulated event Timer()
{
	// End:0x12
	if(bUpdatePawns)
	{
		UpdatePawnList();		
	}
	else
	{
		super.Timer();
	}
	//return;	
}

simulated function UpdatePawnList()
{
	local Pawn P;
	local int i;
	local float dist;

	PawnList.Length = 0;
	// End:0x21E
	foreach DynamicActors(Class'Engine.Pawn', P)
	{
		// End:0x96
		if(((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team != none) && P.PlayerReplicationInfo.Team.TeamIndex == Instigator.PlayerReplicationInfo.Team.TeamIndex)
		{
			continue;			
		}
		PawnList[PawnList.Length] = P;
		dist = VSize(P.Location - Instigator.Location);
		// End:0x21D
		if(((dist <= ThermalRange) && (Normal(P.Location - (Instigator.Location + Instigator.EyePosition())) Dot Vector(Instigator.GetViewRotation())) > (float(1) - ((Instigator.Controller.FovAngle * 0.9000000) / float(180)))) && Instigator.LineOfSightTo(P) || (Normal(P.Location - Instigator.Location) Dot Vector(Instigator.GetViewRotation())) > (0.9850000 + (0.0150000 * (dist / ThermalRange))))
		{
			// End:0x205
			if(!Instigator.IsLocallyControlled())
			{
				P.NetUpdateTime = Level.TimeSeconds - float(1);
				P.bAlwaysRelevant = true;
			}
			UpdatedPawns[i] = P;
			i++;
		}		
	}	
	//return;	
}

simulated function SetNVLight(bool bOn)
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x6D
	if(bOn)
	{
		// End:0x59
		if(NVLight == none)
		{
			NVLight = Spawn(Class'BWBP_SKC_Pro.MARSNVLight',,, Instigator.Location);
			NVLight.SetBase(Instigator);
		}
		NVLight.bDynamicLight = true;		
	}
	else
	{
		// End:0x89
		if(NVLight != none)
		{
			NVLight.bDynamicLight = false;
		}
	}
	//return;	
}

simulated event DrawMeatVisionMode(Canvas C)
{
	local Vector V, v2, V3, X, Y, Z;

	local float ScaleFactor;

	C.Style = 4;
	C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.DrawTile(FinalBlend'BWBP_SKC_Tex.MARS.F2000TargetFinal', float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	C.SetPos(C.OrgX, C.OrgY);
	C.Style = 5;
	// End:0x101
	if(Target == none)
	{
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
	GetViewAxes(X, Y, Z);
	V = C.WorldToScreen((Target.Location - (Y * Target.CollisionRadius)) + (Z * Target.CollisionHeight));
	V.X -= (float(32) * ScaleFactor);
	V.Y -= (float(32) * ScaleFactor);
	C.SetPos(V.X, V.Y);
	v2 = C.WorldToScreen((Target.Location + (Y * Target.CollisionRadius)) - (Z * Target.CollisionHeight));
	C.SetDrawColor(160, 185, 200, byte(255));
	C.DrawTileStretched(Texture'BWBP_SKC_Tex.X82.X82TargetBox', (v2.X - V.X) + (float(32) * ScaleFactor), (v2.Y - V.Y) + (float(32) * ScaleFactor));
	V3 = C.WorldToScreen(Target.Location - (Z * Target.CollisionHeight));
	//return;	
}

simulated event DrawThermalMode(Canvas C)
{
	C.Style = 4;
	C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.DrawTile(FinalBlend'BWBP_SKC_Tex.MARS.F2000IRNVFinal', float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	//return;	
}

simulated function AdjustThermalView(bool bNewValue)
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x31
	if(!bNewValue)
	{
		bUpdatePawns = false;		
	}
	else
	{
		bUpdatePawns = true;
		UpdatePawnList();
		SetTimer(1.0000000, true);
	}
	ServerAdjustThermal(bNewValue);
	//return;	
}

function ServerAdjustThermal(bool bNewValue)
{
	local int i;

	// End:0x23
	if(bNewValue)
	{
		bUpdatePawns = true;
		UpdatePawnList();
		SetTimer(1.0000000, true);		
	}
	else
	{
		bUpdatePawns = false;
		i = 0;
		J0x32:

		// End:0x84 [Loop If]
		if(i < 128)
		{
			// End:0x7A
			if(UpdatedPawns[i] != none)
			{
				UpdatedPawns[i].bAlwaysRelevant = UpdatedPawns[i].default.bAlwaysRelevant;
			}
			i++;
			// [Loop Continue]
			goto J0x32;
		}
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x1E
	if(!bScopeView && bHasSuppressor)
	{
		SwitchSilencer();
		return;
	}
	// End:0x1CF
	if(bHasScope)
	{
		// End:0xAD
		if(!bThermal && !bMeatVision)
		{
			bThermal = true;
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOnSound);
			AdjustThermalView(true);
			// End:0xA3
			if(!bScopeView)
			{
				PlayerController(InstigatorController).ClientMessage("Activated 4X nightvision scope.");
			}
			ServerWeaponSpecial(1);
			return;
		}
		// End:0x155
		if(bThermal && !bMeatVision)
		{
			bThermal = false;
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOffSound);
			AdjustThermalView(false);
			// End:0x12E
			if(!bScopeView)
			{
				PlayerController(InstigatorController).ClientMessage("Activated 4X infrared targeting scope.");
			}
			bMeatVision = true;
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOnSound);
			ServerWeaponSpecial(2);
			return;
		}
		// End:0x1CF
		if(!bThermal && bMeatVision)
		{
			bMeatVision = false;
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOffSound);
			// End:0x1C5
			if(!bScopeView)
			{
				PlayerController(InstigatorController).ClientMessage("Activated 4X standard scope.");
			}
			ServerWeaponSpecial(0);
			return;
		}
	}
	//return;	
}

simulated event Destroyed()
{
	AdjustThermalView(false);
	super.Destroyed();
	//return;	
}

simulated function bool PutDown()
{
	// End:0x12
	if(super.PutDown())
	{
		AdjustThermalView(false);
		return true;
	}
	return false;
	//return;	
}

function ServerSwitchSilencer(bool bNewValue)
{
	// End:0x30
	if(!Instigator.IsLocallyControlled())
	{
		MG36PrimaryFire(FireMode[0]).SwitchSilencerMode(bNewValue);
	}
	MG36Attachment(ThirdPersonActor).bSilenced = bNewValue;
	PlaySuppressorAttachment(bNewValue);
	bSilenced = bNewValue;
	bFireMode[0].bAISilent = bSilenced;
	//return;	
}

simulated exec function SwitchSilencer()
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
	bSilenced = !bSilenced;
	ServerSwitchSilencer(bSilenced);
	PlaySuppressorAttachment(bSilenced);
	MG36PrimaryFire(FireMode[0]).SwitchSilencerMode(bSilenced);
	MG36Attachment(ThirdPersonActor).IAOverride(bSilenced);
	//return;	
}

simulated function PlaySuppressorAttachment(bool bSuppressed)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 9;
	// End:0x34
	if(bSuppressed)
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

simulated function Notify_SilencerOff()
{
	PlaySound(SilencerOffSound,, 0.5000000);
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

simulated function PlayReload()
{
	super.PlayReload();
	// End:0x23
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

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x28
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

function Notify_Deploy()
{
	local Vector HitLoc, HitNorm, Start, End;
	local Actor t;
	local Rotator CompressedEq;
	local BallisticTurret Turret;
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
	// End:0x268
	if(Sandbag(t) != none)
	{
		HitLoc = t.Location;
		HitLoc.Z += (Class'BWBP_SKC_Pro.MG36Turret'.default.CollisionHeight + (t.CollisionHeight * 0.7500000));		
	}
	else
	{
		HitLoc.Z += (Class'BWBP_SKC_Pro.MG36Turret'.default.CollisionHeight - float(9));
	}
	CompressedEq = Instigator.Rotation;
	CompressedEq.Pitch = (CompressedEq.Pitch >> 8) & 255;
	CompressedEq.Yaw = (CompressedEq.Yaw >> 8) & 255;
	CompressedEq.Pitch = CompressedEq.Pitch << 8;
	CompressedEq.Yaw = CompressedEq.Yaw << 8;
	Turret = Spawn(Class'BWBP_SKC_Pro.MG36Turret', none,, HitLoc, CompressedEq);
	// End:0x380
	if(Turret != none)
	{
		// End:0x356
		if(Sandbag(t) != none)
		{
			Sandbag(t).AttachedWeapon = Turret;
		}
		Turret.InitDeployedTurretFor(self);
		Turret.TryToDrive(Instigator);
		Destroy();		
	}
	else
	{
		Log("Notify_Deploy: Could not spawn turret for MG36");
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

simulated function float RateSelf()
{
	// End:0x19
	if(!HasAmmo())
	{
		CurrentRating = 0.0000000;		
	}
	else
	{
		// End:0x65
		if((Ammo[0].AmmoAmount < 1) && MagAmmo < 1)
		{
			CurrentRating = Instigator.Controller.RateWeapon(self) * 0.3000000;			
		}
		else
		{
			return super.RateSelf();
		}
	}
	return CurrentRating;
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, BallisticProInstantFire(bFireMode[0]).DecayRange.Min, BallisticProInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

defaultproperties
{
	ThermalOnSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ThermalOffSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOff',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	NVOnSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOn',Volume=1.6000000,Radius=0.0000000,Slot=0,Pitch=0.9000000,bAtten=false,bNoOverride=false)
	NVOffSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOff',Volume=1.6000000,Radius=0.0000000,Slot=0,Pitch=0.9000000,bAtten=false,bNoOverride=false)
	WallVisionSkin=FinalBlend'BW_Core_WeaponTex.M75.OrangeFinal'
	Flaretex=FinalBlend'BW_Core_WeaponTex.M75.OrangeFlareFinal'
	ThermalRange=2500.0000000
	ScopeViewTex1X=Texture'BWBP_SKC_Tex.MG36.G36ScopeViewDot'
	ScopeViewTex3X=Texture'BWBP_SKC_Tex.MG36.G36ScopeView'
	ScopeViewTexThermal=Texture'BWBP_SKC_Tex.MARS.MARS-ScopeRed'
	ScopeViewTexTracker=Texture'BWBP_SKC_Tex.MARS.MARS-ScopeTarget'
	bLowZoom=true
	SilencerBone="Silencer"
	SilencerOnSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOff'
	SilencerOnAnim="SilencerOn"
	SilencerOffAnim="SilencerOff"
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.9;80.0;0.7;0.7;0.4")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.MG36WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.MG36WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.MG36WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.MG36WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.MG36.MG36_LargeIcon'
	BigIconCoords=(X1=0,Y1=36,X2=511,Y2=225)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M925.M925-Pullout',Volume=0.2150000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M925.M925-Putaway',Volume=0.2070000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	MaxZoom=3.0000000
	ZoomStages=1
	FullZoomFOV=45.0000000
	ScopeViewTex=Texture'BWBP_SKC_Tex.MG36.G36ScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.JSOC.JSOC-Cock',Volume=2.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.JSOC.JSOC-Cock',Volume=2.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.JSOC.JSOC-MagOut',Volume=2.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.JSOC.JSOC-MagIn',Volume=2.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M353OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=197),Color2=(R=255,G=255,B=0,A=255),StartSize1=79,StartSize2=55)
	bWT_Bullet=true
	ManualLines[0]="Higher DPS than comparable weapons, but awkward recoil and highly visible tracers."
	ManualLines[1]="Attaches or remvoes the suppressor. When active, the suppressor reduces recoil and noise output and hides the muzzle flash, but reduces range."
	ManualLines[2]="The Weapon Function key switches between various integrated scopes.|The Normal scope offers clear vision.|The Night Vision scope (green) illuminates the environment and shows enemies in orange.|The Infrared scope (red) highlights enemies with a box, even underwater or through smoke or trees.||Effective at medium range."
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	ZoomType=2
	SightingTime=0.8500000
	SightOffset=(X=-5.0000000,Y=0.3500000,Z=2.0000000)
	CockingBringUpTime=1.4000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.MG36PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.MG36SecondaryFire'
	IdleAnimRate=0.5000000
	PutDownTime=0.6000000
	BringUpTime=0.6500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	Description="Mk.88 Light Support Weapon||Manufacturer: Majestic Firearms 12|Primary: 5.56mm Rifle Rounds|Secondary: Attach Suppressor|Special: Mount Bipod (Unscoped)/ Activate NV (Scoped)||A limited production weapon, the Mk.88 was Majestic's first foray into infantry support weaponry. After the first Skrith war jump-started the ballistic weapons business, Majestic Firearms 12 designed the Mk.88 to replace the aging M353's still in use by the UTC. The fast-firing and powerful Mk.88 was well received by troops, however its high recoil and prohibitive cost prevented it from seeing mainstream adoption. The Mk.88 currently sees limited service in special operations units and private military groups."
	Priority=41
	HudColor=(R=255,G=48,B=24,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	PickupClass=Class'BWBP_SKC_Pro.MG36Pickup'
	PlayerViewOffset=(X=6.0000000,Y=4.5000000,Z=-4.5000000)
	BobDamping=2.0000000
	AttachmentClass=Class'BWBP_SKC_Pro.MG36Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.MG36.MG36_SmallIcon'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="Mk.88 Light Support Weapon"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.MG36_FPm'
	DrawScale=0.3000000
}
