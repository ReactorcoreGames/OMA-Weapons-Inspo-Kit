class BallisticHandgun extends BallisticWeapon
	abstract
	config(BallisticProV55);

var BallisticHandgun OtherGun;
var bool bIsMaster;
var BallisticHandgun PendingHandgun;
var bool bIsPendingHandGun;
var name SupportHandBone;
var BallisticHandgun LastSlave;
var float LastMasterTime;
var bool bSlavePutDown;
var() bool bShouldDualInLoadout;
var float CreationTime;
var bool bDualBlocked;
var bool bUseDualReload;
var bool bDualMixing;
var() name DualReloadAnim;
var() name DualReloadEmptyAnim;
var() float DualReloadAnimRate;
var() float DualReloadAnimDelay;
var Pawn Target;
var Rotator TrackerAim;
var float TrackSpeed;
var bool bIsAutoTracking;
var bool bAutoTrack;
var byte HandgunGroup;
var() float SingleHeldRate;

replication
{
	// Pos:0x000
	reliable if((bNetOwner && bNetDirty) && int(Role) == int(ROLE_Authority))
		Target, bIsAutoTracking;

	// Pos:0x023
	reliable if(int(Role) < int(ROLE_Authority))
		ServerDoQuickDraw, ServerLeaveDualMode, 
		ServerStartTracking, ServerStopTracking, 
		ServerSwap, SetDualGun;

	// Pos:0x030
	reliable if(int(Role) == int(ROLE_Authority))
		ClientDualSelect;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	CreationTime = Level.TimeSeconds;
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x1B
	if(int(GameStyleIndex) == 0)
	{
		bUseDualReload = true;
	}
	//return;	
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bDualBlocked = WeaponParams.bDualBlocked;
	bDualMixing = WeaponParams.bDualMixing;
	//return;	
}

simulated exec function ScopeView()
{
	// End:0x2D
	if(((OtherGun == none) && PendingHandgun == none) && !bIsPendingHandGun)
	{
		super.ScopeView();
		return;
	}
	//return;	
}

simulated exec function ScopeViewRelease()
{
	// End:0x13
	if(OtherGun == none)
	{
		super.ScopeViewRelease();
		return;
	}
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
	// End:0xDB
	if((((IsMaster() || AimComponent.IsDisplaced()) || (int(ReloadState) != int(0)) && int(ReloadState) != int(8)) || (int(Instigator.Controller.bRun) == 0) && int(Instigator.Physics) == int(1)) || (SprintControl != none) && SprintControl.bSprinting)
	{
		StopScopeView();
		return false;
	}
	return true;
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	super.ServerSwitchWeaponMode(newmode);
	// End:0x4F
	if((bIsMaster && OtherGun != none) && OtherGun.Class == Class)
	{
		OtherGun.ServerSwitchWeaponMode(CurrentWeaponMode);
	}
	//return;	
}

function ServerStartTracking()
{
	local float bestAim, BestDist;
	local Pawn targ;
	local Vector Start;

	bAutoTrack = true;
	Start = Instigator.Location + Instigator.EyePosition();
	bestAim = 0.9500000;
	targ = Instigator.Controller.PickTarget(bestAim, BestDist, Vector(Instigator.GetViewRotation()), Start, 3000.0000000);
	// End:0x96
	if(targ != none)
	{
		Target = targ;
		bIsAutoTracking = true;
	}
	//return;	
}

function ServerStopTracking()
{
	bAutoTrack = false;
	bIsAutoTracking = false;
	//return;	
}

simulated function bool CanTrack()
{
	return !IsInState('DualAction') && !IsInState('PendingDualAction');
	//return;	
}

simulated function TrackerTick(float dt)
{
	local Vector Dir, TBias;
	local Rotator TargetAngle;

	// End:0x1EE
	if(Target != none)
	{
		Dir = Normal(Target.Location - (Instigator.Location + Instigator.EyePosition()));
		// End:0x140
		if(int(Role) == int(ROLE_Authority))
		{
			TBias = vect(0.7000000, -0.7000000, 0.0000000);
			// End:0x97
			if(Instigator.Controller.Handedness < float(0))
			{
				TBias.Y *= float(-1);
			}
			// End:0x138
			if(((((bAutoTrack && Target != none) && CanTrack()) && Target.Health > 0) && FastTrace(Target.Location, Instigator.Location + Instigator.EyePosition())) && (Dir Dot (TBias >> Instigator.GetViewRotation())) > -0.2000000)
			{
				bIsAutoTracking = true;				
			}
			else
			{
				bIsAutoTracking = false;
			}
		}
		// End:0x1EE
		if(bIsAutoTracking)
		{
			TargetAngle = Rotator(Dir << Instigator.GetViewRotation());
			TrackerAim.Yaw += int(FClamp(float(TargetAngle.Yaw - TrackerAim.Yaw), -TrackSpeed * dt, TrackSpeed * dt));
			TrackerAim.Pitch += int(FClamp(float(TargetAngle.Pitch - TrackerAim.Pitch), -TrackSpeed * dt, TrackSpeed * dt));
			return;
		}
	}
	TrackerAim.Yaw -= int(FClamp(float(TrackerAim.Yaw), -TrackSpeed * dt, TrackSpeed * dt));
	TrackerAim.Pitch -= int(FClamp(float(TrackerAim.Pitch), -TrackSpeed * dt, TrackSpeed * dt));
	//return;	
}

simulated function Rotator GetPlayerAim(optional bool bFire)
{
	// End:0x24
	if(IsSlave())
	{
		return TrackerAim + Instigator.GetViewRotation();		
	}
	else
	{
		return super.GetPlayerAim();
	}
	//return;	
}

simulated function PreDrawFPWeapon()
{
	// End:0x16
	if(int(SightingState) != int(0))
	{
		PositionSights();
	}
	// End:0x5A
	if(IsSlave())
	{
		SetRotation(Instigator.GetViewRotation() + (TrackerAim * (DisplayFOV / Instigator.Controller.FovAngle)));
	}
	//return;	
}

simulated function PositionSights()
{
	local Vector SightPos, offset, NewLoc, OldLoc;
	local PlayerController PC;

	PC = PlayerController(InstigatorController);
	// End:0x3C
	if(SightBone != 'None')
	{
		SightPos = GetBoneCoords(SightBone).Origin - Location;
	}
	OldLoc = Instigator.Location + Instigator.CalcDrawOffset(self);
	offset = SightOffset;
	offset.X += (float(Normalize(Instigator.GetViewRotation()).Pitch) / float(8192));
	NewLoc = (PC.CalcViewLocation - (Instigator.WalkBob * (float(1) - (SightingPhase * (float(1) - SightBobScale))))) - (SightPos + ViewAlignedOffset(offset));
	// End:0x19C
	if(SightingPhase >= 1.0000000)
	{
		SetLocation(NewLoc);
		SetRotation(Instigator.GetViewRotation() + SightPivot);
		DisplayFOV = SightDisplayFOV;
		// End:0x158
		if(int(SightingState) == int(2))
		{
			AimComponent.OnADSViewStart();
			RcComponent.OnADSViewStart();
		}
		// End:0x199
		if(int(ZoomType) == int(0))
		{
			PC.DesiredFOV = Class'BCoreProV55.BUtil'.static.CalcZoomFOV(PC.DefaultFOV, SightZoomFactor);
		}		
	}
	else
	{
		// End:0x283
		if(SightingPhase <= 0.0000000)
		{
			SetLocation(OldLoc);
			SetRotation(Instigator.GetViewRotation());
			DisplayFOV = float(BaseDisplayFOV);
			PlayerController(InstigatorController).bZooming = false;
			// End:0x216
			if(int(SightingState) == int(1))
			{
				AimComponent.OnADSViewEnd();
				RcComponent.OnADSViewEnd();
			}
			// End:0x280
			if(int(ZoomType) == int(0))
			{
				PC.DesiredFOV = PC.DefaultFOV;
				PlayerController(InstigatorController).SetFOV(PlayerController(InstigatorController).DefaultFOV);
				PlayerController(InstigatorController).bZooming = false;
			}			
		}
		else
		{
			SetLocation(Class'BCoreProV55.BUtil'.static.VSmerp(SightingPhase, OldLoc, NewLoc));
			SetRotation(Instigator.GetViewRotation() + (SightPivot * SightingPhase));
			DisplayFOV = Smerp(SightingPhase, float(BaseDisplayFOV), SightDisplayFOV);
			AimComponent.UpdateADSTransition(SightingPhase);
			RcComponent.UpdateADSTransition(SightingPhase);
			// End:0x354
			if(int(ZoomType) == int(0))
			{
				PC.DesiredFOV = Class'BCoreProV55.BUtil'.static.CalcZoomFOV(PC.DefaultFOV, Lerp(SightingPhase, 1.0000000, SightZoomFactor));
			}
		}
	}
	// End:0x433
	if(bAdjustHands)
	{
		// End:0x39F
		if(SightingPhase <= 0.0000000)
		{
			SetBoneRotation('root', rot(0, 0, 0));
			SetBoneRotation('Wrist', rot(0, 0, 0));			
		}
		else
		{
			// End:0x3D1
			if(SightingPhase >= 1.0000000)
			{
				SetBoneRotation('root', RootAdjust);
				SetBoneRotation('Wrist', WristAdjust);				
			}
			else
			{
				SetBoneRotation('root', Class'BCoreProV55.BUtil'.static.RSmerp(SightingPhase, rot(0, 0, 0), RootAdjust));
				SetBoneRotation('Wrist', Class'BCoreProV55.BUtil'.static.RSmerp(SightingPhase, rot(0, 0, 0), WristAdjust));
			}
		}
	}
	//return;	
}

