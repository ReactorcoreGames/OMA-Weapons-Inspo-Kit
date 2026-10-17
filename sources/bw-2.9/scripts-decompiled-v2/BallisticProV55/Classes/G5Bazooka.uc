class G5Bazooka extends BallisticWeapon
	config(BallisticProV55);

var() FullSound HatchSound;
var bool bCamView;
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
var Actor CurrentRocket;
var float LastSendTargetTime;
var Vector TargetLocation;
var bool bLaserOn;
var bool bLaserOld;
var LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		CurrentRocket, Target, 
		bLaserOn, bLockedOn, 
		targettime;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSetRocketTarget;

	// Pos:0x01A
	reliable if(int(Role) == int(ROLE_Authority))
		ClientRocketDie, ClientSetCurrentRocket;
}

simulated function OutOfAmmo()
{
	// End:0x51
	if((((Instigator == none) || !Instigator.IsLocallyControlled()) || HasAmmo()) || (CurrentRocket != none) && bLaserOn || bCamView)
	{
		return;
	}
	DoAutoSwitch();
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	G5Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
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
	TickLaser(0.0500000);
	// End:0x31
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
	AimComponent.AimSpread = LaserAimSpread;
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
		G5Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0xDD
	if(Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading && (AmmoAmount(0)) > 1)
	{
		SetBoneScale(0, 1.0000000, 'Rocket');
	}
	//return;	
}

function ServerSetRocketTarget(Vector loc)
{
	TargetLocation = loc;
	// End:0x41
	if((CurrentRocket != none) && G5SeekerRocket(CurrentRocket) != none)
	{
		G5SeekerRocket(CurrentRocket).SetTargetLocation(loc);
	}
	// End:0x65
	if(ThirdPersonActor != none)
	{
		G5Attachment(ThirdPersonActor).LaserEndLoc = loc;
	}
	//return;	
}

