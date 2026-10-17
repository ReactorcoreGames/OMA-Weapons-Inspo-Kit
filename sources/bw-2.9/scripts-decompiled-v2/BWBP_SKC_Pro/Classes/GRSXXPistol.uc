class GRSXXPistol extends BallisticHandgun
	config(BallisticProV55);

var(GRSXX) bool bHasCombatLaser;
var(GRSXX) bool bLaserOn;
var(GRSXX) LaserActor Laser;
var(GRSXX) Emitter LaserBlast;
var(GRSXX) Emitter LaserDot;
var(GRSXX) byte CurrentWeaponMode2;
var(GRSXX) Actor GlowFX;
var(GRSXX) float LaserAmmo;
var(GRSXX) bool bBigLaser;
var(GRSXX) bool bAmped;
var(GRSXX) name AmplifierBone;
var(GRSXX) name AmplifierOnAnim;
var(GRSXX) name AmplifierOffAnim;
var(GRSXX) Sound AmplifierOnSound;
var(GRSXX) Sound AmplifierOffSound;
var(GRSXX) Sound AmplifierPowerOnSound;
var(GRSXX) Sound AmplifierPowerOffSound;
var(GRSXX) float AmpCharge;
var(GRSXX) float DrainRate;
var(GRSXX) bool bShowCharge;
var(GRSXX) bool bRemovableAmp;
var() array<Material> AmpMaterials;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSwitchAmplifier;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSetHeat, LaserAmmo, 
		bLaserOn, bRemovableAmp;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasCombatLaser = true;
	// End:0x4C
	if(InStr(WeaponParams.LayoutTags, "no_combat_laser") != -1)
	{
		bHasCombatLaser = false;
	}
	// End:0xC7
	if(InStr(WeaponParams.LayoutTags, "no_starting_amp") != -1)
	{
		bAmped = false;
		GRSXXPrimaryFire(FireMode[0]).bAmped = false;
		bRemovableAmp = true;
		GRSXXPrimaryFire(FireMode[0]).bRemovableAmp = true;
		BringUpSound.Sound = Sound'BW_Core_WeaponSound.XK2.XK2-Pullout';
	}
	// End:0x109
	if(InStr(WeaponParams.LayoutTags, "no_amp") != -1)
	{
		bAmped = false;
		GRSXXPrimaryFire(FireMode[0]).bAmped = false;
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x2C
	if(AmpCharge > float(0))
	{
		AddHeat(-DrainRate * dt);
	}
	// End:0x180
	if((GlowFX != none) && bHasCombatLaser)
	{
		GRSXXAmbientFX(GlowFX).SetReadyIndicator((((FireMode[1] != none) && !FireMode[1].IsFiring()) && (Level.TimeSeconds - GRSXXSecondaryFire(FireMode[1]).StopFireTime) >= 0.8000000) && LaserAmmo > float(0));
		// End:0x109
		if((FireMode[1] != none) && FireMode[1].IsFiring())
		{
			GRSXXAmbientFX(GlowFX).SetRedIndicator(2);
			GRSXXAmbientFX(GlowFX).SetFireGlow(true);			
		}
		else
		{
			// End:0x155
			if((FireMode[1] != none) && LaserAmmo < default.LaserAmmo)
			{
				GRSXXAmbientFX(GlowFX).SetRedIndicator(1);
				GRSXXAmbientFX(GlowFX).SetFireGlow(false);				
			}
			else
			{
				GRSXXAmbientFX(GlowFX).SetRedIndicator(0);
				GRSXXAmbientFX(GlowFX).SetFireGlow(false);
			}
		}
	}
	//return;	
}

simulated event Tick(float dt)
{
	super(BallisticWeapon).Tick(dt);
	// End:0x73
	if((LaserAmmo < default.LaserAmmo) && (FireMode[1] == none) || !FireMode[1].IsFiring())
	{
		LaserAmmo = FMin(default.LaserAmmo, LaserAmmo + ((dt / float(6)) * (float(1) + (LaserAmmo / default.LaserAmmo))));
	}
	//return;	
}