simulated function ApplyAimToView()
{
	// End:0x0B
	if(IsSlave())
	{
		return;
	}
	super.ApplyAimToView();
	//return;	
}

simulated function ReloadFinished()
{
	super.ReloadFinished();
	// End:0x6B
	if((((((Instigator != none) && AIController(Instigator.Controller) != none) && OtherGun == none) && PendingHandgun == none) && !bIsPendingHandGun) && int(ClientState) == int(4))
	{
		DualSelect();
	}
	// End:0x9B
	if((OtherGun != none) && OtherGun.IsInState('DualAction'))
	{
		OtherGun.RaiseHandGun();
	}
	//return;	
}

simulated function bool CanReload()
{
	// End:0x96
	if(((((bPreventReload || int(ReloadState) != int(0)) || IsInState('DualAction')) || (OtherGun != none) && (int(OtherGun.ReloadState) != int(0)) || int(OtherGun.MeleeState) != int(0)) || MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		return false;
	}
	return true;
	//return;	
}

simulated exec function Reload(optional byte i)
{
	// End:0x9C
	if(bUseDualReload && OtherGun != none)
	{
		// End:0x71
		if(IsMaster() && ((!CanReload() || !OtherGun.CanReload()) || int(ClientState) != int(4)) || int(OtherGun.ClientState) != int(4))
		{
			return;
		}
		super.Reload(i);
		// End:0x99
		if(IsMaster())
		{
			OtherGun.Reload(i);
		}		
	}
	else
	{
		// End:0xC6
		if((bIsPendingHandGun || PendingHandgun != none) || int(ClientState) != int(4))
		{
			return;
		}
		// End:0xDF
		if(OtherGun == none)
		{
			super.Reload(i);			
		}
		else
		{
			// End:0xFD
			if(int(OtherGun.ClientState) != int(4))
			{
				return;				
			}
			else
			{
				// End:0x180
				if((CanReload()) && (IsSlave() || (float(MagAmmo) / float(WeaponParams.MagAmmo)) <= (float(OtherGun.MagAmmo) / float(OtherGun.WeaponParams.MagAmmo))) || !OtherGun.CanReload())
				{
					super.Reload(i);					
				}
				else
				{
					// End:0x19D
					if(IsMaster())
					{
						OtherGun.Reload(i);
					}
				}
			}
		}
	}
	//return;	
}

function ServerStartReload(optional byte i)
{
	// End:0x2C
	if(IsSlave() && OtherGun.IsFiring())
	{
		OtherGun.ImmediateStopFire();
	}
	super.ServerStartReload(i);
	//return;	
}

simulated function CommonStartReload(optional byte i)
{
	// End:0x39
	if(((OtherGun == none) || OtherGun.IsInState('Lowered')) || bUseDualReload)
	{
		super.CommonStartReload(i);
		return;
	}
	GotoState('PendingReloading');
	//return;	
}

simulated function PlayReload()
{
	// End:0x89
	if(((bUseDualReload && OtherGun != none) && HasAnim(DualReloadAnim)) && HasAnim(DualReloadEmptyAnim))
	{
		// End:0x44
		if(IsMaster())
		{
			SetTimer(DualReloadAnimDelay, false);
			return;
		}
		// End:0x6C
		if(MagAmmo < 1)
		{
			SafePlayAnim(DualReloadEmptyAnim, DualReloadAnimRate,, 0, "RELOAD");			
		}
		else
		{
			SafePlayAnim(DualReloadAnim, DualReloadAnimRate,, 0, "RELOAD");
		}		
	}
	else
	{
		super.PlayReload();
	}
	//return;	
}

simulated exec function CockGun(optional byte Type)
{
	// End:0x49
	if(((((int(ReloadState) != int(0)) || bPreventReload) || int(ClientState) != int(4)) || IsInState('DualAction')) || IsInState('PendingDualAction'))
	{
		return;
	}
	ServerCockGun(Type);
	CommonCockGun(Type);
	//return;	
}

simulated function CommonCockGun(optional byte Type)
{
	// End:0x0B
	if(bIsPendingHandGun)
	{
		return;
	}
	// End:0x18
	if(PendingHandgun != none)
	{
		return;
	}
	// End:0x30
	if(OtherGun == none)
	{
		super.CommonCockGun(Type);
		return;
	}
	// End:0x51
	if(OtherGun.IsInState('Lowered'))
	{
		super.CommonCockGun(Type);
		return;
	}
	// End:0x5C
	if(bNonCocking)
	{
		return;
	}
	GotoState('PendingCocking');
	//return;	
}

simulated event AnimEnd(int Channel)
{
	// End:0x18
	if(OtherGun == none)
	{
		super.AnimEnd(Channel);
		return;
	}
	// End:0x25
	if(IsInState('DualAction'))
	{
		return;
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	local bool bCenteredHand;

	// End:0x18
	if(OtherGun == none)
	{
		super.RenderOverlays(C);
		return;
	}
	// End:0x5C
	if(Instigator.Controller.Handedness == float(0))
	{
		bCenteredHand = true;
		Instigator.Controller.Handedness = 1.0000000;
	}
	// End:0xB9
	if(IsMaster())
	{
		Instigator.Controller.Handedness *= float(-1);
		OtherGun.RenderOverlays(C);
		Instigator.Controller.Handedness *= float(-1);
	}
	// End:0xD1
	if(!IsInState('Lowered'))
	{
		super.RenderOverlays(C);
	}
	// End:0xF7
	if(bCenteredHand)
	{
		Instigator.Controller.Handedness = 0.0000000;
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local int M;

	super.WeaponTick(dt);
	// End:0x2B
	if(IsMaster())
	{
		OtherGun.WeaponTick(dt);		
	}
	else
	{
		// End:0x1FF
		if(IsSlave())
		{
			M = 0;
			J0x3B:

			// End:0x1FF [Loop If]
			if(M < 2)
			{
				// End:0x14B
				if(FireMode[M].bIsFiring)
				{
					FireMode[M].HoldTime += dt;
					// End:0xD2
					if(!FireMode[M].bFireOnRelease && FireMode[M].NextFireTime <= Level.TimeSeconds)
					{
						FireMode[M].ModeDoFire();
					}
					// End:0x14B
					if(Instigator.IsLocallyControlled() && ((M == 0) && int(Instigator.Controller.bFire) == 0) || (M == 1) && int(Instigator.Controller.bAltFire) == 0)
					{
						ClientStopFire(M);
					}
				}
				// End:0x1F5
				if(FireMode[M].NextTimerPop <= Level.TimeSeconds)
				{
					FireMode[M].Timer();
					// End:0x1DB
					if(FireMode[M].bTimerLoop)
					{
						FireMode[M].NextTimerPop = Level.TimeSeconds + FireMode[M].TimerInterval;
						// [Explicit Continue]
						goto J0x1F5;
					}
					FireMode[M].NextTimerPop = 9999999.0000000;
				}
				J0x1F5:

				M++;
				// [Loop Continue]
				goto J0x3B;
			}
		}
	}
	//return;	
}

simulated event StopFire(int Mode)
{
	// End:0x5A
	if(AIController(Instigator.Controller) != none)
	{
		// End:0x5A
		if((IsMaster() && OtherGun.IsFiring()) && MasterCanSendMode(Mode))
		{
			OtherGun.StopFire(Mode);
		}
	}
	// End:0x89
	if(FireMode[Mode].bIsFiring)
	{
		FireMode[Mode].bInstantStop = true;
	}
	// End:0xCC
	if(Instigator.IsLocallyControlled() && !FireMode[Mode].bFireOnRelease)
	{
		FireMode[Mode].PlayFireEnd();
	}
	FireMode[Mode].bIsFiring = false;
	FireMode[Mode].StopFiring();
	// End:0x130
	if(FireMode[Mode].bFireOnRelease && IsSlave())
	{
		FireMode[Mode].ModeDoFire();
	}
	// End:0x155
	if(!FireMode[Mode].bFireOnRelease)
	{
		ZeroFlashCount(Mode);
	}
	//return;	
}

simulated function EmptyFire(byte Mode)
{
	// End:0x19
	if(OtherGun == none)
	{
		super.EmptyFire(Mode);		
	}
	else
	{
		// End:0xA5
		if(((((bNeedReload && int(ClientState) == int(4)) && FireCount < 1) && OtherGun.FireCount < 1) && Instigator.IsLocallyControlled()) && OtherGun.bNeedReload || !OtherGun.HasAmmoLoaded(Mode))
		{
			ServerStartReload(Mode);
		}
	}
	//return;	
}

simulated function FirePressed(float F)
{
	// End:0x30
	if(IsInState('DualAction') || (OtherGun != none) && OtherGun.IsInState('DualAction'))
	{
		return;
	}
	// End:0x74
	if((!HasAmmo() && !IsSlave()) && (OtherGun == none) || !OtherGun.HasAmmo())
	{
		OutOfAmmo();		
	}
	else
	{
		// End:0xDB
		if(bCanSkipReload && ((int(ReloadState) == int(5)) || int(ReloadState) == int(6)) || int(ReloadState) == int(1))
		{
			ServerSkipReload();
			// End:0xD8
			if(int(Level.NetMode) == int(NM_Client))
			{
				SkipReload();
			}			
		}
		else
		{
			// End:0x1A1
			if(((((((int(ReloadState) == int(0)) && !bPreventReload) && bNeedCock) && MagAmmo > 0) && !IsFiring()) && Level.TimeSeconds > FireMode[0].NextFireTime) && ((OtherGun == none) || OtherGun.bNeedCock) || !OtherGun.HasAmmo())
			{
				CommonCockGun();
				// End:0x19E
				if(int(Level.NetMode) == int(NM_Client))
				{
					ServerCockGun();
				}				
			}
			else
			{
				// End:0x1BE
				if(IsMaster())
				{
					OtherGun.FirePressed(F);
				}
			}
		}
	}
	//return;	
}

simulated function bool CheckWeaponMode(int Mode)
{
	// End:0x1A
	if(IsInState('DualAction') || IsInState('PendingDualAction'))
	{
		return false;
	}
	// End:0x36
	if(CanSynch(byte(Mode)))
	{
		return super.CheckWeaponMode(Mode);
	}
	// End:0x7E
	if((WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_FullAuto") || WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_None")
	{
		return true;
	}
	// End:0x148
	if((float(FireCount) >= WeaponModes[int(CurrentWeaponMode)].Value) && (((!IsSlave() || WeaponModes[int(CurrentWeaponMode)].ModeID != "WM_SemiAuto") || OtherGun.WeaponModes[int(OtherGun.CurrentWeaponMode)].ModeID != "WM_SemiAuto") || int(OtherGun.HandgunGroup) == int(HandgunGroup)) || LastFireTime > (Level.TimeSeconds - SingleHeldRate))
	{
		return false;
	}
	// End:0x1E7
	if((OtherGun != none) && CanAlternate(Mode))
	{
		// End:0x1E5
		if(((((!OtherGun.HasAmmoLoaded(byte(Mode)) || OtherGun.bNeedCock) || OtherGun.bNeedReload) || LastFireTime <= OtherGun.LastFireTime) && FireCount < 1) && OtherGun.FireCount < 1)
		{
			return true;
		}
		return false;
	}
	return true;
	//return;	
}

simulated function bool SlaveCanUseMode(int Mode)
{
	return true;
	//return;	
}

simulated function bool MasterCanSendMode(int Mode)
{
	return true;
	//return;	
}

simulated event ClientStartFire(int Mode)
{
	// End:0x1D
	if(IsSlave() && !SlaveCanUseMode(Mode))
	{
		return;
	}
	super(Weapon).ClientStartFire(Mode);
	// End:0x6B
	if((IsMaster() && !OtherGun.IsFiring()) && MasterCanSendMode(Mode))
	{
		OtherGun.ClientStartFire(Mode);
	}
	//return;	
}

simulated event ClientStopFire(int Mode)
{
	// End:0x1D
	if(IsSlave() && !SlaveCanUseMode(Mode))
	{
		return;
	}
	super(Weapon).ClientStopFire(Mode);
	//return;	
}

simulated function bool ReadyToFire(int Mode)
{
	local int alt;

	// End:0x1A
	if(IsInState('DualAction') || IsInState('PendingDualAction'))
	{
		return false;
	}
	// End:0x2F
	if(Mode == 0)
	{
		alt = 1;		
	}
	else
	{
		alt = 0;
	}
	// End:0x49
	if(FireMode[Mode] == none)
	{
		return false;
	}
	// End:0x108
	if((((((FireMode[alt] != none) && FireMode[alt] != FireMode[Mode]) && FireMode[alt].bModeExclusive) && FireMode[alt].bIsFiring) || !FireMode[Mode].AllowFire()) || FireMode[Mode].NextFireTime > (Level.TimeSeconds + FireMode[Mode].PreFireTime))
	{
		return false;
	}
	return true;
	//return;	
}

simulated function bool CanAlternate(int Mode)
{
	return ((int(OtherGun.HandgunGroup) == int(HandgunGroup)) && WeaponModes[int(CurrentWeaponMode)].ModeID ~= "WM_SemiAuto") && OtherGun.WeaponModes[int(OtherGun.CurrentWeaponMode)].ModeID ~= "WM_SemiAuto";
	//return;	
}

simulated function bool CanSynch(byte Mode)
{
	return false;
	//return;	
}

simulated function ForceFire(int Mode)
{
	//return;	
}

simulated function bool StartFire(int Mode)
{
	local int alt;

	// End:0x79
	if(AIController(Instigator.Controller) != none)
	{
		// End:0x36
		if(IsSlave() && !SlaveCanUseMode(Mode))
		{
			return false;
		}
		// End:0x79
		if((IsMaster() && !OtherGun.IsFiring()) && MasterCanSendMode(Mode))
		{
			OtherGun.StartFire(Mode);
		}
	}
	// End:0x8B
	if(!ReadyToFire(Mode))
	{
		return false;
	}
	// End:0xA0
	if(Mode == 0)
	{
		alt = 1;		
	}
	else
	{
		alt = 0;
	}
	FireMode[Mode].bIsFiring = true;
	FireMode[Mode].NextFireTime = Level.TimeSeconds + FireMode[Mode].PreFireTime;
	// End:0x161
	if((FireMode[alt] != none) && FireMode[alt].bModeExclusive)
	{
		FireMode[Mode].NextFireTime = FMax(FireMode[Mode].NextFireTime, FireMode[alt].NextFireTime);
	}
	// End:0x1D6
	if(Instigator.IsLocallyControlled())
	{
		// End:0x1C0
		if((FireMode[Mode].PreFireTime > 0.0000000) || FireMode[Mode].bFireOnRelease)
		{
			FireMode[Mode].PlayPreFire();
		}
		FireMode[Mode].FireCount = 0;
	}
	return true;
	//return;	
}

event ServerStartFire(byte Mode)
{
	// End:0xA3
	if(((Instigator != none) && Instigator.Weapon != self) && (BallisticHandgun(Instigator.Weapon) == none) || BallisticHandgun(Instigator.Weapon).OtherGun != self)
	{
		// End:0x88
		if(Instigator.Weapon == none)
		{
			Instigator.ServerChangedWeapon(none, self);			
		}
		else
		{
			Instigator.Weapon.SynchronizeWeapon(self);
		}
		return;
	}
	// End:0x137
	if((FireMode[int(Mode)].NextFireTime <= (Level.TimeSeconds + FireMode[int(Mode)].PreFireTime)) && StartFire(int(Mode)))
	{
		FireMode[int(Mode)].ServerStartFireTime = Level.TimeSeconds;
		FireMode[int(Mode)].bServerDelayStartFire = false;		
	}
	else
	{
		// End:0x16D
		if(FireMode[int(Mode)].AllowFire())
		{
			FireMode[int(Mode)].bServerDelayStartFire = true;			
		}
		else
		{
			ClientForceAmmoUpdate(int(Mode), AmmoAmount(int(Mode)));
		}
	}
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x1F
	if(super.CanAttack(Other) && !IsInState('DualAction'))
	{
		return true;
	}
	// End:0x3D
	if(IsMaster())
	{
		return OtherGun.CanAttack(Other);
	}
	return false;
	//return;	
}

function float GetAIRating()
{
	// End:0x0F
	if(IsSlave())
	{
		return 0.0000000;
	}
	return super.GetAIRating();
	//return;	
}

simulated event Timer()
{
	local int Mode;

	// End:0x94
	if((((((int(ReloadState) == int(4)) || int(ReloadState) == int(1)) && IsMaster()) && bUseDualReload) && HasAnim(DualReloadAnim)) && HasAnim(DualReloadEmptyAnim))
	{
		// End:0x7A
		if(MagAmmo < 1)
		{
			SafePlayAnim(DualReloadEmptyAnim, DualReloadAnimRate,, 0, "RELOAD");			
		}
		else
		{
			SafePlayAnim(DualReloadAnim, DualReloadAnimRate,, 0, "RELOAD");
		}
	}
	// End:0x10D
	if((((((Instigator != none) && AIController(Instigator.Controller) != none) && int(ClientState) == int(2)) && OtherGun == none) && PendingHandgun == none) && !bIsPendingHandGun)
	{
		super.Timer();
		// End:0x10A
		if(!bNeedCock)
		{
			DualSelect();
		}		
	}
	else
	{
		// End:0x151
		if((int(ClientState) == int(3)) && IsMaster())
		{
			SetDualMode(false);
			// End:0x14E
			if(AIController(Instigator.Controller) != none)
			{
				super.Timer();
			}			
		}
		else
		{
			// End:0x22C
			if((int(ClientState) == int(3)) && bSlavePutDown)
			{
				SetDualMode(false);
				// End:0x1CF
				if(OtherGun != none)
				{
					// End:0x1B5
					if(Instigator.IsLocallyControlled() && OtherGun.PendingHandgun == none)
					{
						OtherGun.ServerLeaveDualMode();
					}
					// End:0x1CF
					if(OtherGun != none)
					{
						OtherGun.SlavePutDown();
					}
				}
				OtherGun = none;
				bSlavePutDown = false;
				ClientState = 1;
				Mode = 0;
				J0x1ED:

				// End:0x229 [Loop If]
				if(Mode < 2)
				{
					// End:0x21F
					if(FireMode[Mode] != none)
					{
						FireMode[Mode].DestroyEffects();
					}
					Mode++;
					// [Loop Continue]
					goto J0x1ED;
				}				
			}
			else
			{
				super.Timer();
			}
		}
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	local Inventory Inv;

	super.BringUp(PrevWeapon);
	GotoState('None');
	SetBoneScale(8, 1.0000000, SupportHandBone);
	bSlavePutDown = false;
	bIsPendingHandGun = false;
	// End:0x157
	if(Level.TimeSeconds > (CreationTime + float(1)))
	{
		// End:0x157
		if((((OtherGun == none) && PendingHandgun == none) && !bDualBlocked) && Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena())
		{
			// End:0xA3
			if(LastSlave != none)
			{
				PendingHandgun = LastSlave;				
			}
			else
			{
				Inv = Instigator.Inventory;
				J0xB7:

				// End:0x157 [Loop If]
				if(Inv != none)
				{
					// End:0x140
					if(((Inv != self) && Inv.Class == Class) && !BallisticHandgun(Inv).bDualBlocked)
					{
						// End:0x140
						if(Level.TimeSeconds > (BallisticHandgun(Inv).CreationTime + float(1)))
						{
							PendingHandgun = BallisticHandgun(Inv);
							// [Explicit Break]
							goto J0x157;
						}
					}
					Inv = Inv.Inventory;
					// [Loop Continue]
					goto J0xB7;
				}
			}
		}
	}
	J0x157:

	// End:0x1EA
	if(PendingHandgun != none)
	{
		bIsMaster = true;
		OtherGun = PendingHandgun;
		OtherGun.OtherGun = self;
		OtherGun.bIsMaster = false;
		OtherGun.PendingHandgun = none;
		OtherGun.AttachToPawn(Instigator);
		OtherGun.BringUp();
		SetDualMode(true);
		OtherGun.SetDualMode(true);
		PendingHandgun = none;		
	}
	else
	{
		bIsMaster = false;
		// End:0x21A
		if((OtherGun != none) && !OtherGun.bIsMaster)
		{
			OtherGun = none;
		}
	}
	// End:0x240
	if(IsSlave())
	{
		hand = OtherGun.hand * float(-1);
	}
	//return;	
}

simulated function bool PutDown()
{
	local int Mode;

	// End:0x1F7
	if((int(ClientState) == int(2)) || int(ClientState) == int(4))
	{
		// End:0xC6
		if((!IsSlave() && Instigator.PendingWeapon != none) && !Instigator.PendingWeapon.bForceSwitch)
		{
			Mode = 0;
			J0x69:

			// End:0xC6 [Loop If]
			if(Mode < 2)
			{
				// End:0xBC
				if(((FireMode[Mode] != none) && FireMode[Mode].bFireOnRelease) && FireMode[Mode].bIsFiring)
				{
					return false;
				}
				Mode++;
				// [Loop Continue]
				goto J0x69;
			}
		}
		// End:0x15A
		if(Instigator.IsLocallyControlled())
		{
			Mode = 0;
			J0xDF:

			// End:0x12B [Loop If]
			if(Mode < 2)
			{
				// End:0x121
				if((FireMode[Mode] != none) && FireMode[Mode].bIsFiring)
				{
					ClientStopFire(Mode);
				}
				Mode++;
				// [Loop Continue]
				goto J0xDF;
			}
			// End:0x15A
			if((int(ClientState) != int(2)) && HasAnim(PutDownAnim))
			{
				PlayAnim(PutDownAnim, PutDownAnimRate, 0.0000000);
			}
		}
		ClientState = 3;
		// End:0x172
		if(bScopeView)
		{
			StopScopeView(true);
		}
		// End:0x1C1
		if(int(ReloadState) != int(0))
		{
			// End:0x1A1
			if(int(Level.NetMode) == int(NM_Client))
			{
				ServerStopReload();
			}
			// End:0x1B9
			if(int(Role) == int(ROLE_Authority))
			{
				bServerReloading = false;
			}
			ReloadState = 0;
		}
		bPendingSightUp = false;
		// End:0x1EE
		if(PutDownSound.Sound != none)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, PutDownSound);
		}
		SetTimer(PutDownTime, false);
	}
	// End:0x20B
	if(IsSlave())
	{
		bSlavePutDown = true;		
	}
	else
	{
		// End:0x2D8
		if((((int(CrosshairMode) != int(2)) && (Instigator.PendingWeapon == none) || BallisticWeapon(Instigator.PendingWeapon) == none) && PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).myHUD != none)
		{
			PlayerController(Instigator.Controller).myHUD.bCrosshairShow = PlayerController(Instigator.Controller).myHUD.default.bCrosshairShow;
		}
	}
	// End:0x30F
	if(IsMaster())
	{
		LastMasterTime = Level.TimeSeconds;
		LastSlave = OtherGun;
		OtherGun.PutDown();
	}
	Mode = 0;
	J0x316:

	// End:0x36E [Loop If]
	if(Mode < 2)
	{
		// End:0x336
		if(FireMode[Mode] == none)
		{
			// [Explicit Continue]
			goto J0x364;
		}
		FireMode[Mode].bServerDelayStartFire = false;
		FireMode[Mode].bServerDelayStopFire = false;
		J0x364:

		Mode++;
		// [Loop Continue]
		goto J0x316;
	}
	Instigator.AmbientSound = none;
	AmbientSound = none;
	OldWeapon = none;
	return true;
	//return;	
}

function DetachFromPawn(Pawn P)
{
	super(Weapon).DetachFromPawn(P);
	// End:0x28
	if(IsMaster())
	{
		OtherGun.DetachFromPawn(P);
	}
	// End:0x43
	if(!Instigator.IsLocallyControlled())
	{
		SetDualMode(false);
	}
	bIsMaster = false;
	OtherGun = none;
	//return;	
}

simulated function Reselect()
{
	// End:0x34
	if(IsMaster())
	{
		OtherGun.PutDown();
		LeaveDualMode();
		// End:0x34
		if(int(Role) < int(ROLE_Authority))
		{
			ServerLeaveDualMode();
		}
	}
	//return;	
}

function ServerLeaveDualMode()
{
	LeaveDualMode();
	//return;	
}

simulated function LeaveDualMode()
{
	// End:0x54
	if(OtherGun != none)
	{
		LastMasterTime = Level.TimeSeconds;
		LastSlave = OtherGun;
		OtherGun.DetachFromPawn(Instigator);
		bIsMaster = false;
		OtherGun = none;
		SetDualMode(false);
	}
	//return;	
}

simulated function SlavePutDown()
{
	// End:0x20
	if(PendingHandgun != none)
	{
		SetDualGun(PendingHandgun);
		PendingHandgun = none;		
	}
	else
	{
		bIsMaster = false;
		SetDualMode(false);
		OtherGun = none;
	}
	//return;	
}

final simulated function SetDualMode(bool bDualMode)
{
	// End:0x69
	if(bDualMode)
	{
		// End:0x33
		if(Instigator.IsLocallyControlled() && int(SightingState) == int(3))
		{
			StopScopeView();
		}
		SetBoneScale(8, 0.0000000, SupportHandBone);
		// End:0x66
		if(AIController(Instigator.Controller) == none)
		{
			bUseSpecialAim = true;
		}		
	}
	else
	{
		SetBoneScale(8, 1.0000000, SupportHandBone);
		bUseSpecialAim = false;
	}
	OnDualModeChanged(bDualMode);
	//return;	
}

simulated function OnDualModeChanged(bool bDualMode)
{
	//return;	
}

function ServerSwap(BallisticHandgun Other)
{
	// End:0x0D
	if(Other == none)
	{
		return;
	}
	DetachFromPawn(Instigator);
	Other.PendingHandgun = self;
	Other.LowerHandGun();
	Other.SetDualMode(false);
	Other.DetachFromPawn(Instigator);
	Other.OtherGun = none;
	OtherGun = none;
	//return;	
}

function SetDualGun(BallisticHandgun NewSlave)
{
	// End:0x0D
	if(NewSlave == none)
	{
		return;
	}
	// End:0x2C
	if(OtherGun != none)
	{
		OtherGun.DetachFromPawn(Instigator);
	}
	CommonDualSelect(NewSlave);
	ClientDualSelect(NewSlave);
	//return;	
}

simulated function ClientDualSelect(BallisticHandgun NewSlave)
{
	// End:0x24
	if(int(Level.NetMode) == int(NM_Client))
	{
		CommonDualSelect(NewSlave);
	}
	//return;	
}

simulated function CommonDualSelect(BallisticHandgun NewSlave)
{
	bIsMaster = true;
	// End:0x1A
	if(OtherGun == none)
	{
		SetDualMode(true);
	}
	OtherGun = NewSlave;
	OtherGun.OtherGun = self;
	OtherGun.bIsMaster = false;
	// End:0x6A
	if(int(Role) == int(ROLE_Authority))
	{
		OtherGun.AttachToPawn(Instigator);
	}
	OtherGun.BringUp();
	OtherGun.SetDualMode(true);
	//return;	
}

simulated function bool PreventSwap()
{
	// End:0x42
	if(((((int(ReloadState) != int(0)) || IsFiring()) || IsInState('DualAction')) || PendingHandgun != none) || bIsPendingHandGun)
	{
		return true;
	}
	return false;
	//return;	
}

simulated exec function DualSelect(optional Class<Weapon> NewWeaponClass)
{
	local BallisticHandgun Best;
	local Inventory Inv;

	// End:0x0B
	if(bDualBlocked)
	{
		return;
	}
	// End:0x87
	if(((((((int(ClientState) != int(4)) || int(ReloadState) != int(0)) || IsFiring()) || bScopeView) || bScopeHeld) || bScopeDesired) || (OtherGun != none) && (PreventSwap()) || OtherGun.PreventSwap())
	{
		return;
	}
	// End:0x11E
	if(OtherGun != none)
	{
		// End:0xAD
		if(int(Role) < int(ROLE_Authority))
		{
			ServerSwap(OtherGun);
		}
		Instigator.PendingWeapon = OtherGun;
		PendingHandgun = none;
		bIsPendingHandGun = true;
		OtherGun.PendingHandgun = self;
		OtherGun.LowerHandGun();
		OtherGun.SetDualMode(false);
		OtherGun.OtherGun = none;
		OtherGun = none;
		PutDown();
		return;
	}
	Inv = Instigator.Inventory;
	J0x132:

	// End:0x277 [Loop If]
	if(Inv != none)
	{
		// End:0x260
		if(((Inv != self) && ClassIsChildOf(Inv.Class, Class'BCoreProV55.BallisticHandgun')) && !BallisticHandgun(Inv).bDualBlocked)
		{
			// End:0x1C6
			if((Inv.Class == Class) && BallisticHandgun(Inv).HasAmmoLoaded(byte(255)))
			{
				Best = BallisticHandgun(Inv);
				// [Explicit Break]
				goto J0x277;
			}
			// End:0x260
			if((bDualMixing && BallisticHandgun(Inv).bDualMixing) && ((Best == none) || !Best.HasAmmoLoaded(byte(255))) || (int(Best.HandgunGroup) != int(HandgunGroup)) && int(BallisticHandgun(Inv).HandgunGroup) == int(HandgunGroup))
			{
				Best = BallisticHandgun(Inv);
			}
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x132;
	}
	J0x277:

	// End:0x28D
	if(Best != none)
	{
		SetDualGun(Best);
	}
	//return;	
}

simulated function DoQuickDraw()
{
	local BallisticHandgun Best;
	local Inventory Inv;

	// End:0x19
	if(LastSlave != none)
	{
		Best = LastSlave;		
	}
	else
	{
		Inv = Instigator.Inventory;
		J0x2D:

		// End:0x16A [Loop If]
		if(Inv != none)
		{
			// End:0x153
			if((((Inv != self) && !BallisticHandgun(Inv).bDualBlocked) && BallisticHandgun(Inv).bDualMixing) && ClassIsChildOf(Inv.Class, Class'BCoreProV55.BallisticHandgun'))
			{
				// End:0xDD
				if((Inv.Class == Class) && BallisticHandgun(Inv).HasAmmoLoaded(byte(255)))
				{
					Best = BallisticHandgun(Inv);
					// [Explicit Break]
					goto J0x16A;					
				}
				else
				{
					// End:0x153
					if(((Best == none) || !Best.HasAmmoLoaded(byte(255))) || (int(Best.HandgunGroup) != int(HandgunGroup)) && int(BallisticHandgun(Inv).HandgunGroup) == int(HandgunGroup))
					{
						Best = BallisticHandgun(Inv);
					}
				}
			}
			Inv = Inv.Inventory;
			// [Loop Continue]
			goto J0x2D;
		}
	}
	J0x16A:

	// End:0x185
	if(int(Role) < int(ROLE_Authority))
	{
		ServerDoQuickDraw(Best);
	}
	Instigator.PendingWeapon = self;
	PendingHandgun = Best;
	// End:0x1CF
	if(Instigator.Weapon != none)
	{
		Instigator.Weapon.PutDown();		
	}
	else
	{
		Instigator.ChangedWeapon();
	}
	//return;	
}

function ServerDoQuickDraw(BallisticHandgun Other)
{
	PendingHandgun = Other;
	//return;	
}

simulated function BallisticWeapon FindQuickDraw(BallisticWeapon CurrentChoice, float ChoiceRank)
{
	local Inventory Inv;
	local BallisticWeapon Best;

	// End:0x81
	if((((CurrentChoice == none) || BallisticHandgun(CurrentChoice) == none) || (LastSlave != none) && BallisticHandgun(CurrentChoice).LastSlave == none) || BallisticHandgun(CurrentChoice).LastMasterTime < LastMasterTime)
	{
		// End:0x81
		if(!bDualBlocked)
		{
			CurrentChoice = self;
			ChoiceRank = 1.0000000;
		}
	}
	Inv = Inventory;
	J0x8C:

	// End:0xE5 [Loop If]
	if(Inv != none)
	{
		// End:0xCE
		if(BallisticWeapon(Inv) != none)
		{
			Best = BallisticWeapon(Inv).FindQuickDraw(CurrentChoice, ChoiceRank);
			// [Explicit Break]
			goto J0xE5;
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x8C;
	}
	J0xE5:

	// End:0xF9
	if(Best == none)
	{
		return CurrentChoice;		
	}
	else
	{
		return Best;
	}
	//return;	
}

simulated function bool AllowWeapPrevUI()
{
	// End:0x0D
	if(OtherGun != none)
	{
		return false;
	}
	return super.AllowWeapPrevUI();
	//return;	
}

simulated function bool AllowWeapNextUI()
{
	// End:0x0D
	if(OtherGun != none)
	{
		return false;
	}
	return super.AllowWeapNextUI();
	//return;	
}

simulated function Weapon PrevWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	local BallisticHandgun Best;
	local Inventory Inv;

	// End:0x23
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArenaOrTactical())
	{
		return super.PrevWeapon(CurrentChoice, CurrentWeapon);
	}
	// End:0x60
	if(IsMaster() && !OtherGun.bDualMixing || !bDualMixing)
	{
		return super.PrevWeapon(CurrentChoice, CurrentWeapon);
	}
	// End:0x19A
	if((CurrentWeapon == self) && IsMaster())
	{
		// End:0x95
		if((int(ReloadState) != int(0)) || IsInState('DualAction'))
		{
			return none;
		}
		Inv = Instigator.Inventory;
		J0xA9:

		// End:0x155 [Loop If]
		if(Inv != none)
		{
			// End:0x13E
			if((((Inv != self) && !BallisticHandgun(Inv).bDualBlocked) && BallisticHandgun(Inv).bDualMixing) && ClassIsChildOf(Inv.Class, Class'BCoreProV55.BallisticHandgun'))
			{
				// End:0x12E
				if(Inv == OtherGun)
				{
					// End:0x12B
					if(Best != none)
					{
						// [Explicit Break]
						goto J0x155;
					}					
				}
				else
				{
					Best = BallisticHandgun(Inv);
				}
			}
			Inv = Inv.Inventory;
			// [Loop Continue]
			goto J0xA9;
		}
		J0x155:

		// End:0x19A
		if(Best != none)
		{
			// End:0x171
			if(Best == OtherGun)
			{
				return none;
			}
			PendingHandgun = Best;
			// End:0x193
			if(OtherGun.PutDown())
			{
				return none;				
			}
			else
			{
				PendingHandgun = none;
			}
		}
	}
	return super.PrevWeapon(CurrentChoice, CurrentWeapon);
	//return;	
}

simulated function Weapon NextWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	local BallisticHandgun Best;
	local bool bFoundOtherOne;
	local Inventory Inv;

	// End:0x23
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArenaOrTactical())
	{
		return super.NextWeapon(CurrentChoice, CurrentWeapon);
	}
	// End:0x60
	if(IsMaster() && !OtherGun.bDualMixing || !bDualMixing)
	{
		return super.NextWeapon(CurrentChoice, CurrentWeapon);
	}
	// End:0x1BE
	if((CurrentWeapon == self) && IsMaster())
	{
		// End:0x95
		if((int(ReloadState) != int(0)) || IsInState('DualAction'))
		{
			return none;
		}
		Inv = Instigator.Inventory;
		J0xA9:

		// End:0x179 [Loop If]
		if(Inv != none)
		{
			// End:0x162
			if((((Inv != self) && !BallisticHandgun(Inv).bDualBlocked) && BallisticHandgun(Inv).bDualMixing) && ClassIsChildOf(Inv.Class, Class'BCoreProV55.BallisticHandgun'))
			{
				// End:0x12D
				if(bFoundOtherOne)
				{
					Best = BallisticHandgun(Inv);
					// [Explicit Break]
					goto J0x179;					
				}
				else
				{
					// End:0x147
					if(Inv == OtherGun)
					{
						bFoundOtherOne = true;						
					}
					else
					{
						// End:0x162
						if(Best == none)
						{
							Best = BallisticHandgun(Inv);
						}
					}
				}
			}
			Inv = Inv.Inventory;
			// [Loop Continue]
			goto J0xA9;
		}
		J0x179:

		// End:0x1BE
		if(Best != none)
		{
			// End:0x195
			if(Best == OtherGun)
			{
				return none;
			}
			PendingHandgun = Best;
			// End:0x1B7
			if(OtherGun.PutDown())
			{
				return none;				
			}
			else
			{
				PendingHandgun = none;
			}
		}
	}
	return super.NextWeapon(CurrentChoice, CurrentWeapon);
	//return;	
}

function AttachToPawn(Pawn P)
{
	local name BoneName;

	Instigator = P;
	// End:0x41
	if(ThirdPersonActor == none)
	{
		ThirdPersonActor = Spawn(AttachmentClass, Owner);
		InventoryAttachment(ThirdPersonActor).InitFor(self);		
	}
	else
	{
		InventoryAttachment(ThirdPersonActor).InitFor(self);
		ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
	}
	// End:0xB6
	if(IsSlave())
	{
		BoneName = P.GetOffhandBoneFor(self);
		ThirdPersonActor.SetRelativeRotation(rot(0, 32768, 0));		
	}
	else
	{
		BoneName = P.GetWeaponBoneFor(self);
	}
	// End:0x14E
	if(OtherGun != none)
	{
		// End:0x10E
		if(HandgunAttachment(ThirdPersonActor) != none)
		{
			HandgunAttachment(ThirdPersonActor).OtherGun = HandgunAttachment(OtherGun.ThirdPersonActor);
		}
		// End:0x14E
		if(HandgunAttachment(OtherGun.ThirdPersonActor) != none)
		{
			HandgunAttachment(OtherGun.ThirdPersonActor).OtherGun = HandgunAttachment(ThirdPersonActor);
		}
	}
	// End:0x18B
	if(BoneName == 'None')
	{
		ThirdPersonActor.SetLocation(P.Location);
		ThirdPersonActor.SetBase(P);		
	}
	else
	{
		P.AttachToBone(ThirdPersonActor, BoneName);
	}
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M, Count;
	local Weapon W;
	local bool bPossiblySwitch, bJustSpawned;
	local Inventory Inv;

	Instigator = Other;
	bJustSpawned = true;
	Inv = Instigator.Inventory;
	J0x27:

	// End:0xA2 [Loop If]
	if((Inv != none) && Count < 1000)
	{
		// End:0x84
		if(Inv.Class == Class)
		{
			// End:0x79
			if(W == none)
			{
				W = Weapon(Inv);				
			}
			else
			{
				bJustSpawned = false;
				// [Explicit Break]
				goto J0xA2;
			}
		}
		Count++;
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x27;
	}
	J0xA2:

	// End:0x1D1
	if(bJustSpawned || W == none)
	{
		super(Inventory).GiveTo(Other);
		bPossiblySwitch = true;
		W = self;
		// End:0x165
		if((Pickup != none) && BallisticWeaponPickup(Pickup) != none)
		{
			GenerateLayout(BallisticWeaponPickup(Pickup).LayoutIndex);
			GenerateCamo(BallisticWeaponPickup(Pickup).CamoIndex);
			// End:0x149
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = BallisticWeaponPickup(Pickup).MagAmmo;			
		}
		else
		{
			GenerateLayout(byte(255));
			GenerateCamo(byte(255));
			// End:0x1A1
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = MagAmmo + ((int(!bNonCocking) * int(bMagPlusOne)) * int(!bNeedCock));
		}		
	}
	else
	{
		// End:0x1ED
		if(!W.HasAmmo())
		{
			bPossiblySwitch = true;
		}
	}
	// End:0x200
	if(Pickup == none)
	{
		bPossiblySwitch = true;
	}
	M = 0;
	J0x207:

	// End:0x263 [Loop If]
	if(M < 2)
	{
		// End:0x259
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0x207;
	}
	// End:0x29C
	if((Instigator.Weapon != none) && Instigator.Weapon.IsFiring())
	{
		bPossiblySwitch = false;
	}
	// End:0x2C9
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	// End:0x2E4
	if(int(Role) == int(ROLE_Authority))
	{
		ClientSetMagAmmo(MagAmmo);
	}
	// End:0x31C
	if(!bJustSpawned)
	{
		M = 0;
		J0x2F6:

		// End:0x319 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x2F6;
		}
		Destroy();
	}
	//return;	
}

