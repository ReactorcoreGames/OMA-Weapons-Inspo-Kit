class MARSAssaultRifle extends BallisticWeapon
	config(BallisticProV55);

var() bool bHasSuppressor;
var() bool bHasNightvisionSight;
var() bool bHasThermalSight;
var() bool bHasTrackingSight;
var() bool bAlwaysTrackSensor;
var() Sound GrenOpenSound;
var() Sound GrenLoadSound;
var() Sound GrenCloseSound;
var() name GrenadeLoadAnim;
var bool bSilenced;
var() name SilencerBone;
var() name SilencerOnAnim;
var() name SilencerOffAnim;
var() Sound SilencerOnSound;
var() Sound SilencerOffSound;
var() Sound SilencerOnTurnSound;
var() Sound SilencerOffTurnSound;
var() FullSound ThermalOnSound;
var() FullSound ThermalOffSound;
var() FullSound NVOnSound;
var() FullSound NVOffSound;
var() array<Pawn> PawnList;
var() Material WallVisionSkin;
var() bool bThermal;
var() bool bUpdatePawns;
var() Pawn UpdatedPawns[128];
var() Material Flaretex;
var() float ThermalRange;
var() ColorModifier ColorMod;
var() bool bMeatVision;
var() float LastPingTime;
var() float MaxTrackTime;
var() Pawn Target;
var() array<Pawn> TrackedTargets;
var() float targettime;
var() float LastSendTargetTime;
var() float NextTargetFindTime;
var() float TargetFindInterval;
var() Vector TargetLocation;
var() Actor NVLight;
var() float NextPawnListUpdateTime;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientAddTarget, ClientClearTargets, 
		ClientGrenadePickedUp, Target, 
		bMeatVision;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerAdjustThermal, ServerSwitchSilencer;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasSuppressor = false;
	bHasThermalSight = false;
	bHasTrackingSight = false;
	// End:0x57
	if(InStr(WeaponParams.LayoutTags, "suppressor") != -1)
	{
		bHasSuppressor = true;
	}
	// End:0x85
	if(InStr(WeaponParams.LayoutTags, "IR") != -1)
	{
		bThermal = true;
		bHasThermalSight = true;
	}
	// End:0xAB
	if(InStr(WeaponParams.LayoutTags, "NV") != -1)
	{
		bHasNightvisionSight = true;
	}
	// End:0xE9
	if(InStr(WeaponParams.LayoutTags, "tracker") != -1)
	{
		// End:0xE1
		if(!bThermal)
		{
			bMeatVision = true;
		}
		bHasTrackingSight = true;
	}
	// End:0x120
	if(InStr(WeaponParams.LayoutTags, "always_track_sensor") != -1)
	{
		bAlwaysTrackSensor = true;
	}
	//return;	
}