simulated function PlayIdle()
{
	super(BallisticWeapon).PlayIdle();
	// End:0x54
	if((((!bLaserOn || bPendingSightUp) || int(SightingState) != int(0)) || bScopeView) || !CanPlayAnim(IdleAnim,, "IDLE"))
	{
		return;
	}
	FreezeAnimAt(0.0000000);
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x39
	if(int(CurrentWeaponMode) != int(CurrentWeaponMode2))
	{
		CurrentWeaponMode2 = CurrentWeaponMode;
	}
	// End:0x93
	if(bLaserOn != default.bLaserOn)
	{
		// End:0x6B
		if(bLaserOn)
		{
			AimComponent.AimAdjustTime *= 1.5000000;			
		}
		else
		{
			AimComponent.AimAdjustTime *= 0.6670000;
		}
		default.bLaserOn = bLaserOn;
		ClientSwitchLaser();
	}
	super(Weapon).PostNetReceive();
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	// End:0x13
	if(bLaserOn == bNewLaserOn)
	{
		return;
	}
	bLaserOn = bNewLaserOn;
	// End:0x46
	if(ThirdPersonActor != none)
	{
		GRSXXAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0x67
	if(bLaserOn)
	{
		AimComponent.AimAdjustTime *= 1.5000000;		
	}
	else
	{
		AimComponent.AimAdjustTime *= 0.6670000;
		bServerReloading = false;
		bPreventReload = false;
		ReloadState = 0;
	}
	// End:0xAC
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	// End:0x11
	if(!bLaserOn)
	{
		KillLaserDot();
	}
	PlayIdle();
	//return;	
}

simulated function KillLaserDot()
{
	// End:0x32
	if(LaserDot != none)
	{
		LaserDot.bHidden = false;
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function SpawnLaserDot(Vector loc)
{
	// End:0x20
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BWBP_SKC_Pro.IE_GRSXXLaserHit',,, loc);
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
			GRSXXAttachment(ThirdPersonActor).bLaserOn = false;
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
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	// End:0x36
	if(SightFX != none)
	{
		SightFX.Destroy();
	}
	// End:0x4D
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x64
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
	local bool bAimAligned;

	// End:0x1F
	if((int(ClientState) == int(1)) || !bLaserOn)
	{
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	loc = GetBoneCoords('tip2').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(3000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xB7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x11C
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.1000000)
	{
		bAimAligned = true;
	}
	// End:0x140
	if(bAimAligned && Other != none)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x19F
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		LaserDot.SetRotation(Rotator(HitNormal));
		Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	}
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x208
	if(bAimAligned)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip2');
		Laser.SetRotation(AimDir);
	}
	// End:0x281
	if(LaserBlast != none)
	{
		LaserBlast.SetLocation(Laser.Location);
		LaserBlast.SetRotation(Laser.Rotation);
		Canvas.DrawActor(LaserBlast, false, false, DisplayFOV);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	// End:0x2CC
	if(bBigLaser)
	{
		Scale3D.Y = 7.0000000;
		Scale3D.Z = 7.0000000;		
	}
	else
	{
		Scale3D.Y = 3.5000000;
		Scale3D.Z = 3.5000000;
	}
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local Vector V;
	local Rotator R;
	local Coords C;

	super.RenderOverlays(Canvas);
	// End:0x18
	if(IsInState('Lowered'))
	{
		return;
	}
	DrawLaserSight(Canvas);
	// End:0xEF
	if(GlowFX != none)
	{
		C = GetBoneCoords('tip2');
		V = C.Origin;
		// End:0x8B
		if(hand < float(0))
		{
			R = OrthoRotation(C.XAxis, -C.YAxis, C.ZAxis);			
		}
		else
		{
			R = OrthoRotation(C.XAxis, C.YAxis, C.ZAxis);
		}
		GlowFX.SetLocation(V);
		GlowFX.SetRotation(R);
		Canvas.DrawActor(GlowFX, false, false, DisplayFOV);
	}
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

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x4C
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BWBP_SKC_Pro.LaserActor_GRSXX');
	}
	// End:0xA6
	if(((Instigator != none) && LaserBlast == none) && PlayerController(Instigator.Controller) != none)
	{
		LaserBlast = Spawn(Class'BWBP_SKC_Pro.GRSXXLaserOnFX');
		Class'BCoreProV55.DGVEmitter'.static.ScaleEmitter(LaserBlast, DrawScale);
	}
	// End:0xF2
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'OpenIdle';
		ReloadAnim = 'OpenReload';
		AmplifierOnAnim = 'AMPApplyOpen';
		AmplifierOffAnim = 'AMPRemoveOpen';		
	}
	else
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';
		AmplifierOnAnim = 'AMPApply';
		AmplifierOffAnim = 'AMPRemove';
	}
	// End:0x135
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	// End:0x14C
	if(SightFX != none)
	{
		SightFX.Destroy();
	}
	// End:0x22D
	if((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
	{
		GlowFX = none;
		SightFX = none;
		GlowFX = Spawn(Class'BWBP_SKC_Pro.GRSXXAmbientFX');
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(GlowFX), DrawScale);
		SightFX = Spawn(Class'BWBP_SKC_Pro.GRSXXSightLEDs');
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(SightFX), DrawScale);
		// End:0x22D
		if(hand < float(0))
		{
			GRSXXAmbientFX(GlowFX).InvertY();
			GRSXXSightLEDs(SightFX).InvertY();
		}
	}
	// End:0x24A
	if(bAmped)
	{
		SetBoneScale(0, 1.0000000, AmplifierBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, AmplifierBone);
	}
	//return;	
}