simulated function ClientWeaponThrown()
{
	local int M;

	// End:0x52
	if(OtherGun != none)
	{
		OtherGun.bIsMaster = false;
		OtherGun.SetDualMode(false);
		OtherGun.OtherGun = none;
		bIsMaster = false;
		SetDualMode(false);
		OtherGun = none;
	}
	// End:0x95
	if((Instigator != none) && PlayerController(Instigator.Controller) != none)
	{
		PlayerController(Instigator.Controller).EndZoom();
	}
	AmbientSound = none;
	Instigator.AmbientSound = none;
	// End:0xC7
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	Instigator.DeleteInventory(self);
	// End:0x14D
	if((OtherGun == none) && (Instigator == none) || Instigator.Health < 1)
	{
		M = 0;
		J0x10C:

		// End:0x14D [Loop If]
		if(M < 2)
		{
			// End:0x143
			if(Ammo[M] != none)
			{
				Instigator.DeleteInventory(Ammo[M]);
			}
			M++;
			// [Loop Continue]
			goto J0x10C;
		}
	}
	//return;	
}

function DropFrom(Vector StartLocation)
{
	local int M, i;
	local Pickup Pickup;
	local Material N;

	// End:0x33
	if(IsMaster())
	{
		OtherGun.DropFrom(StartLocation);
		// End:0x33
		if(Instigator.Health > 0)
		{
			return;
		}
	}
	// End:0x40
	if(!bCanThrow)
	{
		return;
	}
	// End:0x52
	if(AmbientSound != none)
	{
		AmbientSound = none;
	}
	ClientWeaponThrown();
	// End:0xAA
	if(OtherGun != none)
	{
		OtherGun.bIsMaster = false;
		OtherGun.SetDualMode(false);
		OtherGun.OtherGun = none;
		bIsMaster = false;
		SetDualMode(false);
		OtherGun = none;
	}
	M = 0;
	J0xB1:

	// End:0xFD [Loop If]
	if(M < 2)
	{
		// End:0xF3
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0xB1;
	}
	// End:0x113
	if(Instigator != none)
	{
		DetachFromPawn(Instigator);
	}
	Pickup = Spawn(PickupClass, self,, StartLocation);
	// End:0x320
	if(Pickup != none)
	{
		// End:0x15D
		if(Instigator.Health > 0)
		{
			WeaponPickup(Pickup).bThrown = true;
		}
		Pickup.InitDroppedPickupFor(self);
		Pickup.Velocity = Velocity;
		// End:0x320
		if((int(Role) == int(ROLE_Authority)) && BallisticWeaponPickup(Pickup) != none)
		{
			BallisticWeaponPickup(Pickup).LayoutIndex = LayoutIndex;
			BallisticWeaponPickup(Pickup).CamoIndex = CamoIndex;
			// End:0x320
			if(WeaponCamo != none)
			{
				i = 0;
				J0x1E7:

				// End:0x320 [Loop If]
				if(i < WeaponCamo.WeaponMaterialSwaps.Length)
				{
					// End:0x316
					if(WeaponCamo.WeaponMaterialSwaps[i].pIndex != -1)
					{
						// End:0x289
						if(WeaponCamo.WeaponMaterialSwaps[i].Material != none)
						{
							BallisticWeaponPickup(Pickup).Skins[WeaponCamo.WeaponMaterialSwaps[i].pIndex] = WeaponCamo.WeaponMaterialSwaps[i].Material;
						}
						// End:0x316
						if(WeaponCamo.WeaponMaterialSwaps[i].MaterialName != "")
						{
							N = Material(DynamicLoadObject(WeaponCamo.WeaponMaterialSwaps[i].MaterialName, Class'Engine.Material'));
							// End:0x316
							if(N != none)
							{
								BallisticWeaponPickup(Pickup).Skins[WeaponCamo.WeaponMaterialSwaps[i].pIndex] = N;
							}
						}
					}
					++i;
					// [Loop Continue]
					goto J0x1E7;
				}
			}
		}
	}
	Destroy();
	//return;	
}

