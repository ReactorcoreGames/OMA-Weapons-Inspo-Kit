class BallLauncher extends Weapon
	config(User)
	hidedropdown
	cacheexempt;

var() transient bool launchedBall;
var() transient Pawn PassTarget;
var() Sound PassAmbient;
var() Sound PassTargetLocked;
var() Sound PassTargetLost;
var() string PassTargetLockedForce;
var() string PassTargetLostForce;
var() float HealRate;
var transient float HealAccum;
var transient float SwitchTestTime;
var Actor AITarget;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		PassTarget;
}

simulated function OutOfAmmo()
{
	//return;	
}

function SynchronizeWeapon(Weapon ClientWeapon)
{
	// End:0x1F
	if(Instigator.PlayerReplicationInfo.HasFlag == none)
	{
		return;
	}
	// End:0x50
	if(Instigator.Controller != none)
	{
		Instigator.Controller.ClientSetWeapon(Class);
	}
	//return;	
}

simulated function DrawWeaponInfo(Canvas Canvas)
{
	NewDrawWeaponInfo(Canvas, 0.0000000);
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas Canvas, float YPos)
{
	local xPlayer PC;

	PC = xPlayer(Instigator.Controller);
	// End:0x26
	if(PC == none)
	{
		return;
	}
	// End:0x5D
	if(PassTarget != none)
	{
		PC.myHUD.SetTargeting(true, PassTarget.Location, 1.0000000);
	}
	PC.myHUD.DrawTargeting(Canvas);
	PC.myHUD.SetTargeting(false);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp();
	// End:0x44
	if(Instigator.IsLocallyControlled() && !PrevWeapon.IsA('BallLauncher'))
	{
		Instigator.PendingWeapon = PrevWeapon;
	}
	FireMode[0].bIsFiring = true;
	FireMode[0].bNowWaiting = true;
	//return;	
}

simulated function Weapon NextWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	// End:0x1D
	if(CurrentWeapon == self)
	{
		return Instigator.PendingWeapon;		
	}
	else
	{
		return super.NextWeapon(CurrentChoice, CurrentWeapon);
	}
	//return;	
}

simulated function Weapon PrevWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	// End:0x1D
	if(CurrentWeapon == self)
	{
		return Instigator.PendingWeapon;		
	}
	else
	{
		return super.PrevWeapon(CurrentChoice, CurrentWeapon);
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x37
	if(launchedBall || Instigator.PlayerReplicationInfo.HasFlag == none)
	{
		launchedBall = false;
		return super.PutDown();
	}
	// End:0x5B
	if(Instigator.PendingWeapon == self)
	{
		Instigator.PendingWeapon = none;
	}
	return false;
	//return;	
}

function SetPassTarget(Pawn passTarg)
{
	// End:0x59
	if(((PassTarget != none) && PassTarget != passTarg) && PlayerController(PassTarget.Controller) != none)
	{
		PlayerController(PassTarget.Controller).ClientPlaySound(PassTargetLost);
	}
	PassTarget = passTarg;
	// End:0x94
	if(PassTarget == none)
	{
		Level.Game.GameReplicationInfo.FlagTarget = none;		
	}
	else
	{
		Level.Game.GameReplicationInfo.FlagTarget = PassTarget.PlayerReplicationInfo;
	}
	// End:0x12E
	if(PlayerController(Instigator.Controller) != none)
	{
		// End:0x10C
		if(passTarg != none)
		{
			PlayerController(Instigator.Controller).ClientPlaySound(PassTargetLocked);			
		}
		else
		{
			PlayerController(Instigator.Controller).ClientPlaySound(PassTargetLost);
		}
	}
	// End:0x176
	if((PassTarget != none) && PlayerController(PassTarget.Controller) != none)
	{
		PlayerController(PassTarget.Controller).ClientPlaySound(PassTargetLocked);
	}
	//return;	
}

function ModifyPawn(float dt)
{
	// End:0xC0
	if((Instigator.Weapon == self) && Instigator.PlayerReplicationInfo.HasFlag != none)
	{
		// End:0xC0
		if(float(Instigator.Health) < Instigator.HealthMax)
		{
			HealAccum += (HealRate * dt);
			// End:0xC0
			if(HealAccum > float(1))
			{
				Instigator.Health = Min(int(Instigator.HealthMax), int(float(Instigator.Health) + HealAccum));
				HealAccum -= float(int(HealAccum));
			}
		}
	}
	// End:0x127
	if((Instigator.Weapon != self) && Instigator.PlayerReplicationInfo.HasFlag != none)
	{
		xBombFlag(Instigator.PlayerReplicationInfo.HasFlag).SetHolder(Instigator.Controller);
	}
	//return;	
}

simulated function Tick(float dt)
{
	// End:0x3E
	if(((int(Level.NetMode) == int(NM_Client)) || Instigator == none) || Instigator.PlayerReplicationInfo == none)
	{
		return;
	}
	// End:0x107
	if(Instigator.PlayerReplicationInfo.HasFlag == none)
	{
		// End:0xE6
		if((Level.TimeSeconds - SwitchTestTime) > 0.8000000)
		{
			// End:0xD2
			if((Instigator.Weapon == self) && (Instigator.PendingWeapon == none) || Instigator.PendingWeapon == self)
			{
				Instigator.Controller.ClientSwitchToBestWeapon();
			}
			SwitchTestTime = Level.TimeSeconds;
		}
		// End:0x105
		if(Instigator.AmbientSound == PassAmbient)
		{
			AmbientSound = none;
		}
		return;
	}
	// End:0x1EC
	if((Level.TimeSeconds - SwitchTestTime) > 0.5000000)
	{
		// End:0x182
		if((Instigator.Weapon != self) && Instigator.PendingWeapon != self)
		{
			// End:0x162
			if(PassTarget != none)
			{
				SetPassTarget(none);
			}
			Instigator.Controller.ClientSetWeapon(Class'XWeapons.BallLauncher');			
		}
		else
		{
			// End:0x1D8
			if((PassTarget != none) && (PassTarget.Controller == none) || VSize(PassTarget.Location - Instigator.Location) > float(6000))
			{
				SetPassTarget(none);
			}
		}
		SwitchTestTime = Level.TimeSeconds;
	}
	ModifyPawn(dt);
	//return;	
}

