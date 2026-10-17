class CX85AssaultWeapon extends BallisticWeapon
	config(BallisticProV55);

var array<CX85DartDirect> StuckDarts;
var FullSound DrumInSound;
var FullSound DrumOutSound;
var name ReloadAltAnim;
var int AltAmmo;
var int BaseTrackDist;
var float LastDetonationTime;
var bool bPendingReceive;
var Vector TargetLocation;
var bool bLaserOn;
var bool bLaserOld;
var bool bLaserTarget;
var LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		AltAmmo, ClientAddProjectile, 
		ClientRemoveProjectile, bLaserOn, 
		bPendingReceive;
}

simulated function Vector GetModeEffectStart(byte Mode)
{
	// End:0xA5
	if(Instigator.IsFirstPerson())
	{
		// End:0x22
		if(WeaponCentered())
		{
			return CenteredEffectStart();
		}
		// End:0x6A
		if(int(Mode) == 0)
		{
			return ConvertFOVs(GetBoneCoords('tip').Origin, DisplayFOV, Instigator.Controller.FovAngle, 32.0000000);			
		}
		else
		{
			return ConvertFOVs(GetBoneCoords('tip2').Origin, DisplayFOV, Instigator.Controller.FovAngle, 32.0000000);
		}		
	}
	else
	{
		return (Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 0.5000000))) + (Vector(Instigator.Rotation) * 40.0000000);
	}
	//return;	
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
		C.DrawTile(Texture'BWBP_OP_Tex.CX85.Dart_HUD', AmmoDimensions, AmmoDimensions, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
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

simulated function Notify_DrumOut()
{
	PlayOwnedSound(DrumOutSound.Sound, DrumOutSound.Slot, DrumOutSound.Volume, DrumOutSound.bNoOverride, DrumOutSound.Radius, DrumOutSound.Pitch, DrumOutSound.bAtten);
	ReloadState = 2;
	//return;	
}

simulated function Notify_DrumIn()
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

function AddProjectile(CX85DartDirect proj)
{
	StuckDarts[StuckDarts.Length] = proj;
	ClientAddProjectile(proj);
	bPendingReceive = false;
	// End:0x5F
	if(((int(Role) == int(ROLE_Authority)) && !bLaserOn) && !Class'BCoreProV55.BallisticReplicationInfo'.static.IsArenaOrTactical())
	{
		ServerSwitchLaser(true);
	}
	//return;	
}

simulated function ClientAddProjectile(CX85DartDirect proj)
{
	StuckDarts[StuckDarts.Length] = proj;
	//return;	
}

function LostChild(Actor proj)
{
	local int i;

	// End:0x6F
	if(CX85DartDirect(proj) != none)
	{
		i = 0;
		J0x17:

		// End:0x48 [Loop If]
		if((i < StuckDarts.Length) && StuckDarts[i] != proj)
		{
			i++;
			// [Loop Continue]
			goto J0x17;
		}
		// End:0x6F
		if(i < StuckDarts.Length)
		{
			StuckDarts.Remove(i, 1);
			ClientRemoveProjectile(proj);
		}
	}
	// End:0x9F
	if(((int(Role) == int(ROLE_Authority)) && StuckDarts.Length == 0) && bLaserOn)
	{
		ServerSwitchLaser(false);
	}
	//return;	
}

simulated function ClientRemoveProjectile(Actor proj)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x38 [Loop If]
	if((i < StuckDarts.Length) && StuckDarts[i] != proj)
	{
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x54
	if(i < StuckDarts.Length)
	{
		StuckDarts.Remove(i, 1);
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x40
	if((Instigator.bNoWeaponFiring || bPendingReceive) || (LastDetonationTime + 0.7500000) > Level.TimeSeconds)
	{
		return;
	}
	ServerWeaponSpecial();
	LastDetonationTime = Level.TimeSeconds;
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x4E
	if(((Instigator.bNoWeaponFiring || bPendingReceive) || (LastDetonationTime + 0.7500000) > Level.TimeSeconds) || StuckDarts.Length == 0)
	{
		return;
	}
	StuckDarts[StuckDarts.Length - 1].Explode(StuckDarts[StuckDarts.Length - 1].Location, Vector(StuckDarts[StuckDarts.Length - 1].Rotation));
	LastDetonationTime = Level.TimeSeconds;
	//return;	
}

simulated function RenderOverlays(Canvas C)
{
	super.RenderOverlays(C);
	// End:0x23
	if(!IsInState('Lowered'))
	{
		DrawLaserSight(C);
	}
	// End:0x37
	if(bScopeView)
	{
		DrawTargeting(C);
	}
	//return;	
}

simulated function Vector GetFlechetteTarget()
{
	local float ShortestDistance;
	local Pawn ClosestVictim;
	local int i;

	// End:0x22
	if(StuckDarts.Length == 0)
	{
		bLaserTarget = false;
		return vect(0.0000000, 0.0000000, 0.0000000);
	}
	ShortestDistance = float(BaseTrackDist);
	i = 0;
	J0x36:

	// End:0x1A4 [Loop If]
	if(i < StuckDarts.Length)
	{
		// End:0xAD
		if(((StuckDarts[i].Tracked == none) || StuckDarts[i].Tracked.Health < 1) || !StuckDarts[i].Tracked.bProjTarget)
		{
			// [Explicit Continue]
			goto J0x19A;
		}
		// End:0x101
		if(VSize(StuckDarts[i].Tracked.Location - Instigator.Location) > float(StuckDarts[i].TrackCount * BaseTrackDist))
		{
			// [Explicit Continue]
			goto J0x19A;
		}
		// End:0x147
		if((Normal(StuckDarts[i].Tracked.Location - Location) Dot Vector(Instigator.GetViewRotation())) < 0.8000000)
		{
			// [Explicit Continue]
			goto J0x19A;
		}
		// End:0x19A
		if(VSize(StuckDarts[i].Tracked.Location - Instigator.Location) < ShortestDistance)
		{
			ClosestVictim = StuckDarts[i].Tracked;
		}
		J0x19A:

		i++;
		// [Loop Continue]
		goto J0x36;
	}
	// End:0x1DD
	if(ClosestVictim != none)
	{
		bLaserTarget = true;
		TargetLocation = ClosestVictim.Location;
		return ClosestVictim.Location;		
	}
	else
	{
		bLaserTarget = false;
		return vect(0.0000000, 0.0000000, 0.0000000);
	}
	//return;	
}

simulated event DrawTargeting(Canvas C)
{
	local Vector V, v2, X, Y, Z;

	local float ScaleFactor, Distancing;
	local int i;

	// End:0x0E
	if(StuckDarts.Length == 0)
	{
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
	GetViewAxes(X, Y, Z);
	i = 0;
	J0x47:

	// End:0x38C [Loop If]
	if(i < StuckDarts.Length)
	{
		// End:0xBE
		if(((StuckDarts[i].Tracked == none) || StuckDarts[i].Tracked.Health < 1) || !StuckDarts[i].Tracked.bProjTarget)
		{
			// [Explicit Continue]
			goto J0x382;
		}
		// End:0x112
		if(VSize(StuckDarts[i].Tracked.Location - Instigator.Location) > float(StuckDarts[i].TrackCount * BaseTrackDist))
		{
			// [Explicit Continue]
			goto J0x382;
		}
		// End:0x158
		if((Normal(StuckDarts[i].Tracked.Location - Location) Dot Vector(Instigator.GetViewRotation())) < 0.8000000)
		{
			// [Explicit Continue]
			goto J0x382;
		}
		V = C.WorldToScreen((StuckDarts[i].Tracked.Location - (Y * StuckDarts[i].Tracked.CollisionRadius)) + (Z * StuckDarts[i].Tracked.CollisionHeight));
		V.X -= (float(32) * ScaleFactor);
		V.Y -= (float(32) * ScaleFactor);
		Distancing = 1.0000000 - (VSize(StuckDarts[i].Tracked.Location - Instigator.Location) / float(StuckDarts[i].TrackCount * BaseTrackDist));
		C.SetPos(V.X, V.Y);
		v2 = C.WorldToScreen((StuckDarts[i].Tracked.Location + (Y * StuckDarts[i].Tracked.CollisionRadius)) - (Z * StuckDarts[i].Tracked.CollisionHeight));
		C.SetDrawColor(byte(255), byte(255), byte(255), byte(float(255) * Distancing));
		C.DrawTileStretched(Texture'BW_Core_WeaponTex.G5.G5TargetBox', (v2.X - V.X) + (float(32) * ScaleFactor), (v2.Y - V.Y) + (float(32) * ScaleFactor));
		J0x382:

		i++;
		// [Loop Continue]
		goto J0x47;
	}
	//return;	
}

simulated function WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x3B
	if(((Instigator != none) && Instigator.IsLocallyControlled()) && bLaserOn)
	{
		GetFlechetteTarget();
	}
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	CX85Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	// End:0x40
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	OnLaserSwitched();
	//return;	
}

simulated function ClientSwitchLaser()
{
	// End:0x26
	if(bLaserOn)
	{
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);		
	}
	else
	{
		KillLaserDot();
		PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
	}
	PlayIdle();
	OnLaserSwitched();
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
	AimComponent.AimSpread.Max *= 0.8000000;
	AimComponent.AimAdjustTime *= 1.5000000;
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x4C
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_G5Painter');
	}
	// End:0x85
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0xAB
	if(ThirdPersonActor != none)
	{
		CX85Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
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
			CX85Attachment(ThirdPersonActor).bLaserOn = false;
		}
		return true;
	}
	return false;
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