simulated function WeaponSpecialImpl(byte i)
{
	super.WeaponSpecialImpl(i);
	// End:0x42
	if(IsMaster() && OtherGun.Class == Class)
	{
		OtherGun.WeaponSpecialImpl(i);
	}
	//return;	
}

simulated function Destroyed()
{
	local int M;

	AmbientSound = none;
	// End:0x14C
	if(!IsSlave())
	{
		// End:0x14C
		if(((Instigator != none) && Instigator.Controller != none) && PlayerController(Instigator.Controller) != none)
		{
			PlayerController(Instigator.Controller).bZooming = false;
			PlayerController(Instigator.Controller).DesiredZoomLevel = 0.0000000;
			// End:0x14C
			if(PlayerController(Instigator.Controller).myHUD != none)
			{
				// End:0xE5
				if(bStandardCrosshairOff)
				{
					PlayerController(Instigator.Controller).myHUD.bCrosshairShow = true;					
				}
				else
				{
					PlayerController(Instigator.Controller).myHUD.bCrosshairShow = PlayerController(Instigator.Controller).myHUD.default.bCrosshairShow;
				}
				Instigator.Controller.bRun = 0;
			}
		}
	}
	M = 0;
	J0x153:

	// End:0x1ED [Loop If]
	if(M < 2)
	{
		// End:0x185
		if(FireMode[M] != none)
		{
			FireMode[M].DestroyEffects();
		}
		// End:0x1E3
		if((OtherGun == none) && Ammo[M] != none)
		{
			// End:0x1D6
			if((Instigator == none) || Instigator.Health < 1)
			{
				Ammo[M].Destroy();
			}
			Ammo[M] = none;
		}
		M++;
		// [Loop Continue]
		goto J0x153;
	}
	super(Inventory).Destroyed();
	//return;	
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	super(Actor).SetOverlayMaterial(mat, Time, bOverride);
	// End:0x3E
	if(IsMaster())
	{
		OtherGun.SetOverlayMaterial(mat, Time, bOverride);
	}
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	// End:0x50
	if(IsMaster())
	{
		OtherGun.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	}
	//return;	
}

