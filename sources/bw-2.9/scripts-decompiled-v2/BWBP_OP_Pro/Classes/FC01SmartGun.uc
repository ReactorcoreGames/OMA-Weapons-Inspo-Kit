class FC01SmartGun extends BallisticWeapon
	config(BallisticProV55);

var() bool bADSTrack;
var Pawn Target;
var float targettime;
var() float LockOnTime;
var bool bLockedOn;
var bool bLockedOld;
var() FullSound LockOnSound;
var() FullSound LockOffSound;
var() IntRange LaserAimSpread;
var() float TargetUpdateRate;
var Vector TargetLoc;
var bool bLaserOn;
var bool bLaserOld;
var LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var() name PhotonLoadAnim;
var() name PhotonLoadEmptyAnim;
var() Sound PhotonMagOutSound;
var() Sound PhotonMagSlideInSound;
var() Sound PhotonMagHitSound;
var() Sound PhotonMagCockSound;
var bool bSilenced;
var() name SilencerBone;
var() name SilencerOnAnim;
var() name SilencerOffAnim;
var() Sound SilencerOnSound;
var() Sound SilencerOffSound;
var() Sound SilencerOnTurnSound;
var() Sound SilencerOffTurnSound;
var Rotator ScopeSightPivot;
var Vector ScopeSightOffset;
var Rotator IronSightPivot;
var Vector IronSightOffset;
var() float IronsViewBindFactor;
var name ReloadAltAnim;
var FullSound DrumInSound;
var FullSound DrumHitSound;
var FullSound DrumOutSound;
var bool bAltNeedCock;
var float StealthRating;
var float StealthImps;

replication
{
	// Pos:0x01A
	unreliable if(int(Role) == int(ROLE_Authority))
		ClientPhotonPickedUp;

	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Target, bLaserOn, 
		bLockedOn, targettime;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSwitchSilencer;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bADSTrack = false;
	IronsViewBindFactor = RcComponent.Params.ADSViewBindFactor;
	// End:0x65
	if(InStr(WeaponParams.LayoutTags, "TargetScope") != -1)
	{
		bADSTrack = true;
	}
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x2A
	if(bScopeView)
	{
		DrawTargeting(C);
	}
	super.RenderOverlays(C);
	DrawLaserSight(C);
	//return;	
}

simulated function WeaponTick(float dt)
{
	local float bestAim, BestDist;
	local Vector Start;
	local Pawn NewTarget;
	local bool bWasLockedOn;

	super.WeaponTick(dt);
	// End:0x40
	if(!bScopeView || !bADSTrack)
	{
		// End:0x3E
		if(int(Role) == int(ROLE_Authority))
		{
			targettime = 0.0000000;
		}
		return;
	}
	// End:0x52
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	bWasLockedOn = targettime >= LockOnTime;
	Start = Instigator.Location + Instigator.EyePosition();
	bestAim = 0.9950000;
	NewTarget = Instigator.Controller.PickTarget(bestAim, BestDist, Vector(Instigator.GetViewRotation()), Start, 20000.0000000);
	// End:0x165
	if(NewTarget != none)
	{
		// End:0x108
		if(NewTarget != Target)
		{
			Target = NewTarget;
			targettime = 0.0000000;			
		}
		else
		{
			// End:0x142
			if(Vehicle(NewTarget) != none)
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
	// End:0x1FA
	if(Instigator.IsLocallyControlled())
	{
		// End:0x1CB
		if(!bWasLockedOn && targettime >= LockOnTime)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LockOnSound);			
		}
		else
		{
			// End:0x1FA
			if((targettime < LockOnTime) && bWasLockedOn)
			{
				Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LockOffSound);
			}
		}
	}
	bLockedOn = targettime >= LockOnTime;
	// End:0x260
	if(((((AIController(Instigator.Controller) != none) && !IsPhotonLoaded()) && (AmmoAmount(1)) > 0) && BotShouldReloadPhoton()) && !IsReloadingPhoton())
	{
		LoadPhoton();
	}
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
	if(bLaserOn != bLaserOld)
	{
		bLaserOld = bLaserOn;
		ClientSwitchLaser();
	}
	// End:0x93
	if(bLockedOn != bLockedOld)
	{
		bLockedOld = bLockedOn;
		// End:0x7E
		if(bLockedOn)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LockOnSound);			
		}
		else
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LockOffSound);
		}
	}
	super(Weapon).PostNetReceive();
	//return;	
}