simulated function Notify_F2000GrenOpen()
{
	PlaySound(GrenOpenSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_F2000GrenLoad()
{
	PlaySound(GrenLoadSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_F2000GrenClose()
{
	PlaySound(GrenCloseSound, 1, 0.5000000,, 64.0000000);
	MARSSecondaryFire(FireMode[1]).bLoaded = true;
	//return;	
}

function GrenadePickedUp()
{
	// End:0x5A
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x42
		if(Instigator.Weapon == self)
		{
			LoadGrenade();			
		}
		else
		{
			MARSSecondaryFire(FireMode[1]).bLoaded = true;
		}
	}
	// End:0x74
	if(!Instigator.IsLocallyControlled())
	{
		ClientGrenadePickedUp();
	}
	//return;	
}

simulated function ClientGrenadePickedUp()
{
	// End:0x56
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x3E
		if(int(ClientState) == int(4))
		{
			LoadGrenade();			
		}
		else
		{
			MARSSecondaryFire(FireMode[1]).bLoaded = true;
		}
	}
	//return;	
}

simulated function bool IsGrenadeLoaded()
{
	return MARSSecondaryFire(FireMode[1]).bLoaded;
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	super.GiveAmmo(M, WP, bJustSpawned);
	// End:0x4E
	if((Ammo[1] != none) && Ammo_MARSGrenades(Ammo[1]) != none)
	{
		Ammo_MARSGrenades(Ammo[1]).DaF2K = self;
	}
	//return;	
}

simulated function LoadGrenade()
{
	// End:0x54
	if((Ammo[1].AmmoAmount < 1) || MARSSecondaryFire(FireMode[1]).bLoaded)
	{
		// End:0x52
		if(!MARSSecondaryFire(FireMode[1]).bLoaded)
		{
			PlayIdle();
		}
		return;
	}
	// End:0x82
	if(int(ReloadState) == int(0))
	{
		ReloadState = 9;
		PlayAnim(GrenadeLoadAnim, ReloadAnimRate + 0.1000000,, 0);
	}
	//return;	
}

function ServerStartReload(optional byte i)
{
	local int Channel;
	local name seq;
	local float frame, Rate;

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
	GetAnimParams(Channel, seq, frame, Rate);
	// End:0x48
	if(seq == GrenadeLoadAnim)
	{
		return;
	}
	// End:0xA8
	if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		// End:0xA6
		if(((AmmoAmount(1)) > 0) && !IsReloadingGrenade())
		{
			LoadGrenade();
			ClientStartReload(1);
		}
		return;
	}
	super.ServerStartReload();
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x7D
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x72
		if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			// End:0x6F
			if(((AmmoAmount(1)) > 0) && !IsReloadingGrenade())
			{
				LoadGrenade();
			}			
		}
		else
		{
			CommonStartReload(i);
		}
	}
	//return;	
}

simulated function bool CheckWeaponMode(int Mode)
{
	// End:0x14
	if(Mode == 1)
	{
		return FireCount < 1;
	}
	return super.CheckWeaponMode(Mode);
	//return;	
}

function bool BotShouldReloadGrenade()
{
	// End:0x2A
	if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
	{
		return true;
	}
	return false;
	//return;	
}

function ServerSwitchSilencer(bool bNewValue)
{
	// End:0x13
	if(bSilenced == bNewValue)
	{
		return;
	}
	bSilenced = bNewValue;
	SwitchSilencer(bSilenced);
	//return;	
}

simulated function OnSuppressorSwitched()
{
	// End:0x24
	if(bSilenced)
	{
		ApplySuppressorAim();
		ApplySuppressorRecoil();
		SightingTime *= 1.2500000;		
	}
	else
	{
		AimComponent.Recalculate();
		RcComponent.Recalculate();
		SightingTime = default.SightingTime;
	}
	MARSPrimaryFire(bFireMode[0]).SetSuppressed(bSilenced);
	//return;	
}

simulated function OnAimParamsChanged()
{
	super.OnAimParamsChanged();
	// End:0x15
	if(bSilenced)
	{
		ApplySuppressorAim();
	}
	//return;	
}

simulated function OnRecoilParamsChanged()
{
	super.OnRecoilParamsChanged();
	// End:0x15
	if(bSilenced)
	{
		ApplySuppressorRecoil();
	}
	//return;	
}

simulated function ApplySuppressorAim()
{
	AimComponent.AimSpread.Min *= 1.2500000;
	AimComponent.AimSpread.Max *= 1.2500000;
	//return;	
}

function ApplySuppressorRecoil()
{
	RcComponent.XRandFactor *= 0.7000000;
	RcComponent.YRandFactor *= 0.7000000;
	//return;	
}

simulated function SwitchSilencer(bool bNewValue)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
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
	OnSuppressorSwitched();
	//return;	
}