simulated function SetHand(float InHand)
{
	// End:0x20
	if(IsSlave())
	{
		hand = InHand * float(-1);		
	}
	else
	{
		// End:0x40
		if(IsMaster())
		{
			OtherGun.SetHand(InHand);			
		}
		else
		{
			super.SetHand(InHand);
		}
	}
	//return;	
}

simulated function HandgunLowered(BallisticHandgun Other)
{
	// End:0x21
	if(Other == OtherGun)
	{
		SetBoneScale(8, 1.0000000, SupportHandBone);
	}
	//return;	
}

simulated function HandgunRaised(BallisticHandgun Other)
{
	// End:0x39
	if(Other == self)
	{
		// End:0x39
		if(((int(Role) == int(ROLE_Authority)) && !bNeedReload) && bNeedCock)
		{
			ServerCockGun();
		}
	}
	//return;	
}

simulated function LowerHandGun()
{
	GotoState('Lowering');
	//return;	
}

simulated function RaiseHandGun()
{
	GotoState('Raising');
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local float ScaleFactor, XL, YL, YL2;
	local string Temp;

	// End:0x28
	if((OtherGun == none) || bSkipDrawWeaponInfo)
	{
		super.NewDrawWeaponInfo(C, YPos);
		return;
	}
	// End:0x5C
	if(IsMaster())
	{
		super.NewDrawWeaponInfo(C, YPos);
		OtherGun.NewDrawWeaponInfo(C, YPos);
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
	C.Font = GetFontSizeIndex(C, -1 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x101
	if(bNoMag)
	{
		C.TextSize(string(Ammo[0].AmmoAmount), XL, YL);		
	}
	else
	{
		C.TextSize(string(MagAmmo), XL, YL);
	}
	C.CurX = C.OrgX + ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
	C.CurY = (C.ClipY - ((float(140) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
	// End:0x1C4
	if(bNoMag)
	{
		C.DrawText(string(Ammo[0].AmmoAmount), false);		
	}
	else
	{
		C.DrawText(string(MagAmmo), false);
	}
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	// End:0x2CF
	if(!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		C.TextSize(Temp, XL, YL);
		C.CurX = C.OrgX + ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = (C.ClipY - ((float(196) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
	}
	// End:0x3A6
	if((Ammo[1] != none) && Ammo[1] != Ammo[0])
	{
		Temp = GetHUDAmmoText(1);
		C.TextSize(Temp, XL, YL);
		C.CurX = C.OrgX + ((float(160) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = (C.ClipY - ((float(196) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
	}
	// End:0x4ED
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
		C.CurX = C.OrgX + ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = ((C.ClipY - ((float(196) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
		C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
	}
	//return;	
}

final simulated function bool IsMaster()
{
	return (OtherGun != none) && bIsMaster;
	//return;	
}

final simulated function bool IsSlave()
{
	return (OtherGun != none) && !bIsMaster;
	//return;	
}

final simulated function bool IsInDualMode()
{
	return OtherGun != none;
	//return;	
}

simulated function BallisticHandgun GetMaster()
{
	// End:0x18
	if((OtherGun == none) || bIsMaster)
	{
		return self;
	}
	return OtherGun;
	//return;	
}

simulated function BallisticHandgun GetSlave()
{
	// End:0x0E
	if(IsSlave())
	{
		return self;		
	}
	else
	{
		// End:0x1F
		if(OtherGun != none)
		{
			return OtherGun;
		}
	}
	return none;
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	local string S;
	local name Anim;
	local float frame, Rate;

	// End:0x22
	if(OtherGun == none)
	{
		super.DisplayDebug(Canvas, YL, YPos);
		return;
	}
	// End:0x40
	if(IsMaster())
	{
		super(Weapon).DisplayDebug(Canvas, YL, YPos);
	}
	// End:0x63
	if(IsSlave())
	{
		Canvas.SetDrawColor(128, 128, byte(255));		
	}
	else
	{
		Canvas.SetDrawColor(byte(255), 128, 0);
	}
	S = "Ballistic Weapon: ReloadeState: ";
	switch(ReloadState)
	{
		// End:0xC4
		case 0:
			S = S $ "None";
			// End:0x1C8
			break;
		// End:0xE5
		case 1:
			S = S $ "PreClipOut";
			// End:0x1C8
			break;
		// End:0x105
		case 2:
			S = S $ "PreClipIn";
			// End:0x1C8
			break;
		// End:0x126
		case 3:
			S = S $ "PostClipIn";
			// End:0x1C8
			break;
		// End:0x148
		case 4:
			S = S $ "StartShovel";
			// End:0x1C8
			break;
		// End:0x165
		case 5:
			S = S $ "Shovel";
			// End:0x1C8
			break;
		// End:0x187
		case 6:
			S = S $ "PostShellIn";
			// End:0x1C8
			break;
		// End:0x1A7
		case 7:
			S = S $ "EndShovel";
			// End:0x1C8
			break;
		// End:0x1C5
		case 8:
			S = S $ "Cocking";
			// End:0x1C8
			break;
		// End:0xFFFF
		default:
			break;
	}
	S = (((S $ ", MagAmmo=") $ string(MagAmmo)) $ ",State=") $ string(GetStateName());
	Canvas.DrawText(S);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	YPos = float(RcComponent.DrawDebug(Canvas, int(YPos), int(YL)));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	AimComponent.DrawDebug(Canvas);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	switch(ClientState)
	{
		// End:0x2D5
		case 0:
			S = "None";
			// End:0x337
			break;
		// End:0x2EB
		case 1:
			S = "Hidden";
			// End:0x337
			break;
		// End:0x302
		case 2:
			S = "BringUp";
			// End:0x337
			break;
		// End:0x319
		case 3:
			S = "PutDown";
			// End:0x337
			break;
		// End:0x334
		case 4:
			S = "ReadyToFire";
			// End:0x337
			break;
		// End:0xFFFF
		default:
			break;
	}
	GetAnimParams(0, Anim, frame, Rate);
	Canvas.DrawText((((((((((("ClientState=" $ S) $ ", PendingHandgun=") $ string(PendingHandgun)) $ ", Anim=") $ string(Anim)) $ ":") $ string(frame)) $ ", Othergun=") $ string(OtherGun)) $ ", bIsMaster=") $ string(bIsMaster));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	// End:0x42C
	if(IsMaster())
	{
		OtherGun.DisplayDebug(Canvas, YL, YPos);
	}
	//return;	
}

simulated function MeleeHoldImpl()
{
	super.MeleeHoldImpl();
	// End:0x1E
	if(IsMaster())
	{
		OtherGun.MeleeHoldImpl();
	}
	//return;	
}

simulated function MeleeReleaseImpl()
{
	super.MeleeReleaseImpl();
	// End:0x1E
	if(IsMaster())
	{
		OtherGun.MeleeReleaseImpl();
	}
	//return;	
}

simulated state DualAction
{	stop;	
}

simulated state Raising extends DualAction
{Begin:

	OtherGun.SetBoneScale(8, 0.0000000, OtherGun.SupportHandBone);
	SafePlayAnim(SelectAnim, 2.0000000, 0.1000000);
	FinishAnim();
	OtherGun.HandgunRaised(self);
	HandgunRaised(self);
	// End:0x69
	if(int(ClientState) == int(4))
	{
		PlayIdle();
	}
	GotoState('None');
	stop;				
}

simulated state Lowering extends DualAction
{Begin:

	SafePlayAnim(PutDownAnim, 2.0000000, 0.1000000);
	FinishAnim();
	GotoState('Lowered');
	stop;					
}

simulated state Lowered extends DualAction
{
	simulated function BeginState()
	{
		// End:0x1B
		if(OtherGun != none)
		{
			OtherGun.HandgunLowered(self);
		}
		//return;		
	}
	stop;	
}

simulated state PendingDualAction
{
	simulated function BeginState()
	{
		OtherGun.LowerHandGun();
		//return;		
	}

	simulated function HandgunRaised(BallisticHandgun Other)
	{
		// End:0x16
		if(Other == OtherGun)
		{
			GotoState('None');
		}
		//return;		
	}
	stop;	
}

simulated state PendingReloading extends PendingDualAction
{
	simulated function HandgunLowered(BallisticHandgun Other)
	{
		global.HandgunLowered(Other);
		// End:0x20
		if(Other == OtherGun)
		{
			CommonStartReload();
		}
		//return;		
	}

	function ServerStartReload(optional byte i)
	{
		//return;		
	}
	stop;	
}

simulated state PendingCocking extends PendingDualAction
{
	simulated function HandgunLowered(BallisticHandgun Other)
	{
		global.HandgunLowered(Other);
		// End:0x20
		if(Other == OtherGun)
		{
			CommonCockGun();
		}
		//return;		
	}

	function ServerStartReload(optional byte i)
	{
		//return;		
	}
	stop;	
}

defaultproperties
{
	SupportHandBone="Root01"
	bShouldDualInLoadout=true
	bDualMixing=true
	DualReloadAnim="DualReload"
	DualReloadEmptyAnim="DualReloadOpen"
	DualReloadAnimRate=1.0000000
	DualReloadAnimDelay=0.2000000
	TrackSpeed=18000.0000000
	SingleHeldRate=0.3000000
	SightZoomFactor=1.2000000
	SightBobScale=0.3500000
	LongGunPivot=(Pitch=5000,Yaw=6000,Roll=0)
	bWT_Sidearm=true
	GunLength=16.0000000
}