simulated event Timer()
{
	// End:0x43
	if(bBigLaser)
	{
		FireMode[1].StopFiring();
		bBigLaser = false;
		// End:0x43
		if(ThirdPersonActor != none)
		{
			GRSXXAttachment(ThirdPersonActor).bBigLaser = false;
		}
	}
	// End:0x7B
	if(int(ClientState) == int(3))
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(GlowFX);
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(SightFX);
	}
	super.Timer();
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0xD0
	if((((Anim == 'OpenFire') || Anim == 'Fire') || Anim == CockAnim) || Anim == ReloadAnim)
	{
		// End:0xA4
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'OpenIdle';
			ReloadAnim = 'OpenReload';
			AmplifierOnAnim = 'AMPApplyOpen';
			AmplifierOffAnim = 'AMPRemoveOpen';			
		}
		else
		{
			IdleAnim = 'Idle';
			ReloadAnim = 'Reload';
			AmplifierOnAnim = 'AMPApply';
			AmplifierOffAnim = 'AMPRemove';
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
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x6E
	if((!FireMode[1].IsFiring() && (Level.TimeSeconds - GRSXXSecondaryFire(FireMode[1]).StopFireTime) >= 0.8000000) && LaserAmmo == default.LaserAmmo)
	{
		ClientWeaponSpecial(i);
		CommonWeaponSpecial(i);
	}
	//return;	
}

simulated function ClientWeaponSpecial(optional byte i)
{
	// End:0x24
	if(int(Level.NetMode) == int(NM_Client))
	{
		CommonWeaponSpecial(i);
	}
	//return;	
}

simulated function CommonWeaponSpecial(optional byte i)
{
	bBigLaser = true;
	// End:0x29
	if(ThirdPersonActor != none)
	{
		GRSXXAttachment(ThirdPersonActor).bBigLaser = true;
	}
	BallisticInstantFire(FireMode[1]).Damage = 75.0000000;
	BallisticInstantFire(FireMode[1]).HeadMult = 1.0000000;
	BallisticInstantFire(FireMode[1]).LimbMult = 1.0000000;
	BallisticInstantFire(FireMode[1]).XInaccuracy = 16.0000000;
	BallisticInstantFire(FireMode[1]).YInaccuracy = 16.0000000;
	FireMode[1].ModeDoFire();
	LaserAmmo = FMax(0.0000000, LaserAmmo - default.LaserAmmo);
	BallisticInstantFire(FireMode[1]).Damage = BallisticInstantFire(FireMode[1]).default.Damage;
	BallisticInstantFire(FireMode[1]).HeadMult = BallisticInstantFire(FireMode[1]).default.HeadMult;
	BallisticInstantFire(FireMode[1]).LimbMult = BallisticInstantFire(FireMode[1]).default.LimbMult;
	BallisticInstantFire(FireMode[1]).XInaccuracy = 2.0000000;
	BallisticInstantFire(FireMode[1]).YInaccuracy = 2.0000000;
	// End:0x1BC
	if((int(ClientState) != int(3)) && int(ClientState) != int(2))
	{
		SetTimer(0.1500000, false);
	}
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x27
	if(!bRemovableAmp)
	{
		return FClamp(LaserAmmo / default.LaserAmmo, 0.0000000, 1.0000000);		
	}
	else
	{
		// End:0x3B
		if(!bShowCharge)
		{
			return 0.0000000;			
		}
		else
		{
			return AmpCharge / float(10);
		}
	}
	//return;	
}