simulated function Notify_MARSSilencerOn()
{
	PlaySound(SilencerOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_MARSSilencerOnTurn()
{
	PlaySound(SilencerOnTurnSound,, 0.5000000);
	//return;	
}

simulated function Notify_MARSSilencerOff()
{
	PlaySound(SilencerOffSound,, 0.5000000);
	//return;	
}

simulated function Notify_MARSSilencerOffTurn()
{
	PlaySound(SilencerOffTurnSound,, 0.5000000);
	//return;	
}

simulated function Notify_MARSSilencerShow()
{
	SetBoneScale(0, 1.0000000, SilencerBone);
	//return;	
}

simulated function Notify_MARSSilencerHide()
{
	SetBoneScale(0, 0.0000000, SilencerBone);
	//return;	
}

simulated function PlayReload()
{
	// End:0x1C
	if(MagAmmo < 1)
	{
		SetBoneScale(1, 0.0000000, 'Bullet');
	}
	super.PlayReload();
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

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x34
	if(AIController(Instigator.Controller) != none)
	{
		bSilenced = FRand() > 0.5000000;
	}
	// End:0x51
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
	}
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = true;
	// End:0xD0
	if(ColorMod != none)
	{
		return;
	}
	ColorMod = ColorModifier(Level.ObjectPool.AllocateObject(Class'Engine.ColorModifier'));
	// End:0x195
	if(ColorMod != none)
	{
		ColorMod.Material = FinalBlend'BW_Core_WeaponTex.M75.OrangeFinal';
		ColorMod.Color.R = byte(255);
		ColorMod.Color.G = 96;
		ColorMod.Color.B = 0;
		ColorMod.Color.A = byte(255);
		ColorMod.AlphaBlend = false;
		ColorMod.RenderTwoSided = true;
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x71
	if(bHasSuppressor)
	{
		// End:0x2D
		if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
		{
			return;
		}
		// End:0x3F
		if(int(ClientState) != int(4))
		{
			return;
		}
		TemporaryScopeDown(0.5000000);
		bSilenced = !bSilenced;
		ServerSwitchSilencer(bSilenced);
		SwitchSilencer(bSilenced);
	}
	// End:0x31A
	if(int(ZoomType) != int(0))
	{
		// End:0x134
		if((!bThermal && !bMeatVision) && bHasNightvisionSight)
		{
			bThermal = !bThermal;
			// End:0xD4
			if(bThermal)
			{
				Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOnSound);				
			}
			else
			{
				Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOffSound);
			}
			AdjustThermalView(bThermal);
			// End:0x132
			if(!bScopeView)
			{
				PlayerController(InstigatorController).ClientMessage("Activated nightvision scope.");
			}
			return;
		}
		// End:0x283
		if((bThermal || !bHasNightvisionSight) && !bMeatVision)
		{
			// End:0x1B1
			if(bHasNightvisionSight)
			{
				bThermal = !bThermal;
				// End:0x190
				if(bThermal)
				{
					Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOnSound);					
				}
				else
				{
					Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOffSound);
				}
				AdjustThermalView(bThermal);
			}
			// End:0x1F5
			if(!bScopeView)
			{
				PlayerController(InstigatorController).ClientMessage("Activated infrared targeting scope.");
			}
			// End:0x23C
			if(!bHasTrackingSight)
			{
				// End:0x23A
				if(!bScopeView)
				{
					PlayerController(InstigatorController).ClientMessage("Activated standard scope.");
				}
				return;
			}
			bMeatVision = !bMeatVision;
			// End:0x26C
			if(bMeatVision)
			{
				Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOnSound);				
			}
			else
			{
				Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOffSound);
			}
			return;
		}
		// End:0x31A
		if(!bThermal && bMeatVision)
		{
			bMeatVision = !bMeatVision;
			// End:0x2C9
			if(bMeatVision)
			{
				Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOnSound);				
			}
			else
			{
				Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOffSound);
			}
			// End:0x318
			if(!bScopeView)
			{
				PlayerController(InstigatorController).ClientMessage("Activated standard scope.");
			}
			return;
		}
	}
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x74
	if(bHasSuppressor)
	{
		// End:0x2D
		if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
		{
			return;
		}
		// End:0x3F
		if(int(ClientState) != int(4))
		{
			return;
		}
		TemporaryScopeDown(0.5000000);
		bSilenced = !bSilenced;
		ServerSwitchSilencer(bSilenced);
		SwitchSilencer(bSilenced);		
	}
	else
	{
		bMeatVision = !bMeatVision;
		// End:0xA4
		if(bMeatVision)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOnSound);			
		}
		else
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOffSound);
		}
	}
	//return;	
}

