class GRS9Pistol extends BallisticHandgun
	config(BallisticProV55);

var() bool bHasKnife;
var() bool bHasFlash;
var() bool bHasCombatLaser;
var() bool bStriking;
var bool bLaserOn;
var LaserActor Laser;
var Emitter LaserBlast;
var Emitter LaserDot;
var byte CurrentWeaponMode2;
var Actor GlowFX;
var() float LaserAmmo;
var bool bBigLaser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter TazerEffect;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		LaserAmmo, bLaserOn;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasCombatLaser = true;
	bHasKnife = false;
	bHasFlash = false;
	// End:0x5C
	if(InStr(WeaponParams.LayoutTags, "no_combat_laser") != -1)
	{
		bHasCombatLaser = false;
	}
	// End:0x9C
	if(InStr(WeaponParams.LayoutTags, "tacknife") != -1)
	{
		bHasKnife = true;
		MeleeFireMode.Damage = 70.0000000;
	}
	// End:0xC5
	if(InStr(WeaponParams.LayoutTags, "flash") != -1)
	{
		bHasFlash = true;
	}
	// End:0xE1
	if(bHasCombatLaser || bHasFlash)
	{
		bShowChargingBar = true;
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x15F
	if((GlowFX != none) && bHasCombatLaser)
	{
		GRS9AmbientFX(GlowFX).SetReadyIndicator((((FireMode[1] != none) && !FireMode[1].IsFiring()) && (Level.TimeSeconds - GRS9SecondaryFire(FireMode[1]).StopFireTime) >= 0.8000000) && LaserAmmo > float(0));
		// End:0xE8
		if((FireMode[1] != none) && FireMode[1].IsFiring())
		{
			GRS9AmbientFX(GlowFX).SetRedIndicator(2);
			GRS9AmbientFX(GlowFX).SetFireGlow(true);			
		}
		else
		{
			// End:0x134
			if((FireMode[1] != none) && LaserAmmo < default.LaserAmmo)
			{
				GRS9AmbientFX(GlowFX).SetRedIndicator(1);
				GRS9AmbientFX(GlowFX).SetFireGlow(false);				
			}
			else
			{
				GRS9AmbientFX(GlowFX).SetRedIndicator(0);
				GRS9AmbientFX(GlowFX).SetFireGlow(false);
			}
		}
	}
	//return;	
}