simulated event DrawTargeting(Canvas C)
{
	local Vector V, X, Y, Z;
	local float ScaleFactor, XL, XY;

	// End:0x4D
	if((Target != none) && Instigator.Controller.LineOfSightTo(Target))
	{
		TargetLoc = C.WorldToScreen(Target.Location);
	}
	ScaleFactor = C.ClipY / float(1200);
	GetViewAxes(X, Y, Z);
	// End:0xEC
	if((Target == none) || !Instigator.Controller.LineOfSightTo(Target))
	{
		V.X = C.ClipX / float(2);
		V.Y = C.ClipY / float(2);		
	}
	else
	{
		V = TargetLoc;
	}
	C.SetDrawColor(75, byte(255), 0, byte(255));
	C.StrLen("ACQUIRING TARGET LOCK...", XL, XY);
	// End:0x212
	if(bNeedCock || MagAmmo == 0)
	{
		C.DrawTextJustified("RELOAD", 1, (C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY / float(2)) + (float(160) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (XL / float(2)), ((C.ClipY / float(2)) + (float(160) * ScaleFactor)) + (XY / float(2)));		
	}
	else
	{
		// End:0x2DE
		if(Target == none)
		{
			C.DrawTextJustified("DISTANCE: N/A", 0, (C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY / float(2)) + (float(180) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (XL / float(2)), ((C.ClipY / float(2)) + (float(180) * ScaleFactor)) + (XY / float(2)));			
		}
		else
		{
			// End:0x47A
			if(!Instigator.Controller.LineOfSightTo(Target))
			{
				C.DrawTextJustified("TARGET LOST", 1, (C.ClipX / float(2)) - (float(100) * ScaleFactor), ((C.ClipY / float(2)) + (float(160) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (float(100) * ScaleFactor), ((C.ClipY / float(2)) + (float(160) * ScaleFactor)) + (XY / float(2)));
				C.DrawTextJustified("DISTANCE: N/A", 0, (C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY / float(2)) + (float(180) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (XL / float(2)), ((C.ClipY / float(2)) + (float(180) * ScaleFactor)) + (XY / float(2)));				
			}
			else
			{
				// End:0x558
				if(bLockedOn)
				{
					C.SetDrawColor(byte(255), 0, 0, byte(255));
					C.DrawTextJustified("LOCKED", 1, (C.ClipX / float(2)) - (float(100) * ScaleFactor), ((C.ClipY / float(2)) + (float(160) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (float(100) * ScaleFactor), ((C.ClipY / float(2)) + (float(160) * ScaleFactor)) + (XY / float(2)));					
				}
				else
				{
					C.DrawTextJustified("ACQUIRING TARGET LOCK...", 1, (C.ClipX / float(2)) - (float(100) * ScaleFactor), ((C.ClipY / float(2)) + (float(160) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (float(100) * ScaleFactor), ((C.ClipY / float(2)) + (float(160) * ScaleFactor)) + (XY / float(2)));
				}
				C.DrawTextJustified(("DISTANCE: " $ string(int(VSize(TargetLoc - (Instigator.Location + Instigator.EyePosition())) / float(50)))) $ "m", 0, (C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY / float(2)) + (float(180) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (XL / float(2)), ((C.ClipY / float(2)) + (float(180) * ScaleFactor)) + (XY / float(2)));
				C.SetPos(V.X - (float(32) * ScaleFactor), V.Y - (float(32) * ScaleFactor));
				C.DrawTile(Texture'BW_Core_WeaponTex.G5.G5TargetBox', 64.0000000 * ScaleFactor, 64.0000000 * ScaleFactor, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
			}
		}
	}
	// End:0xB4F
	if((Target != none) && !bLockedOn)
	{
		C.SetPos(V.X - ((((float(140) - ((C.ClipX / float(2)) - V.X)) * (float(1) - (targettime / LockOnTime))) + float(36)) * ScaleFactor), V.Y - ((((float(140) - ((C.ClipY / float(2)) - V.Y)) * (float(1) - (targettime / LockOnTime))) + float(36)) * ScaleFactor));
		C.DrawTile(Texture'BW_Core_WeaponTex.G5.G5LockBox', 36.0000000 * ScaleFactor, 36.0000000 * ScaleFactor, 0.0000000, 0.0000000, 64.0000000, 64.0000000);
		C.SetPos(V.X - ((((float(140) - ((C.ClipX / float(2)) - V.X)) * (float(1) - (targettime / LockOnTime))) + float(36)) * ScaleFactor), V.Y + (((float(140) - (V.Y - (C.ClipY / float(2)))) * (float(1) - (targettime / LockOnTime))) * ScaleFactor));
		C.DrawTile(Texture'BW_Core_WeaponTex.G5.G5LockBox', 36.0000000 * ScaleFactor, 36.0000000 * ScaleFactor, 0.0000000, 64.0000000, 64.0000000, 64.0000000);
		C.SetPos(V.X + (((float(140) - (V.X - (C.ClipX / float(2)))) * (float(1) - (targettime / LockOnTime))) * ScaleFactor), V.Y - ((((float(140) - ((C.ClipY / float(2)) - V.Y)) * (float(1) - (targettime / LockOnTime))) + float(36)) * ScaleFactor));
		C.DrawTile(Texture'BW_Core_WeaponTex.G5.G5LockBox', 36.0000000 * ScaleFactor, 36.0000000 * ScaleFactor, 64.0000000, 0.0000000, 64.0000000, 64.0000000);
		C.SetPos(V.X + (((float(140) - (V.X - (C.ClipX / float(2)))) * (float(1) - (targettime / LockOnTime))) * ScaleFactor), V.Y + (((float(140) - (V.Y - (C.ClipY / float(2)))) * (float(1) - (targettime / LockOnTime))) * ScaleFactor));
		C.DrawTile(Texture'BW_Core_WeaponTex.G5.G5LockBox', 36.0000000 * ScaleFactor, 36.0000000 * ScaleFactor, 64.0000000, 64.0000000, 64.0000000, 64.0000000);
	}
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	FC01Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
	loc = GetBoneCoords('tip2').Origin;
	Laser.SetLocation(loc);
	// End:0x133
	if(!bLockedOn)
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
			FC01Attachment(ThirdPersonActor).LaserEndLoc = HitLocation;
		}		
	}
	else
	{
		HitLocation = ConvertFOVs(TargetLoc, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
		// End:0x189
		if(ThirdPersonActor != none)
		{
			FC01Attachment(ThirdPersonActor).LaserEndLoc = TargetLoc;
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
	if((LaserDot != none) && !bLockedOn)
	{
		LaserDot.SetLocation(HitLocation);		
	}
	else
	{
		LaserDot.SetLocation(TargetLoc);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	// End:0x291
	if((int(ReloadState) == int(0)) && int(ClientState) == int(4))
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		Laser.SetRotation(GetBoneRotation('tip2'));
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

function ServerSwitchSilencer(bool bNewValue)
{
	// End:0x13
	if(bSilenced == bNewValue)
	{
		return;
	}
	bSilenced = bNewValue;
	SwitchSilencer(bSilenced);
	FC01PrimaryFire(bFireMode[0]).SetSilenced(bNewValue);
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x24
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	// End:0x36
	if(int(ClientState) != int(4))
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	bSilenced = !bSilenced;
	ServerSwitchSilencer(bSilenced);
	SwitchSilencer(bSilenced);
	StealthImpulse(0.1000000);
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

simulated function StealthImpulse(float Amount)
{
	// End:0x2B
	if(Instigator.IsLocallyControlled())
	{
		StealthImps = FMin(1.0000000, StealthImps + Amount);
	}
	//return;	
}

simulated function OnSuppressorSwitched()
{
	// End:0x1E
	if(bSilenced)
	{
		ApplySuppressorAim();
		SightingTime *= 1.2500000;		
	}
	else
	{
		AimComponent.Recalculate();
		SightingTime = default.SightingTime;
	}
	//return;	
}

simulated function Notify_SilencerAdd()
{
	PlaySound(SilencerOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOnTurn()
{
	PlaySound(SilencerOnTurnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerRemove()
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

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(1, 1.0000000, 'Bullet');
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
		FC01Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0xD4
	if(AIController(Instigator.Controller) != none)
	{
		bSilenced = FRand() > 0.5000000;
	}
	// End:0xF1
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
	//return;	
}

simulated function bool PutDown()
{
	// End:0x93
	if(super.PutDown())
	{
		KillLaserDot();
		// End:0x30
		if(ThirdPersonActor != none)
		{
			FC01Attachment(ThirdPersonActor).bLaserOn = false;
		}
		Instigator.AmbientSound = UsedAmbientSound;
		Instigator.SoundVolume = default.SoundVolume;
		Instigator.SoundPitch = default.SoundPitch;
		Instigator.SoundRadius = default.SoundRadius;
		Instigator.bFullVolume = false;
		return true;
	}
	return false;
	//return;	
}

simulated function Notify_AltClipOut()
{
	PlaySound(PhotonMagOutSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_AltClipSlideIn()
{
	PlaySound(PhotonMagSlideInSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_SGCock()
{
	PlaySound(PhotonMagCockSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_AltClipIn()
{
	PlaySound(PhotonMagHitSound, 1, 0.5000000,, 64.0000000);
	// End:0x68
	if(Ammo[1].AmmoAmount < FC01PrimaryFire(FireMode[0]).default.PhotonCharge)
	{
		FC01PrimaryFire(FireMode[0]).PhotonCharge = Ammo[1].AmmoAmount;		
	}
	else
	{
		FC01PrimaryFire(FireMode[0]).PhotonCharge = FC01PrimaryFire(FireMode[0]).default.PhotonCharge;
	}
	//return;	
}

function PhotonPickedUp()
{
	// End:0xC0
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x42
		if(Instigator.Weapon == self)
		{
			LoadPhoton();			
		}
		else
		{
			// End:0x95
			if(Ammo[1].AmmoAmount < FC01PrimaryFire(FireMode[0]).default.PhotonCharge)
			{
				FC01PrimaryFire(FireMode[0]).PhotonCharge = Ammo[1].AmmoAmount;				
			}
			else
			{
				FC01PrimaryFire(FireMode[0]).PhotonCharge = FC01PrimaryFire(FireMode[0]).default.PhotonCharge;
			}
		}
	}
	// End:0xDA
	if(!Instigator.IsLocallyControlled())
	{
		ClientPhotonPickedUp();
	}
	//return;	
}

simulated function ClientPhotonPickedUp()
{
	// End:0xBC
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x3E
		if(int(ClientState) == int(4))
		{
			LoadPhoton();			
		}
		else
		{
			// End:0x91
			if(Ammo[1].AmmoAmount < FC01PrimaryFire(FireMode[0]).default.PhotonCharge)
			{
				FC01PrimaryFire(FireMode[0]).PhotonCharge = Ammo[1].AmmoAmount;				
			}
			else
			{
				FC01PrimaryFire(FireMode[0]).PhotonCharge = FC01PrimaryFire(FireMode[0]).default.PhotonCharge;
			}
		}
	}
	//return;	
}

simulated function bool IsPhotonLoaded()
{
	// End:0x20
	if(FC01PrimaryFire(FireMode[0]).PhotonCharge > 0)
	{
		return true;		
	}
	else
	{
		return false;
	}
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	super.GiveAmmo(M, WP, bJustSpawned);
	// End:0x4E
	if((Ammo[1] != none) && Ammo_FC01Alt(Ammo[1]) != none)
	{
		Ammo_FC01Alt(Ammo[1]).Gun = self;
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x52
	if((Anim == PhotonLoadAnim) || Anim == PhotonLoadEmptyAnim)
	{
		ReloadState = 0;
		IdleTweenTime = 0.0000000;
		PlayIdle();		
	}
	else
	{
		IdleTweenTime = default.IdleTweenTime;
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function LoadPhoton()
{
	// End:0x5D
	if((Ammo[1].AmmoAmount > FC01PrimaryFire(FireMode[0]).default.PhotonCharge) && FC01PrimaryFire(FireMode[0]).PhotonCharge >= FC01PrimaryFire(FireMode[0]).default.PhotonCharge)
	{
		return;
	}
	// End:0xB5
	if((Ammo[1].AmmoAmount <= FC01PrimaryFire(FireMode[0]).default.PhotonCharge) && FC01PrimaryFire(FireMode[0]).PhotonCharge >= Ammo[1].AmmoAmount)
	{
		return;
	}
	// End:0x13E
	if(int(ReloadState) == int(0))
	{
		ReloadState = 8;
		// End:0xF5
		if(bScopeView && Instigator.IsLocallyControlled())
		{
			TemporaryScopeDown(default.SightingTime);
		}
		// End:0x12F
		if((FC01PrimaryFire(FireMode[0]).PhotonCharge < 1) && HasAnim(PhotonLoadEmptyAnim))
		{
			PlayAnim(PhotonLoadEmptyAnim, 0.7500000,, 0);			
		}
		else
		{
			PlayAnim(PhotonLoadAnim, 0.7500000,, 0);
		}
	}
	//return;	
}

simulated function bool IsReloadingPhoton()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x38
	if((Anim == PhotonLoadAnim) || Anim == PhotonLoadEmptyAnim)
	{
		return true;
	}
	return false;
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
	// End:0x59
	if((seq == PhotonLoadAnim) || seq == PhotonLoadEmptyAnim)
	{
		return;
	}
	// End:0xB9
	if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		// End:0xB7
		if(((AmmoAmount(1)) > 0) && !IsReloadingPhoton())
		{
			LoadPhoton();
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
			if(((AmmoAmount(1)) > 0) && !IsReloadingPhoton())
			{
				LoadPhoton();
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
	// End:0x2A
	if(int(CurrentWeaponMode) == 1)
	{
		return FireCount <= FC01PrimaryFire(FireMode[0]).default.PhotonCharge;
	}
	return super.CheckWeaponMode(Mode);
	//return;	
}

function bool BotShouldReloadPhoton()
{
	// End:0x2A
	if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function bool ConsumeMagAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	// End:0x58
	if(((bFireMode[Mode] != none) && bFireMode[Mode].bUseWeaponMag == false) && int(CurrentWeaponMode) == 1)
	{
		ConsumeAmmo(int(CurrentWeaponMode), load, bAmountNeededIsMax);		
	}
	else
	{
		super.ConsumeMagAmmo(Mode, load, bAmountNeededIsMax);
	}
	return true;
	//return;	
}

simulated exec function ScopeView()
{
	// End:0x36
	if(((int(ZoomType) == int(1)) && int(SightingState) != int(0)) && int(SightingState) != int(3))
	{
		return;
	}
	// End:0xA3
	if(int(SightingState) == int(0))
	{
		// End:0xA3
		if(int(ZoomType) == int(1))
		{
			RcComponent.Params.ADSViewBindFactor = IronsViewBindFactor;
			SightPivot = IronSightPivot;
			SightOffset = IronSightOffset;
			ZoomType = 0;
			ScopeViewTex = none;
			SightingTime = default.SightingTime;
		}
	}
	super.ScopeView();
	//return;	
}

simulated exec function ScopeViewRelease()
{
	// End:0x36
	if(((int(ZoomType) != int(0)) && int(SightingState) != int(0)) && int(SightingState) != int(3))
	{
		return;
	}
	super.ScopeViewRelease();
	//return;	
}

simulated function ScopeViewTwo()
{
	// End:0x36
	if(((int(ZoomType) == int(0)) && int(SightingState) != int(0)) && int(SightingState) != int(3))
	{
		return;
	}
	// End:0x9C
	if(int(SightingState) == int(0))
	{
		ScopeViewTex = Texture'BWBP_OP_Tex.ProtoLMG.ProtoScope1';
		// End:0x9C
		if(int(ZoomType) == int(0))
		{
			RcComponent.Params.ADSViewBindFactor = 1.0000000;
			SightPivot = ScopeSightPivot;
			SightOffset = ScopeSightOffset;
			ZoomType = 1;
		}
	}
	ScopeView();
	//return;	
}

simulated function ScopeViewTwoRelease()
{
	// End:0x36
	if(((int(ZoomType) == int(0)) && int(SightingState) != int(0)) && int(SightingState) != int(3))
	{
		return;
	}
	ScopeViewRelease();
	//return;	
}

simulated function SetHand(float InHand)
{
	IronSightPivot = WeaponParams.SightPivot;
	IronSightOffset = WeaponParams.SightOffset;
	super.SetHand(InHand);
	// End:0xFF
	if(hand < float(0))
	{
		// End:0xA9
		if(int(ZoomType) != int(0))
		{
			ScopeSightOffset.Y = ScopeSightOffset.Y * float(-1);
			ScopeSightPivot.Roll = ScopeSightPivot.Roll * -1;
			ScopeSightPivot.Yaw = ScopeSightPivot.Yaw * -1;			
		}
		else
		{
			IronSightOffset.Y = IronSightOffset.Y * float(-1);
			IronSightPivot.Roll = IronSightPivot.Roll * -1;
			IronSightPivot.Yaw = IronSightPivot.Yaw * -1;
		}
	}
	//return;	
}

simulated function float ChargeBar()
{
	return float(FC01PrimaryFire(bFireMode[0]).PhotonCharge) / float(FC01PrimaryFire(bFireMode[0]).default.PhotonCharge);
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

function bool CanAttack(Actor Other)
{
	// End:0x61
	if(!IsPhotonLoaded())
	{
		// End:0x41
		if(IsReloadingPhoton())
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
			if(((AmmoAmount(1)) > 0) && BotShouldReloadPhoton())
			{
				LoadPhoton();
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, BallisticProInstantFire(bFireMode[0]).DecayRange.Min, BallisticProInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.6000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.6000000;
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

defaultproperties
{
	LockOnTime=1.5000000
	LockOnSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-TargetOn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	LockOffSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-TargetOff',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	PhotonLoadAnim="ReloadAlt"
	PhotonLoadEmptyAnim="ReloadEmptyAlt"
	PhotonMagOutSound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOff'
	PhotonMagSlideInSound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOn'
	PhotonMagHitSound=Sound'BW_Core_WeaponSound.A73.A73-PipeIn'
	PhotonMagCockSound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-Cock'
	SilencerBone="Silencer"
	SilencerOnAnim="SilencerOn"
	SilencerOffAnim="SilencerOff"
	SilencerOnSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.XK2.XK2-SilenceOff'
	SilencerOnTurnSound=SoundGroup'BW_Core_WeaponSound.XK2.XK2-SilencerTurn'
	SilencerOffTurnSound=SoundGroup'BW_Core_WeaponSound.XK2.XK2-SilencerTurn'
	ScopeSightPivot=(Pitch=0,Yaw=0,Roll=-4096)
	ScopeSightOffset=(X=15.0000000,Y=-3.0000000,Z=24.0000000)
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.9;85.0;0.1;0.9;0.4")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_OP_Pro.FC01WeaponParams'
	ParamsClasses[1]=Class'BWBP_OP_Pro.FC01WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.FC01WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.FC01WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.ProtoLMG.BigIcon_ProtoLMG'
	BigIconCoords=(X1=16,Y1=30,X2=511,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Photon Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockAnimPostReload="Cock"
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-Cock',Volume=2.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-MagOut',Volume=2.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-MagIn',Volume=2.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	bAltTriggerReload=true
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.R78OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=255,A=255),Color2=(R=59,G=52,B=255,A=255),StartSize1=96,StartSize2=96)
	bWT_Bullet=true
	bWT_Shotgun=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic 7.62mm fire. High power, but shorter effective range and suffers from high recoil."
	ManualLines[1]="Burst Fire Enables a Photon Burst, allowing for a forced faster rate of fire for the longer range engagement"
	ManualLines[2]="Effective at close to medium to long range. With the addition of the Scope, Red Dot Sight & the attachable Silencer"
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.9500000)
	MagAmmo=50
	CockAnimRate=1.4000000
	GunLength=16.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.FC01PrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.FC01ScopeFire'
	PutDownTime=1.0000000
	BringUpTime=1.0000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	Description="After the restrictions of photon based weaponry was lifted, several manufacturers began working on making new weapons with the technology in mind.  One such company was NDTR Industries, who saw the development of the EP90 and decided to make a PDW like that on their own, utilizing the old P90 as their inspiration.  Now known as the FCO1-B Smart PDW, as the name implies, it's still a prototype with only a few 100 being made for testing.  Still relatively potent thanks to an integral silencer and a unique second magazine that is actually a photon battery, powering a special burst that disorients and disables any organic or mechanized target."
	Priority=41
	HudColor=(R=255,G=255,B=135,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	GroupOffset=10
	PickupClass=Class'BWBP_OP_Pro.FC01Pickup'
	PlayerViewOffset=(X=5.0000000,Y=6.0000000,Z=-18.0000000)
	BobDamping=2.0000000
	AttachmentClass=Class'BWBP_OP_Pro.FC01Attachment'
	IconMaterial=Texture'BWBP_OP_Tex.ProtoLMG.SmallIcon_ProtoLMG'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="FC-01 Smartgun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.FC01_FPm'
	DrawScale=0.4000000
}