simulated function AddTarget(Pawn Target)
{
	LastPingTime = Level.TimeSeconds;
	TrackedTargets[TrackedTargets.Length] = Target;
	ClientAddTarget(Target);
	//return;	
}

simulated function ClientAddTarget(Pawn Target)
{
	TrackedTargets[TrackedTargets.Length] = Target;
	//return;	
}

simulated function ClientClearTargets()
{
	TrackedTargets.Remove(0, TrackedTargets.Length);
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Actor t;
	local float bestAim, BestDist;
	local Pawn targ;
	local Vector HitLoc, HitNorm, Start, End;

	super.WeaponTick(dt);
	// End:0x29
	if(Level.TimeSeconds >= NextPawnListUpdateTime)
	{
		UpdatePawnList();
	}
	// End:0x7C
	if(((((AIController(Instigator.Controller) != none) && !IsGrenadeLoaded()) && (AmmoAmount(1)) > 0) && BotShouldReloadGrenade()) && !IsReloadingGrenade())
	{
		LoadGrenade();
	}
	// End:0x188
	if(bThermal && bScopeView)
	{
		SetNVLight(true);
		Start = Instigator.Location + Instigator.EyePosition();
		End = Start + (Vector(Instigator.GetViewRotation()) * float(1500));
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(16.0000000, 16.0000000, 16.0000000));
		// End:0x124
		if(t == none)
		{
			HitLoc = End;
		}
		// End:0x167
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
	// End:0x1A1
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x1DC
	if((TrackedTargets.Length != 0) && (Level.TimeSeconds - LastPingTime) > MaxTrackTime)
	{
		TrackedTargets.Length = 0;
		ClientClearTargets();
	}
	// End:0x203
	if(!bScopeView || Level.TimeSeconds < NextTargetFindTime)
	{
		return;
	}
	NextTargetFindTime = Level.TimeSeconds + TargetFindInterval;
	Start = Instigator.Location + Instigator.EyePosition();
	bestAim = 0.9950000;
	targ = Instigator.Controller.PickTarget(bestAim, BestDist, Vector(Instigator.GetViewRotation()), Start, 20000.0000000);
	// End:0x2C6
	if((targ != none) && !FastTrace(targ.Location, Instigator.Location))
	{
		targ = none;
	}
	// End:0x2F8
	if((targ != none) && targ != Target)
	{
		Target = targ;
		targettime = 0.0000000;
	}
	// End:0x328
	if(targ == none)
	{
		targettime = FMax(0.0000000, targettime - (dt * 0.5000000));
		return;		
	}
	else
	{
		// End:0x362
		if(Vehicle(targ) != none)
		{
			targettime += (((1.2000000 * dt) * (bestAim - 0.9500000)) * float(20));			
		}
		else
		{
			targettime += ((dt * (bestAim - 0.9500000)) * float(20));
		}
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
	if(bThermal)
	{
		ScopeViewTex = Texture'BWBP_SKC_Tex.MARS.MARS-ScopeRed';		
	}
	else
	{
		// End:0x2E
		if(bMeatVision)
		{
			ScopeViewTex = Texture'BWBP_SKC_Tex.MARS.MARS-ScopeTarget';			
		}
		else
		{
			ScopeViewTex = Texture'BWBP_SKC_Tex.MARS.MARS-Scope';
		}
	}
	// End:0x50
	if(bThermal)
	{
		DrawThermalMode(C);		
	}
	else
	{
		// End:0x67
		if(bMeatVision)
		{
			DrawMeatVisionMode(C);			
		}
		else
		{
			// End:0x98
			if(bAlwaysTrackSensor)
			{
				// End:0x98
				if(TrackedTargets.Length > 0)
				{
					C.Style = 5;
					DrawSensorTargets(C);
				}
			}
		}
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

simulated function OnScopeViewChanged()
{
	super.OnScopeViewChanged();
	// End:0x70
	if(!bScopeView)
	{
		// End:0x38
		if(Target != none)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOffSound);
			Target = none;
		}
		targettime = 0.0000000;
		// End:0x66
		if(int(Level.NetMode) == int(NM_Client))
		{
			AdjustThermalView(false);			
		}
		else
		{
			ServerAdjustThermal(false);
		}		
	}
	else
	{
		// End:0xA3
		if(bThermal)
		{
			// End:0x9C
			if(int(Level.NetMode) == int(NM_Client))
			{
				AdjustThermalView(true);				
			}
			else
			{
				ServerAdjustThermal(true);
			}
		}
	}
	//return;	
}

simulated function DrawSensorTargets(Canvas C)
{
	local Vector V, v2, X, Y, Z;

	local float ScaleFactor;
	local int i;

	ScaleFactor = C.ClipX / float(1600);
	GetViewAxes(X, Y, Z);
	i = 0;
	J0x39:

	// End:0x26C [Loop If]
	if(i < TrackedTargets.Length)
	{
		// End:0x95
		if(((TrackedTargets[i] == none) || TrackedTargets[i].Health < 1) || !TrackedTargets[i].bProjTarget)
		{
			// [Explicit Continue]
			goto J0x262;
		}
		// End:0xD2
		if((Normal(TrackedTargets[i].Location - Location) Dot Vector(Instigator.GetViewRotation())) < 0.8000000)
		{
			// [Explicit Continue]
			goto J0x262;
		}
		V = C.WorldToScreen((TrackedTargets[i].Location - (Y * TrackedTargets[i].CollisionRadius)) + (Z * TrackedTargets[i].CollisionHeight));
		V.X -= (float(32) * ScaleFactor);
		V.Y -= (float(32) * ScaleFactor);
		C.SetPos(V.X, V.Y);
		v2 = C.WorldToScreen((TrackedTargets[i].Location + (Y * TrackedTargets[i].CollisionRadius)) - (Z * TrackedTargets[i].CollisionHeight));
		C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
		C.DrawTileStretched(Texture'BWBP_SKC_Tex.X82.X82TargetBox', (v2.X - V.X) + (float(32) * ScaleFactor), (v2.Y - V.Y) + (float(32) * ScaleFactor));
		J0x262:

		i++;
		// [Loop Continue]
		goto J0x39;
	}
	//return;	
}

simulated function DrawManualTarget(Canvas C)
{
	local Vector V, v2, V3, X, Y, Z;

	local float ScaleFactor;

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

simulated event DrawMeatVisionMode(Canvas C)
{
	C.Style = 4;
	C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.DrawTile(FinalBlend'BWBP_SKC_Tex.MARS.F2000TargetFinal', float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	C.SetPos(C.OrgX, C.OrgY);
	C.Style = 5;
	// End:0x10B
	if(TrackedTargets.Length > 0)
	{
		DrawSensorTargets(C);
	}
	// End:0x121
	if(Target != none)
	{
		DrawManualTarget(C);
	}
	//return;	
}

simulated event DrawThermalMode(Canvas C)
{
	local Pawn P;
	local int i, j;
	local float dist, DotP;
	local array<Material> OldSkins;
	local int OldSkinCount;
	local bool bLOS, bFocused;
	local Vector Start;
	local array<Material> AttOldSkins0, AttOldSkins1;

	C.Style = 4;
	C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.DrawTile(FinalBlend'BWBP_SKC_Tex.MARS.F2000IRNVFinal', float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	// End:0xD2
	if((ColorMod == none) || !bHasThermalSight)
	{
		return;
	}
	C.Style = 5;
	Start = Instigator.Location + Instigator.EyePosition();
	j = 0;
	J0x10F:

	// End:0x872 [Loop If]
	if(j < PawnList.Length)
	{
		// End:0x868
		if((PawnList[j] != none) && PawnList[j] != Level.GetLocalPlayerController().Pawn)
		{
			P = PawnList[j];
			bFocused = false;
			bLOS = false;
			ThermalRange = default.ThermalRange + (float(2000) * FMin(1.0000000, VSize(P.Velocity) / float(450)));
			dist = VSize(P.Location - Instigator.Location);
			// End:0x1E9
			if(dist > ThermalRange)
			{
				// [Explicit Continue]
				goto J0x868;
			}
			DotP = Normal(P.Location - Start) Dot Vector(Instigator.GetViewRotation());
			// End:0x24D
			if(DotP < Cos((Instigator.Controller.FovAngle / 1.7000000) * 0.0174530))
			{
				// [Explicit Continue]
				goto J0x868;
			}
			// End:0x26C
			if(Instigator.LineOfSightTo(P))
			{
				bLOS = true;
			}
			// End:0x865
			if(bLOS)
			{
				DotP = (DotP - 0.6000000) / 0.4000000;
				DotP = FMax(DotP, 0.0000000);
				// End:0x2D6
				if(dist < float(500))
				{
					ColorMod.Color.R = byte(DotP * 255.0000000);					
				}
				else
				{
					ColorMod.Color.R = byte(DotP * (float(255) - (FClamp((dist - float(500)) / ((ThermalRange - float(500)) * 0.8000000), 0.0000000, 1.0000000) * float(255))));
				}
				ColorMod.Color.G = byte(DotP * (128.0000000 - ((dist / ThermalRange) * 96.0000000)));
				OldSkinCount = P.Skins.Length;
				i = 0;
				J0x383:

				// End:0x3F9 [Loop If]
				if(i < Max(2, OldSkinCount))
				{
					// End:0x3C8
					if(OldSkinCount > i)
					{
						OldSkins[i] = P.Skins[i];						
					}
					else
					{
						OldSkins[i] = none;
					}
					P.Skins[i] = ColorMod;
					i++;
					// [Loop Continue]
					goto J0x383;
				}
				P.bUnlit = true;
				i = 0;
				J0x411:

				// End:0x624 [Loop If]
				if(i < P.Attached.Length)
				{
					// End:0x61A
					if(P.Attached[i] != none)
					{
						// End:0x5FA
						if((Pawn(P.Attached[i]) != none) || ONSWeapon(P.Attached[i]) != none)
						{
							// End:0x4FB
							if(P.Attached[i].Skins.Length > 0)
							{
								AttOldSkins0[i] = P.Attached[i].Skins[0];
								P.Attached[i].Skins[0] = ColorMod;								
							}
							else
							{
								AttOldSkins0[i] = none;
								P.Attached[i].Skins[0] = ColorMod;
							}
							// End:0x5A1
							if(P.Attached[i].Skins.Length > 1)
							{
								AttOldSkins1[i] = P.Attached[i].Skins[1];
								P.Attached[i].Skins[1] = ColorMod;
							}
							// End:0x5F7
							if(P.Attached[i].Skins.Length > 1)
							{
								AttOldSkins1[i] = none;
								P.Attached[i].Skins[1] = ColorMod;
							}
							// [Explicit Continue]
							goto J0x61A;
						}
						P.Attached[i].SetDrawType(0);
					}
					J0x61A:

					i++;
					// [Loop Continue]
					goto J0x411;
				}
				C.DrawActor(P, false, true);
				P.Skins.Length = OldSkinCount;
				i = 0;
				J0x653:

				// End:0x696 [Loop If]
				if(i < P.Skins.Length)
				{
					P.Skins[i] = OldSkins[i];
					i++;
					// [Loop Continue]
					goto J0x653;
				}
				P.bUnlit = false;
				i = 0;
				J0x6AE:

				// End:0x852 [Loop If]
				if(i < P.Attached.Length)
				{
					// End:0x848
					if(P.Attached[i] != none)
					{
						// End:0x80D
						if((Pawn(P.Attached[i]) != none) || ONSWeapon(P.Attached[i]) != none)
						{
							// End:0x7B4
							if(AttOldSkins1[i] == none)
							{
								// End:0x766
								if(AttOldSkins0[i] == none)
								{
									P.Attached[i].Skins.Length = 0;									
								}
								else
								{
									P.Attached[i].Skins.Length = 1;
									P.Attached[i].Skins[0] = AttOldSkins0[i];
								}								
							}
							else
							{
								P.Attached[i].Skins[0] = AttOldSkins0[i];
								P.Attached[i].Skins[1] = AttOldSkins1[i];
							}
							// [Explicit Continue]
							goto J0x848;
						}
						P.Attached[i].SetDrawType(P.Attached[i].default.DrawType);
					}
					J0x848:

					i++;
					// [Loop Continue]
					goto J0x6AE;
				}
				AttOldSkins0.Length = 0;
				AttOldSkins1.Length = 0;
				// [Explicit Continue]
				goto J0x868;
			}
			// [Explicit Continue]
		}
		J0x868:

		j++;
		// [Loop Continue]
		goto J0x10F;
	}
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
		NextPawnListUpdateTime = Level.TimeSeconds + float(1);
	}
	//return;	
}

function ServerAdjustThermal(bool bNewValue)
{
	local int i;

	// End:0x33
	if(bNewValue)
	{
		bUpdatePawns = true;
		UpdatePawnList();
		NextPawnListUpdateTime = Level.TimeSeconds + float(1);		
	}
	else
	{
		bUpdatePawns = false;
		i = 0;
		J0x42:

		// End:0x94 [Loop If]
		if(i < 128)
		{
			// End:0x8A
			if(UpdatedPawns[i] != none)
			{
				UpdatedPawns[i].bAlwaysRelevant = UpdatedPawns[i].default.bAlwaysRelevant;
			}
			i++;
			// [Loop Continue]
			goto J0x42;
		}
	}
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(1, 1.0000000, 'Bullet');
	//return;	
}

simulated event Destroyed()
{
	AdjustThermalView(false);
	// End:0x1E
	if(NVLight != none)
	{
		NVLight.Destroy();
	}
	TrackedTargets.Length = 0;
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = false;
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
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = false;
	return false;
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
	local Bot B;
	local float Result, Height, dist, VDot;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x5D
	if(((AmmoAmount(1)) < 1) || !IsGrenadeLoaded())
	{
		return 0;		
	}
	else
	{
		// End:0x6B
		if(MagAmmo < 1)
		{
			return 1;
		}
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	VDot = Normal(B.Enemy.Velocity) Dot Normal(Instigator.Location - B.Enemy.Location);
	Result = FRand() - 0.3000000;
	// End:0x159
	if(dist > float(800))
	{
		Result -= ((dist - float(800)) / float(2000));
	}
	// End:0x199
	if((dist < float(500)) && VDot > 0.3000000)
	{
		Result -= ((float(500) - dist) / float(1000));
	}
	// End:0x200
	if(VSize(B.Enemy.Velocity) > float(50))
	{
		// End:0x1D8
		if(Abs(VDot) > 0.8000000)
		{
			Result += 0.1000000;
		}
		// End:0x1F4
		if(VDot < float(0))
		{
			Result -= 0.2000000;			
		}
		else
		{
			Result += 0.2000000;
		}
	}
	dist = VSize((B.Enemy.Location * vect(1.0000000, 1.0000000, 0.0000000)) - (Instigator.Location * vect(1.0000000, 1.0000000, 0.0000000)));
	// End:0x27B
	if(Height < float(-100))
	{
		Result += Abs((Height / float(2)) / dist);
	}
	// End:0x28D
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

simulated function bool IsReloadingGrenade()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == GrenadeLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x61
	if(!IsGrenadeLoaded())
	{
		// End:0x41
		if(IsReloadingGrenade())
		{
			// End:0x3E
			if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
			{
				return false;
			}			
		}
		else
		{
			// End:0x61
			if(((AmmoAmount(1)) > 0) && BotShouldReloadGrenade())
			{
				LoadGrenade();
				return false;
			}
		}
	}
	return super.CanAttack(Other);
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
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
	GrenOpenSound=Sound'BW_Core_WeaponSound.M50.M50GrenOpen'
	GrenLoadSound=Sound'BW_Core_WeaponSound.M50.M50GrenLoad'
	GrenCloseSound=Sound'BW_Core_WeaponSound.M50.M50GrenClose'
	GrenadeLoadAnim="GLReload"
	SilencerBone="tip2"
	SilencerOnAnim="SilencerOn"
	SilencerOffAnim="SilencerOff"
	SilencerOnSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOff'
	SilencerOnTurnSound=SoundGroup'BW_Core_WeaponSound.XK2.XK2-SilencerTurn'
	SilencerOffTurnSound=SoundGroup'BW_Core_WeaponSound.XK2.XK2-SilencerTurn'
	ThermalOnSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ThermalOffSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOff',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	NVOnSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOn',Volume=1.6000000,Radius=0.0000000,Slot=0,Pitch=0.9000000,bAtten=false,bNoOverride=false)
	NVOffSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOff',Volume=1.6000000,Radius=0.0000000,Slot=0,Pitch=0.9000000,bAtten=false,bNoOverride=false)
	WallVisionSkin=FinalBlend'BW_Core_WeaponTex.M75.OrangeFinal'
	Flaretex=FinalBlend'BW_Core_WeaponTex.M75.OrangeFlareFinal'
	ThermalRange=2500.0000000
	MaxTrackTime=5.0000000
	TargetFindInterval=0.2000000
	SpecialInfo[0]=(Id="EvoDefs",Info="320.0;30.0;1.0;110.0;0.8;0.5;0.0")
	AIReloadTime=1.0000000
	SightAnimScale=0.4000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.MARSWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.MARSWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.MARSWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.MARSWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.MARS.BigIcon_F2000'
	BigIconCoords=(X1=0,Y1=30,X2=511,Y2=235)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=2.0000000
	MaxZoom=4.0000000
	ZoomStages=1
	FullZoomFOV=45.0000000
	ScopeViewTex=Texture'BWBP_SKC_Tex.MARS.MARS-Scope'
	bNoCrosshairInScope=true
	SMuzzleFlashOffset=(X=15.0000000,Y=0.0000000,Z=-10.0000000)
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-BoltPull',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-BoltPull',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-MagFiddle',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-MagOut',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-MagIn',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=0,A=134),Color2=(R=255,G=0,B=0,A=255),StartSize1=50,StartSize2=51)
	bWT_Bullet=true
	ManualLines[0]="5.56mm fire. Has a fast fire rate and high sustained DPS, but high recoil, limiting its hipfire."
	ManualLines[1]="Launches a smoke grenade. Upon impact, generates a cloud of smoke and deals minor radius damage. There is a bonus for a direct hit."
	ManualLines[2]="The Weapon Function key switches between various integrated scopes.|The Normal scope offers clear vision.|The Night Vision scope (green) illuminates the environment and shows enemies in orange.|The Infrared scope (red) highlights enemies with a box, even underwater or through smoke or trees.||Effective at medium range."
	SightOffset=(X=6.5000000,Y=0.0100000,Z=0.8000000)
	CockingBringUpTime=1.2000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.MARSPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.MARSSecondaryFire'
	PutDownTime=0.7000000
	BringUpTime=0.3300000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	Description="The 2 variant of the Modular Assault Rifle System is one of many rifles built under NDTR Industries' MARS project. The project, which aimed to produce a successor to the army's current M50 and M30 rifles, has produced a number of functional prototypes. The 2 variant is a sharpshooter model with a longer barrel and an advanced, integral scope. Current tests show the MARS-2 to be reliable and effective, yet expensive."
	Priority=65
	HudColor=(R=255,G=0,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	PickupClass=Class'BWBP_SKC_Pro.MARSPickup'
	PlayerViewOffset=(X=4.0000000,Y=4.5000000,Z=-4.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.MARSAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.MARS.SmallIcon_F2000'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="MARS-2 Assault Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.F2000_FPm'
	DrawScale=0.3000000
}