simulated exec function ToggleAmplifier(optional byte i)
{
	// End:0x24
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	bAmped = !bAmped;
	ServerSwitchAmplifier(bAmped);
	SwitchAmplifier(bAmped);
	//return;	
}

function ServerSwitchAmplifier(bool bNewValue)
{
	bAmped = bNewValue;
	SwitchAmplifier(bAmped);
	bServerReloading = true;
	ReloadState = 9;
	// End:0xAE
	if(bAmped)
	{
		WeaponModes[0].bUnavailable = true;
		WeaponModes[1].bUnavailable = true;
		WeaponModes[2].bUnavailable = true;
		WeaponModes[3].bUnavailable = false;
		CurrentWeaponMode = 3;
		ServerSwitchWeaponMode(3);
		AmpCharge = 10.0000000;
		Skins[4] = AmpMaterials[0];
		Skins[5] = AmpMaterials[1];		
	}
	else
	{
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = false;
		WeaponModes[2].bUnavailable = false;
		WeaponModes[3].bUnavailable = true;
		CurrentWeaponMode = 2;
		ServerSwitchWeaponMode(2);
		AmpCharge = 0.0000000;
	}
	//return;	
}

simulated function SwitchAmplifier(bool bNewValue)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 9;
	// End:0x9D
	if(bNewValue)
	{
		PlayAnim(AmplifierOnAnim);
		WeaponModes[0].bUnavailable = true;
		WeaponModes[1].bUnavailable = true;
		WeaponModes[2].bUnavailable = true;
		WeaponModes[3].bUnavailable = false;
		AmpCharge = 10.0000000;
		Skins[4] = AmpMaterials[0];
		Skins[5] = AmpMaterials[1];		
	}
	else
	{
		PlayAnim(AmplifierOffAnim);
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = false;
		WeaponModes[2].bUnavailable = false;
		WeaponModes[3].bUnavailable = true;
		AmpCharge = 0.0000000;
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	super.ServerSwitchWeaponMode(newmode);
	// End:0x3A
	if(!Instigator.IsLocallyControlled())
	{
		GRSXXPrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
	}
	//return;	
}

simulated function CommonSwitchWeaponMode(byte newmode)
{
	super(BallisticWeapon).CommonSwitchWeaponMode(newmode);
	GRSXXPrimaryFire(FireMode[0]).SwitchWeaponMode(newmode);
	//return;	
}