simulated event Tick(float dt)
{
	super(BallisticWeapon).Tick(dt);
	// End:0x7C
	if(bHasCombatLaser)
	{
		// End:0x7C
		if((LaserAmmo < default.LaserAmmo) && (FireMode[1] == none) || !FireMode[1].IsFiring())
		{
			LaserAmmo = FMin(default.LaserAmmo, LaserAmmo + ((dt / float(6)) * (float(1) + (LaserAmmo / default.LaserAmmo))));
		}
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
	// End:0x63
	if(bLaserOn != default.bLaserOn)
	{
		OnLaserSwitched();
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
		GRS9Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	OnLaserSwitched();
	// End:0x6F
	if(!bLaserOn)
	{
		bServerReloading = false;
		bPreventReload = false;
		ReloadState = 0;
	}
	// End:0x87
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	OnLaserSwitched();
	// End:0x37
	if(bLaserOn)
	{
		SpawnLaserDot();
		// End:0x34
		if(!bHasCombatLaser)
		{
			PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);
		}		
	}
	else
	{
		KillLaserDot();
		// End:0x5C
		if(!bHasCombatLaser)
		{
			PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
		}
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

simulated function SpawnLaserDot(optional Vector loc)
{
	// End:0x41
	if(LaserDot == none)
	{
		// End:0x2C
		if(bHasCombatLaser)
		{
			LaserDot = Spawn(Class'BallisticProV55.IE_GRS9LaserHit',,, loc);			
		}
		else
		{
			LaserDot = Spawn(Class'BallisticProV55.M806LaserDot',,, loc);
		}
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
			GRS9Attachment(ThirdPersonActor).bLaserOn = false;
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
	// End:0x7E
	if(TazerEffect != none)
	{
		TazerEffect.Kill();
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
	// End:0x129
	if((((!bStriking && int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.1000000)
	{
		bAimAligned = true;
	}
	// End:0x14D
	if(bAimAligned && Other != none)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x1AC
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		LaserDot.SetRotation(Rotator(HitNormal));
		Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	}
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x215
	if(bAimAligned)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip2');
		Laser.SetRotation(AimDir);
	}
	// End:0x299
	if((LaserBlast != none) && bHasCombatLaser)
	{
		LaserBlast.SetLocation(Laser.Location);
		LaserBlast.SetRotation(Laser.Rotation);
		Canvas.DrawActor(LaserBlast, false, false, DisplayFOV);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	// End:0x2E4
	if(bBigLaser)
	{
		Scale3D.Y = 4.0000000;
		Scale3D.Z = 4.0000000;		
	}
	else
	{
		Scale3D.Y = 1.5000000;
		Scale3D.Z = 1.5000000;
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
	local Vector TazLoc;
	local Rotator TazRot;

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
	// End:0x166
	if(TazerEffect != none)
	{
		TazLoc = GetBoneCoords('tip3').Origin;
		TazRot = GetBoneRotation('tip3');
		// End:0x166
		if(TazerEffect != none)
		{
			TazerEffect.SetLocation(TazLoc);
			TazerEffect.SetRotation(TazRot);
			Canvas.DrawActor(TazerEffect, false, false, DisplayFOV);
		}
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
	// End:0x66
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		// End:0x58
		if(bHasCombatLaser)
		{
			Laser = Spawn(Class'BallisticProV55.LaserActor_GRSNine');			
		}
		else
		{
			Laser = Spawn(Class'BallisticProV55.LaserActor');
		}
	}
	// End:0x9F
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0xF9
	if(((Instigator != none) && LaserBlast == none) && PlayerController(Instigator.Controller) != none)
	{
		LaserBlast = Spawn(Class'BallisticProV55.GRS9LaserOnFX');
		Class'BCoreProV55.DGVEmitter'.static.ScaleEmitter(LaserBlast, DrawScale);
	}
	// End:0x12F
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'OpenIdle';
		ReloadAnim = 'OpenReload';		
	}
	else
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';
	}
	// End:0x15C
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	// End:0x173
	if(SightFX != none)
	{
		SightFX.Destroy();
	}
	// End:0x25F
	if(((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2) && bHasCombatLaser)
	{
		GlowFX = none;
		SightFX = none;
		GlowFX = Spawn(Class'BallisticProV55.GRS9AmbientFX');
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(GlowFX), DrawScale);
		SightFX = Spawn(Class'BallisticProV55.GRS9SightLEDs');
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(SightFX), DrawScale);
		// End:0x25F
		if(hand < float(0))
		{
			GRS9AmbientFX(GlowFX).InvertY();
			GRS9SightLEDs(SightFX).InvertY();
		}
	}
	// End:0x2C7
	if((Instigator.IsLocallyControlled() && TazerEffect == none) && bHasKnife)
	{
		TazerEffect = Spawn(Class'BallisticProV55.MRS138TazerEffect', self,, Location);
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(TazerEffect, DrawScale);
		AttachToBone(TazerEffect, 'tip3');
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
			GRS9Attachment(ThirdPersonActor).bBigLaser = false;
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
	super(BallisticWeapon).OnAimParamsChanged();
	// End:0x15
	if(bLaserOn)
	{
		ApplyLaserAim();
	}
	//return;	
}

simulated function ApplyLaserAim()
{
	AimComponent.AimAdjustTime *= 0.6500000;
	AimComponent.AimSpread.Max *= 0.6500000;
	AimComponent.AimSpread.Min *= 0.6500000;
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x2D
	if(Anim != 'PrepMelee')
	{
		bStriking = false;
	}
	// End:0xBB
	if((((Anim == 'OpenFire') || Anim == 'Fire') || Anim == CockAnim) || Anim == ReloadAnim)
	{
		// End:0xA5
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'OpenIdle';
			ReloadAnim = 'OpenReload';			
		}
		else
		{
			IdleAnim = 'Idle';
			ReloadAnim = 'Reload';
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
	// End:0x79
	if(((!FireMode[1].IsFiring() && (Level.TimeSeconds - GRS9SecondaryFire(FireMode[1]).StopFireTime) >= 0.8000000) && LaserAmmo == default.LaserAmmo) && bHasCombatLaser)
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
		GRS9Attachment(ThirdPersonActor).bBigLaser = true;
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
	// End:0xCF
	if(bHasFlash)
	{
		// End:0x99
		if(Level.TimeSeconds >= FireMode[1].NextFireTime)
		{
			// End:0x6A
			if(FireMode[1].bIsFiring)
			{
				return FMin(1.0000000, FireMode[1].HoldTime / FireMode[1].MaxHoldTime);
			}
			return FMin(1.0000000, GRS9SecondaryFire(FireMode[1]).DecayCharge / FireMode[1].MaxHoldTime);
		}
		return (FireMode[1].NextFireTime - Level.TimeSeconds) / FireMode[1].FireRate;		
	}
	else
	{
		// End:0xF1
		if(bHasCombatLaser)
		{
			return FClamp(LaserAmmo / default.LaserAmmo, 0.0000000, 1.0000000);
		}
	}
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

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x7B
	if(bNoaltfire)
	{
		return 0;		
	}
	else
	{
		// End:0x98
		if(bHasKnife)
		{
			// End:0x95
			if(dist < float(100))
			{
				return 1;
			}			
		}
		else
		{
			// End:0xEB
			if(bHasFlash)
			{
				// End:0xE8
				if(((Level.TimeSeconds >= FireMode[1].NextFireTime) && FRand() > 0.6000000) && dist < float(1200))
				{
					return 1;
				}				
			}
			else
			{
				// End:0x1E8
				if(bHasCombatLaser)
				{
					// End:0x118
					if((B == none) || B.Enemy == none)
					{
						return 0;
					}
					// End:0x15B
					if((LaserAmmo < 0.3000000) || (Level.TimeSeconds - GRS9SecondaryFire(FireMode[1]).StopFireTime) < 0.8000000)
					{
						return 0;
					}
					// End:0x16F
					if(dist > float(3000))
					{
						return 0;
					}
					Result = (FRand() * 0.2000000) + FMin(1.0000000, LaserAmmo / (default.LaserAmmo / float(2)));
					// End:0x1B9
					if(dist < float(500))
					{
						Result += 0.5000000;						
					}
					else
					{
						// End:0x1D6
						if(dist > float(1500))
						{
							Result -= 0.3000000;
						}
					}
					// End:0x1E8
					if(Result > 0.5000000)
					{
						return 1;
					}
				}
			}
		}
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
	LaserOnSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserOffSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;8.0;-999.0;25.0;0.0;0.0;-999.0")
	AIReloadTime=1.0000000
	SightAnimScale=0.2500000
	ParamsClasses[0]=Class'BallisticProV55.GRS9WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.GRS9WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.GRS9WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.GRS9WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Glock.BigIcon_Glock'
	BigIconCoords=(X1=0,Y1=30,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Pullout',Volume=0.1500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.1480000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	SightFXBone="SightBone"
	bNoCrosshairInScope=true
	SightBobScale=1.0000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-Cock',Volume=0.6000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-ClipHit',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-ClipHit',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50Out',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M806InA',USize1=128,VSize1=128,USize2=256,VSize2=256,Color1=(R=96,G=0,B=0,A=175),Color2=(R=255,G=255,B=255,A=255),StartSize1=100,StartSize2=110)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=6.0000000,CurrentScale=0.0000000)
	MeleeFireClass=Class'BallisticProV55.GRS9MeleeFire'
	ManualLines[0]="Automatic fire. Short ranged, but has higher DPS than most pistols. Recoil is moderate."
	ManualLines[1]="Projects a laser beam. Has extremely low DPS, but consistent damage over range and recharges over time."
	ManualLines[2]="The Weapon Function key causes a hitscan single-shot beam to be projected from the unit, dealing good damage. The GRS-9 is effective at close range."
	SightOffset=(X=-20.0000000,Y=-1.8500000,Z=26.7000000)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=3000,Yaw=-300,Roll=0)
	CockingBringUpTime=0.7000000
	FireModeClass[0]=Class'BallisticProV55.GRS9PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.GRS9SecondaryFire'
	SelectAnimRate=1.2500000
	PutDownAnimRate=1.2500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="The GRS9 from Drake & Co. is used primarily by inner core planets for law enforcement purposes. The additional laser unit adds an alternative attack to the GRS9. The laser unit can be held down, for up to 3.5 seconds, releasing a searing beam upon enemies. This drains the rechargeable battery however, which must be left to replenish when empty."
	Priority=9
	HudColor=(R=200,G=25,B=25,A=255)
	InventoryGroup=3
	GroupOffset=3
	PickupClass=Class'BallisticProV55.GRS9Pickup'
	PlayerViewOffset=(X=10.0000000,Y=6.0000000,Z=-17.0000000)
	AttachmentClass=Class'BallisticProV55.GRS9Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Glock.SmallIcon_Glock'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="GRS-9 Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.GRS9_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BW_Core_WeaponTex.Glock.Glock_Shiny'
	bFullVolume=true
	SoundRadius=128.0000000
}