simulated function DrawLaserSight(Canvas Canvas)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc,
		AimDir;

	local Actor Other;

	// End:0x5A
	if((((((int(ClientState) == int(1)) || !bLaserOn) || bScopeView) || Instigator == none) || Instigator.Controller == none) || Laser == none)
	{
		return;
	}
	loc = GetBoneCoords('tip').Origin;
	Laser.SetLocation(loc);
	// End:0x133
	if(!bLaserTarget)
	{
		AimDir = BallisticFire(FireMode[0]).GetFireDir(Start);
		End = Start + (Normal(AimDir) * float(10000));
		Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x10C
		if(Other == none)
		{
			HitLocation = End;
		}
		// End:0x130
		if(ThirdPersonActor != none)
		{
			CX85Attachment(ThirdPersonActor).LaserEndLoc = HitLocation;
		}		
	}
	else
	{
		HitLocation = ConvertFOVs(TargetLocation, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
		// End:0x189
		if(ThirdPersonActor != none)
		{
			CX85Attachment(ThirdPersonActor).LaserEndLoc = TargetLocation;
		}
	}
	// End:0x1E5
	if(((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x217
	if((LaserDot != none) && !bLaserTarget)
	{
		LaserDot.SetLocation(HitLocation);		
	}
	else
	{
		LaserDot.SetLocation(TargetLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	// End:0x291
	if((int(ReloadState) == int(0)) && int(ClientState) == int(4))
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		Laser.SetRotation(GetBoneRotation('tip'));
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 1.5000000;
	Scale3D.Z = 1.5000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
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
		LaserDot = Spawn(Class'BallisticProV55.G5LaserDot',,, loc);
	}
	//return;	
}

simulated function PlayIdle()
{
	super.PlayIdle();
	// End:0x49
	if(((!bLaserOn || bPendingSightUp) || int(SightingState) != int(0)) || !CanPlayAnim(IdleAnim,, "IDLE"))
	{
		return;
	}
	FreezeAnimAt(0.0000000);
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.5000000, dist, 2048.0000000, 3072.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.6000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.6000000;
	//return;	
}

defaultproperties
{
	DrumInSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOn',Volume=0.5000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	DrumOutSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOff',Volume=0.5000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ReloadAltAnim="ReloadAlt"
	AltAmmo=6
	BaseTrackDist=3368
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;30.0;0.9;75.0;1.0;0.0;-999.0")
	ParamsClasses[0]=Class'BWBP_OP_Pro.CX85WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.CX85WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.CX85WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.CX85WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.CX85.BigIcon_CX85'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Pullout',Volume=0.2190000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Putaway',Volume=0.2190000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=2.0000000
	MaxZoom=8.0000000
	FullZoomFOV=20.0000000
	ScopeViewTex=Texture'BWBP_OP_Tex.CX85.CX85ScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_OP_Sounds.CX85.CX85-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_OP_Sounds.CX61.CX61-MagIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_OP_Sounds.CX85.CX85-MagOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_OP_Sounds.CX85.CX85-MagIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc7',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50In',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=77,G=123,B=0,A=125),Color2=(R=255,G=183,B=0,A=255),StartSize1=96,StartSize2=96)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic low-calibre fire. Has extremely long effective range, but as a low-calibre weapon, must be fired in bursts at range, subjecting the user to the effects of recoil."
	ManualLines[1]="Fires a dart. Good fire rate and fast flight speed. Enemies hit by the darts show up on the scope when within a given range of the user. The tracking range increases with successive hits."
	ManualLines[2]="Weapon Function for this weapon causes all the darts attached to the last player to be hit for the first time to explode. This feature works independently of range.||The CX85 is effective at long range."
	SightingTime=0.6500000
	SightOffset=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	GunLength=72.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.CX85PrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.CX85SecondaryFire'
	PutDownTime=0.7000000
	BringUpTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="The Cimerion Labs CX85 was created to serve the purpose of enemy location and tracking in a battlefield environment where operatives needed tactical-level information on enemy positions and movements without the ability to rely upon allied intelligence. Capable of launching miniature darts, each packed with an explosive charge and a remote transmitter, the CX is able to discern the location of struck enemies. Should the user no longer have need for the tracking ability, the darts can be detonated at long range to damage the target and surrounding entities."
	Priority=40
	HudColor=(R=150,G=125,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	GroupOffset=6
	PickupClass=Class'BWBP_OP_Pro.CX85Pickup'
	PlayerViewOffset=(X=10.0000000,Y=7.0000000,Z=-4.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.CX85Attachment'
	IconMaterial=Texture'BWBP_OP_Tex.CX85.SmallIcon_CX85'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="CX85 Combat Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.CX85_FPm'
	DrawScale=0.3000000
}