simulated function TickLaser(float dt)
{
	local Vector Start, End, HitLocation, HitNormal, AimDir;

	local Actor Other;

	// End:0xA8
	if((((((int(ClientState) == int(1)) || Instigator == none) || !bLaserOn) || bScopeView) || bCamView && bScopeHeld) || ((bCamView && CurrentRocket != none) && PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).ViewTarget == CurrentRocket)
	{
		return;
	}
	// End:0x145
	if(Instigator.IsFirstPerson() && ((int(ReloadState) != int(0)) || int(ClientState) != int(4)) || (Level.TimeSeconds - FireMode[0].NextFireTime) <= 0.2000000)
	{
		AimDir = Vector(GetBoneRotation('tip2'));
		Start = Instigator.Location + Instigator.EyePosition();		
	}
	else
	{
		AimDir = BallisticFire(FireMode[0]).GetFireDir(Start);
	}
	End = Start + (Normal(AimDir) * float(10000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x224
	if((G5MortarDamageHull(Other) != none) && Other.Owner == Instigator)
	{
		Other = FireMode[0].Trace(HitLocation, HitNormal, End, HitLocation + ((Normal(AimDir) * Other.CollisionRadius) * float(3)), true);
	}
	// End:0x23A
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x258
	if(int(Role) == int(ROLE_Authority))
	{
		ServerSetRocketTarget(HitLocation);		
	}
	else
	{
		// End:0x27C
		if(ThirdPersonActor != none)
		{
			G5Attachment(ThirdPersonActor).LaserEndLoc = HitLocation;
		}
		TargetLocation = HitLocation;
		// End:0x2C5
		if((Level.TimeSeconds - LastSendTargetTime) > 0.0400000)
		{
			LastSendTargetTime = Level.TimeSeconds;
			ServerSetRocketTarget(HitLocation);
		}
	}
	//return;	
}

simulated function DrawLaserSight(Canvas Canvas)
{
	local Vector HitLocation, Scale3D, loc;

	// End:0x5A
	if((((((int(ClientState) == int(1)) || !bLaserOn) || bScopeView) || Instigator == none) || Instigator.Controller == none) || Laser == none)
	{
		return;
	}
	loc = GetBoneCoords('tip2').Origin;
	// End:0xCC
	if(((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(TargetLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0xEE
	if(LaserDot != none)
	{
		LaserDot.SetLocation(TargetLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(TargetLocation, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x1C6
	if(((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
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

simulated function OnScopeViewChanged()
{
	super.OnScopeViewChanged();
	// End:0x54
	if(!bScopeView)
	{
		// End:0x42
		if((Target != none) && targettime >= LockOnTime)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LockOffSound);
		}
		Target = none;
		targettime = 0.0000000;
	}
	//return;	
}

simulated function StartScopeZoom()
{
	// End:0x25
	if(ZoomInSound.Sound != none)
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ZoomInSound);
	}
	// End:0x68
	if(!bCamView && Instigator.Controller.IsA('PlayerController'))
	{
		PlayerZoom(PlayerController(Instigator.Controller));
	}
	//return;	
}

simulated function ScopeUpAnimEnd()
{
	// End:0x12
	if(bCamView)
	{
		CameraView();		
	}
	else
	{
		super.ScopeUpAnimEnd();
	}
	//return;	
}

simulated function ScopeDownAnimEnd()
{
	// End:0x4B
	if(((MagAmmo == 1) && bNeedCock) && (!bLaserOn || CurrentRocket == none) || G5SeekerRocket(CurrentRocket) == none)
	{
		CommonCockGun();		
	}
	else
	{
		super.ScopeDownAnimEnd();
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x5E
	if(super.PutDown())
	{
		KillLaserDot();
		// End:0x30
		if(ThirdPersonActor != none)
		{
			G5Attachment(ThirdPersonActor).bLaserOn = false;
		}
		// End:0x4D
		if(MagAmmo < 2)
		{
			SetBoneScale(0, 0.0000000, 'Rocket');
		}
		// End:0x5C
		if(bCamView)
		{
			PlayerView();
		}
		return true;
	}
	return false;
	//return;	
}

simulated event OldRenderOverlays(Canvas C)
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
	RenderOverlays(C);
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
	// End:0x35
	if((Instigator != none) && Instigator.IsLocallyControlled())
	{
		TickLaser(dt);
	}
	// End:0x6C
	if(!bScopeView || int(CurrentWeaponMode) != 1)
	{
		// End:0x6A
		if(int(Role) == int(ROLE_Authority))
		{
			targettime = 0.0000000;
		}
		return;
	}
	// End:0x7E
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	bWasLockedOn = targettime >= LockOnTime;
	Start = Instigator.Location + Instigator.EyePosition();
	bestAim = 0.9950000;
	NewTarget = Instigator.Controller.PickTarget(bestAim, BestDist, Vector(Instigator.GetViewRotation()), Start, 20000.0000000);
	// End:0x191
	if(NewTarget != none)
	{
		// End:0x134
		if(NewTarget != Target)
		{
			Target = NewTarget;
			targettime = 0.0000000;			
		}
		else
		{
			// End:0x16E
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
	// End:0x226
	if(Instigator.IsLocallyControlled())
	{
		// End:0x1F7
		if(!bWasLockedOn && targettime >= LockOnTime)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LockOnSound);			
		}
		else
		{
			// End:0x226
			if((targettime < LockOnTime) && bWasLockedOn)
			{
				Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LockOffSound);
			}
		}
	}
	bLockedOn = targettime >= LockOnTime;
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
	if(int(CurrentWeaponMode) == 1)
	{
		C.DrawTextJustified("TOP ATTACK MODE", 1, (C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY / float(2)) - (float(160) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (XL / float(2)), ((C.ClipY / float(2)) - (float(160) * ScaleFactor)) + (XY / float(2)));		
	}
	else
	{
		// End:0x2E2
		if(int(CurrentWeaponMode) == 0)
		{
			C.DrawTextJustified("DIRECT ATTACK MODE", 1, (C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY / float(2)) - (float(160) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (XL / float(2)), ((C.ClipY / float(2)) - (float(160) * ScaleFactor)) + (XY / float(2)));
		}
	}
	// End:0x3B2
	if(bNeedCock || MagAmmo == 0)
	{
		C.DrawTextJustified("RELOAD", 1, (C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY / float(2)) + (float(160) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (XL / float(2)), ((C.ClipY / float(2)) + (float(160) * ScaleFactor)) + (XY / float(2)));		
	}
	else
	{
		// End:0x47E
		if(Target == none)
		{
			C.DrawTextJustified("DISTANCE: N/A", 0, (C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY / float(2)) + (float(180) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (XL / float(2)), ((C.ClipY / float(2)) + (float(180) * ScaleFactor)) + (XY / float(2)));			
		}
		else
		{
			// End:0x61A
			if(!Instigator.Controller.LineOfSightTo(Target))
			{
				C.DrawTextJustified("TARGET LOST", 1, (C.ClipX / float(2)) - (float(100) * ScaleFactor), ((C.ClipY / float(2)) + (float(160) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (float(100) * ScaleFactor), ((C.ClipY / float(2)) + (float(160) * ScaleFactor)) + (XY / float(2)));
				C.DrawTextJustified("DISTANCE: N/A", 0, (C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY / float(2)) + (float(180) * ScaleFactor)) - (XY / float(2)), (C.ClipX / float(2)) + (XL / float(2)), ((C.ClipY / float(2)) + (float(180) * ScaleFactor)) + (XY / float(2)));				
			}
			else
			{
				// End:0x6F8
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
	// End:0xCEF
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
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	// End:0x60
	if(Vehicle(B.Enemy) != none)
	{
		return 1.2000000;
	}
	rating = super.GetAIRating();
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0xB2
	if(dist < float(1024))
	{
		return 0.4000000;
	}
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 3072.0000000, 4096.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.9000000;
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	bScopeHeld = true;
	bPendingSightUp = false;
	// End:0x6D
	if(bCamView && (CurrentRocket == none) || PlayerController(Instigator.Controller).ViewTarget == CurrentRocket)
	{
		PlayerView();
		bScopeHeld = false;
		// End:0x6B
		if(bScopeView)
		{
			StopScopeView();
		}
		return;
	}
	// End:0x98
	if(bScopeView)
	{
		// End:0x90
		if(bCamView)
		{
			bScopeHeld = false;
			StopScopeView();			
		}
		else
		{
			CameraView();
		}
		return;
	}
	// End:0xD4
	if((int(Instigator.Physics) == int(2)) || (SprintControl != none) && SprintControl.bSprinting)
	{
		return;
	}
	// End:0x13D
	if(AimComponent.AllowADS() && CurrentRocket != none)
	{
		PlayScopeUp();
		ReloadState = 0;
		ServerWeaponSpecial(i);
		bCamView = true;
		// End:0x13D
		if(G5Rocket(CurrentRocket) != none)
		{
			G5Rocket(CurrentRocket).__OnDie__Delegate = RocketDie;
		}
	}
	//return;	
}

simulated exec function WeaponSpecialRelease(optional byte i)
{
	ScopeViewRelease();
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	bServerReloading = false;
	ReloadState = 0;
	//return;	
}

simulated function ClientSetCurrentRocket(Actor proj)
{
	// End:0x5A
	if((int(Level.NetMode) == int(NM_Client)) && !bCamView)
	{
		// End:0x4F
		if(G5Rocket(proj) != none)
		{
			G5Rocket(proj).__OnDie__Delegate = RocketDie;
		}
		CurrentRocket = proj;
	}
	//return;	
}

simulated function SetCurrentRocket(Actor proj)
{
	// End:0x4A
	if(!bCamView)
	{
		// End:0x34
		if(G5Rocket(proj) != none)
		{
			G5Rocket(proj).__OnDie__Delegate = RocketDie;
		}
		CurrentRocket = proj;
		ClientSetCurrentRocket(proj);
	}
	//return;	
}

simulated function PlayerView()
{
	PlayerController(Instigator.Controller).SetViewTarget(Instigator);
	PlayerController(Instigator.Controller).DesiredFOV = PlayerController(Instigator.Controller).DefaultFOV;
	// End:0x77
	if(CurrentRocket != none)
	{
		CurrentRocket.bOwnerNoSee = false;
	}
	// End:0x89
	if(bScopeView)
	{
		StopScopeView();		
	}
	else
	{
		PlayScopeDown();
	}
	bCamView = false;
	//return;	
}

simulated function CameraView()
{
	// End:0x45
	if(bScopeView && Instigator.Controller.IsA('PlayerController'))
	{
		PlayerController(Instigator.Controller).EndZoom();
	}
	PlayerController(Instigator.Controller).SetViewTarget(CurrentRocket);
	CurrentRocket.bOwnerNoSee = true;
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	// End:0x16D
	if((CurrentRocket != none) && PlayerController(Instigator.Controller).ViewTarget == CurrentRocket)
	{
		Instigator.SetViewRotation(CurrentRocket.Rotation);
		Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
		Canvas.Style = 5;
		Canvas.SetPos(0.0000000, 0.0000000);
		Canvas.DrawColor.A = 48;
		Canvas.DrawTile(Texture'BW_Core_WeaponTex.M50.Noise1', float(Canvas.SizeX), float(Canvas.SizeY), 0.0000000, 0.0000000, 256.0000000, 256.0000000);
		Canvas.DrawColor.A = byte(255);
		Canvas.SetPos(0.0000000, 0.0000000);
		Canvas.DrawTile(Texture'BW_Core_WeaponTex.M50.M50CamView', float(Canvas.SizeX), float(Canvas.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);		
	}
	else
	{
		OldRenderOverlays(Canvas);
	}
	//return;	
}

simulated exec function CockGun(optional byte Type)
{
	// End:0x14
	if(bNeedCock)
	{
		super.CockGun(Type);
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x47
	if((int(ReloadState) == int(6)) && Anim == 'ReloadLoop')
	{
		PlayShovelEnd();
		ReloadState = 7;
		return;
	}
	// End:0x6A
	if((Anim == ZoomInAnim) && bCamView)
	{
		CameraView();		
	}
	else
	{
		super.AnimEnd(Channel);
	}
	//return;	
}

simulated function Notify_CockAfterFire()
{
	bPreventReload = false;
	// End:0x69
	if(Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading)
	{
		// End:0x66
		if((((AmmoAmount(0)) > 0) && bNeedCock) && (!bLaserOn || CurrentRocket == none) || G5SeekerRocket(CurrentRocket) == none)
		{
			CommonCockGun(1);
		}		
	}
	else
	{
		// End:0xB3
		if(((MagAmmo == 1) && bNeedCock) && (!bLaserOn || CurrentRocket == none) || G5SeekerRocket(CurrentRocket) == none)
		{
			CommonCockGun(1);
		}
	}
	//return;	
}

simulated function ClientRocketDie(Actor Rocket)
{
	// End:0x24
	if(int(Level.NetMode) == int(NM_Client))
	{
		RocketDie(Rocket);
	}
	//return;	
}

simulated function RocketDie(Actor Rocket)
{
	// End:0x3E
	if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && !Instigator.IsLocallyControlled())
	{
		ClientRocketDie(Rocket);
	}
	// End:0x5E
	if(bCamView && Rocket == CurrentRocket)
	{
		PlayerView();
	}
	// End:0xBE
	if(Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading)
	{
		// End:0xBB
		if((((AmmoAmount(0)) > 0) && bNeedCock) && ((Rocket == CurrentRocket) || CurrentRocket == none) || !bLaserOn)
		{
			CommonCockGun(1);
		}		
	}
	else
	{
		// End:0x107
		if(((MagAmmo == 1) && bNeedCock) && ((Rocket == CurrentRocket) || CurrentRocket == none) || !bLaserOn)
		{
			CommonCockGun(1);
		}
	}
	//return;	
}

simulated function PlayReload()
{
	bNeedCock = false;
	// End:0x62
	if(bScopeView && Instigator.Controller.IsA('PlayerController'))
	{
		PlayerController(Instigator.Controller).EndZoom();
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ZoomOutSound);
	}
	SetBoneScale(0, 1.0000000, 'Rocket');
	// End:0x90
	if(MagAmmo < 1)
	{
		PlayAnim('StartReloadEmpty', StartShovelAnimRate,, 0);		
	}
	else
	{
		PlayAnim('StartReload', ReloadAnimRate,, 0);
	}
	//return;	
}

simulated function PlayShovelLoop()
{
	// End:0x28
	if(MagAmmo < 1)
	{
		ClipInSound = default.ClipInSound;
		PlayAnim('ReloadLoopEmpty', ReloadAnimRate,, 0);		
	}
	else
	{
		ClipInSound = default.ClipOutSound;
		PlayAnim('ReloadLoop', ReloadAnimRate,, 0);
	}
	//return;	
}

simulated function PlayShovelEnd()
{
	// End:0x1D
	if(MagAmmo < 2)
	{
		SetBoneScale(0, 0.0000000, 'Rocket');
	}
	super.PlayShovelEnd();
	//return;	
}

simulated function Notify_G5HatchOpen()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, HatchSound);
	G5PrimaryFire(FireMode[0]).FlashHatchSmoke();
	//return;	
}

simulated function Notify_G5HideRocket()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x50
	if(!Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading || (AmmoAmount(0)) < 2)
	{
		SetBoneScale(0, 0.0000000, 'Rocket');
	}
	//return;	
}

defaultproperties
{
	HatchSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Lever',Volume=0.7000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	LockOnTime=1.5000000
	LockOnSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-TargetOn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	LockOffSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-TargetOff',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	LaserAimSpread=(Min=0,Max=256)
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;35.0;1.0;80.0;0.8;0.0;1.0")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BallisticProV55.G5WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.G5WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.G5WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.G5WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_G5'
	BigIconCoords=(X1=0,Y1=36,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Rocket",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Mortar",bUnavailable=false,ModeID="WM_SemiAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ScopeXScale=1.3330000
	ZoomInAnim="ZoomIn"
	ZoomOutAnim="ZoomOut"
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=2.0000000
	MaxZoom=8.0000000
	FullZoomFOV=10.0000000
	ScopeViewTex=Texture'BW_Core_WeaponTex.G5.G5ScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Lever',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ReloadAnim="ReloadLoop"
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Load',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-LoadHatch',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCanSkipReload=true
	bShovelLoad=true
	StartShovelAnim="StartReload"
	EndShovelAnim="FinishReload"
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.G5OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.G5InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=228),Color2=(R=255,G=255,B=0,A=228),StartSize1=97,StartSize2=103)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	bWT_Super=true
	ManualLines[0]="Fires a rocket. These rockets have an arming delay and will ricochet off surfaces when unarmed.|In Rocket mode, the rocket flies directly to the point of aim.|In Mortar mode, the rocket will fly upwards and then strike downwards upon the point of aim.|When scoped and in Mortar mode, targets focused directly upon by the weapon's scope may be highlighted in red; when this happens, the next Mortar shot will track the target until line of sight is broken. The target is notified of the lockon when the rocket is fired."
	ManualLines[1]="Toggles the guidance laser. With the guidance laser active, rockets will fly towards the point indicated by the laser at any given time."
	ManualLines[2]="When firing a mortar rocket. the Weapon Function key will cause the player to view through the rocket's nose camera.|As a bazooka, the G5 has no recoil. With the laser in use, its hipfire is stable, however it will always be lowered when the player jumps. The weapon is effective at medium to long range and with height advantage."
	SightingTime=0.5000000
	SightOffset=(X=-3.0000000,Y=-6.0000000,Z=4.5000000)
	StartShovelAnimRate=1.2500000
	EndShovelAnimRate=1.2500000
	FireModeClass[0]=Class'BallisticProV55.G5PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.G5SecondaryFire'
	SelectAnimRate=0.6000000
	PutDownAnimRate=0.8000000
	PutDownTime=0.8000000
	BringUpTime=1.0000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="Based on the original design by the legendary maniac Pirate, Var Dehidra, the G5 has undergone many alterations to become what it is today. The original bandit version was constructed by Var Dehidra to blast open armored cash transportation vehicles. Its name is derived from one of Dehidra's favourite targets, the G5 CTV 4x. It is now a very deadly weapon, used to destroy everything from tanks and structures to Skrith hordes and aircraft. The bombardement attack is a recent addition, replacing the original, primitive heat seeking function that caused it to target CTVs or backfire on the pirates' own craft, provided mainly for use in outdoor environments to destroy all manner of moving targets. The latest model also features a laser-painter device, allowing the user to guide the rocket wherever they wish."
	Priority=44
	HudColor=(R=50,G=150,B=25,A=255)
	CenteredOffsetY=10.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	PickupClass=Class'BallisticProV55.G5Pickup'
	PlayerViewOffset=(X=0.0000000,Y=8.0000000,Z=-3.0000000)
	AttachmentClass=Class'BallisticProV55.G5Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_G5'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="G5 Missile Launcher"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.G5Bazooka_FPm'
	DrawScale=0.3000000
}