simulated function Notify_AmplifierOn()
{
	PlaySound(AmplifierOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_AmplifierOff()
{
	PlaySound(AmplifierOffSound,, 0.5000000);
	bShowCharge = false;
	//return;	
}

simulated function Notify_AmplifierCharged()
{
	PlaySound(AmplifierPowerOnSound,, 1.6000000);
	bShowCharge = true;
	//return;	
}

simulated function Notify_AmplifierShow()
{
	SetBoneScale(0, 1.0000000, AmplifierBone);
	//return;	
}

simulated function Notify_AmplifierHide()
{
	SetBoneScale(0, 0.0000000, AmplifierBone);
	//return;	
}

simulated function AddHeat(float Amount)
{
	// End:0x15
	if(bBerserk)
	{
		Amount *= 0.7500000;
	}
	AmpCharge = FMax(0.0000000, AmpCharge + Amount);
	// End:0xBF
	if(AmpCharge <= float(0))
	{
		PlaySound(AmplifierPowerOffSound,, 2.0000000,, 32.0000000);
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = false;
		WeaponModes[2].bUnavailable = false;
		WeaponModes[3].bUnavailable = true;
		CurrentWeaponMode = 2;
		ServerSwitchWeaponMode(2);
		Skins[4] = AmpMaterials[2];
		Skins[5] = AmpMaterials[3];
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	AmpCharge = NewHeat;
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float Result, dist;

	// End:0x0E
	if(!bHasCombatLaser)
	{
		return 0;
	}
	B = Bot(Instigator.Controller);
	// End:0x4B
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x8E
	if((LaserAmmo < 0.3000000) || (Level.TimeSeconds - GRSXXSecondaryFire(FireMode[1]).StopFireTime) < 0.8000000)
	{
		return 0;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0xD1
	if(dist > float(3000))
	{
		return 0;
	}
	Result = (FRand() * 0.2000000) + FMin(1.0000000, LaserAmmo / (default.LaserAmmo / float(2)));
	// End:0x11B
	if(dist < float(500))
	{
		Result += 0.5000000;		
	}
	else
	{
		// End:0x138
		if(dist > float(1500))
		{
			Result -= 0.3000000;
		}
	}
	// End:0x14A
	if(Result > 0.5000000)
	{
		return 1;
	}
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
	return 0.8000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.8000000;
	//return;	
}

defaultproperties
{
	LaserAmmo=3.5000000
	bAmped=true
	AmplifierBone="AMP"
	AmplifierOnAnim="AMPApply"
	AmplifierOffAnim="AMPRemove"
	AmplifierOnSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOn'
	AmplifierOffSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOff'
	AmplifierPowerOnSound=Sound'BWBP_SKC_Sounds.Glock_Gold.GRSXX-Select'
	AmplifierPowerOffSound=Sound'BW_Core_WeaponSound.AMP.Amp-Depleted'
	DrainRate=0.1000000
	AmpMaterials[0]=Shader'BWBP_SKC_Tex.Glock_Gold.GRSXX-AmpShine'
	AmpMaterials[1]=Shader'BWBP_SKC_Tex.Glock_Gold.GRSXX-AmpGlowShader'
	AmpMaterials[2]=Shader'BWBP_SKC_Tex.Glock_Gold.Amp-GoldDepleted-Shine'
	AmpMaterials[3]=Texture'ONSstructureTextures.CoreGroup.Invisible'
	SpecialInfo[0]=(Id="EvoDefs",Info="1200.0;65.0;4.0;150.0;2.0;2.0;1.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.GRSXXWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.GRSXXWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.GRSXXWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.Glock_Gold.BigIcon_GoldGlock'
	BigIconCoords=(X1=0,Y1=30,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.GRSXX-Select',Volume=0.2190000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.1480000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Amplified: Hypermode",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	SightFXBone="SightBone"
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-Cock',Volume=0.6000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-ClipHit',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50Out',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M806InA',USize1=128,VSize1=128,USize2=256,VSize2=256,Color1=(R=157,G=108,B=12,A=163),Color2=(R=255,G=255,B=255,A=255),StartSize1=79,StartSize2=124)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=6.0000000,CurrentScale=0.0000000)
	ManualLines[0]="Automatic amplified fire. Short ranged, but has extremely high DPS. Recoil is moderate."
	ManualLines[1]="Projects a lethal laser beam. Does major damage and recharges over time."
	ManualLines[2]="The Weapon Function key causes a hitscan single-shot beam to be projected from the unit, dealing high damage. The GRS-XX is effective at close/mid range."
	SightOffset=(X=-20.0000000,Y=0.0000000,Z=5.7000000)
	FireModeClass[0]=Class'BWBP_SKC_Pro.GRSXXPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.GRSXXSecondaryFire'
	SelectAnimRate=1.2500000
	PutDownAnimRate=1.2500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bShowChargingBar=true
	Description="GRSXX Pistol||Manufacturer: Drake & Co Firearms|Primary: Accelerated 9mm Rounds|Secondary: Focused Beam Matrix|| The Golden GRSXX is a truly rare sight. With only thirty-two ever produced, prices range in the tens of millions. A much improved version of the GRS9, the GRSXX boasts an enhanced UTC Mk6 Power Coil and a Model 8 magnetic accelerator in the lining of the barrel. The power coil boosts the laser's power output while substantially decreasing battery drainage. At the cost of battery damage, the laser matrix generator can also fire a compact energy burst by overloading and detonating the Mk6 coils. [Barrel is made of 24-Karat gold with an underlying platinum-titanium casing.]"
	Priority=9
	HudColor=(R=200,G=200,B=0,A=255)
	InventoryGroup=3
	GroupOffset=3
	PickupClass=Class'BWBP_SKC_Pro.GRSXXPickup'
	PlayerViewOffset=(X=20.0000000,Y=6.0000000,Z=-17.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.GRSXXAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.Glock_Gold.SmallIcon_GoldGlock'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="GRS-XX Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.GRSXX_FPm'
	DrawScale=0.3000000
	bFullVolume=true
	SoundRadius=128.0000000
}