simulated function bool StartFire(int modeNum)
{
	local bool bResult;

	bResult = super.StartFire(modeNum);
	// End:0x47
	if(bResult)
	{
		// End:0x3C
		if(modeNum == 0)
		{
			launchedBall = true;
			ClientPlayForceFeedback(PassTargetLockedForce);			
		}
		else
		{
			ClientPlayForceFeedback(PassTargetLostForce);
		}
	}
	return bResult;
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x24
	if(xBombFlag(Instigator.PlayerReplicationInfo.HasFlag) != none)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function Weapon RecommendWeapon(out float rating)
{
	local Weapon Recommended;
	local float oldRating;

	// End:0x2F
	if(xBombFlag(Instigator.PlayerReplicationInfo.HasFlag) != none)
	{
		rating = 10000000.0000000;
		return self;
	}
	// End:0x70
	if(Inventory != none)
	{
		Recommended = Inventory.RecommendWeapon(oldRating);
		// End:0x70
		if(Recommended != none)
		{
			rating = oldRating;
			return Recommended;
		}
	}
	return none;
	//return;	
}

function bool CanAttack(Actor Other)
{
	return true;
	//return;	
}

function SetAITarget(Actor t)
{
	AITarget = t;
	//return;	
}

function bool BotFire(bool bFinished, optional name FiringMode)
{
	local xBombFlag Bomb;
	local Vector ShootLoc;
	local Bot B;

	Bomb = xBombFlag(Instigator.PlayerReplicationInfo.HasFlag);
	B = Bot(Instigator.Controller);
	// End:0x7C
	if((!B.bPlannedShot || Bomb == none) || AITarget == none)
	{
		B.bPlannedShot = false;
		return false;
	}
	ShootLoc = AITarget.Location;
	Bomb.PassTarget = none;
	// End:0x11C
	if(Pawn(AITarget) != none)
	{
		ShootLoc = ShootLoc + ((0.5000000 * (VSize(ShootLoc - Bomb.Location) / Bomb.ThrowSpeed)) * Pawn(AITarget).Velocity);
		Bomb.PassTarget = Pawn(AITarget);		
	}
	else
	{
		// End:0x183
		if((GameObjective(AITarget) == none) && AITarget.Location.Z <= Bomb.Location.Z)
		{
			ShootLoc = ShootLoc - (AITarget.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000));
		}
	}
	return ShootHoop(B, ShootLoc);
	//return;	
}

function bool ShootHoop(Controller B, Vector ShootLoc)
{
	local xBombFlag Bomb;

	Bomb = xBombFlag(Instigator.PlayerReplicationInfo.HasFlag);
	FireMode[0].PlayFiring();
	FireMode[0].FlashMuzzleFlash();
	FireMode[0].StartMuzzleSmoke();
	IncrementFlashCount(0);
	launchedBall = true;
	Bomb.Throw(Instigator.Location, B.AdjustToss(Bomb.ThrowSpeed, Bomb.Location, ShootLoc, true));
	// End:0xD8
	if(Bot(B) != none)
	{
		Bot(B).bPlannedShot = false;
	}
	AITarget = none;
	return true;
	//return;	
}

defaultproperties
{
	PassAmbient=Sound'IndoorAmbience.machinery36'
	PassTargetLocked=Sound'WeaponSounds.BaseGunTech.BLockOn1'
	PassTargetLost=Sound'WeaponSounds.BaseGunTech.BSeekLost1'
	PassTargetLockedForce="LockOn"
	PassTargetLostForce="SeekLost"
	HealRate=5.0000000
	FireModeClass[0]=Class'XWeapons.BallShoot'
	FireModeClass[1]=Class'XWeapons.BallTarget'
	PutDownAnim="PutDown"
	PutDownAnimRate=2.5000000
	PutDownTime=0.2000000
	SelectSound=Sound'WeaponSounds.Misc.ballgun_change'
	SelectForce="ballgun_change"
	AIRating=0.1000000
	CurrentRating=0.1000000
	bCanThrow=false
	bForceSwitch=true
	bNoVoluntarySwitch=true
	bNoInstagibReplace=true
	EffectOffset=(X=30.0000000,Y=10.0000000,Z=-10.0000000)
	DisplayFOV=60.0000000
	Priority=17
	SmallViewOffset=(X=23.0000000,Y=6.0000000,Z=-6.0000000)
	CenteredOffsetY=-5.0000000
	CenteredRoll=5000
	CenteredYaw=-300
	CustomCrosshair=11
	CustomCrossHairColor=(R=255,G=255,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Bracket2"
	MinReloadPct=0.0000000
	InventoryGroup=15
	PlayerViewOffset=(X=11.0000000,Y=0.0000000,Z=0.0000000)
	BobDamping=2.2000000
	AttachmentClass=Class'XWeapons.BallAttachment'
	ItemName="Ball Launcher"
	Mesh=SkeletalMesh'Weapons.BallLauncher_1st'
	DrawScale=0.4000000
}
