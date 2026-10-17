class RocketLauncher extends Weapon
	config(User);

const NUM_BARRELS = 3;
const BARREL_ROTATION_RATE = 2.95;

var float BarrelRotation;
var float FinalRotation;
var bool bRotateBarrel;
var Pawn SeekTarget;
var float LockTime;
var float UnLockTime;
var float SeekCheckTime;
var bool bLockedOn;
var bool bBreakLock;
var bool bTightSpread;
var() float SeekCheckFreq;
var() float SeekRange;
var() float LockRequiredTime;
var() float UnLockRequiredTime;
var() float LockAim;
var() Color CrossHairColor;
var() float CrosshairX;
var() float CrosshairY;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetOwner)
		bLockedOn;

	// Pos:0x018
	reliable if(int(Role) < int(ROLE_Authority))
		ServerClearTightSpread, ServerSetTightSpread;
}

function Tick(float dt)
{
	local Pawn Other;
	local Vector StartTrace;
	local Rotator Aim;
	local float BestDist, bestAim;

	// End:0x23
	if((Instigator == none) || Instigator.Weapon != self)
	{
		return;
	}
	// End:0x35
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x4B
	if(!Instigator.IsHumanControlled())
	{
		return;
	}
	// End:0x21A
	if(Level.TimeSeconds > SeekCheckTime)
	{
		// End:0x83
		if(bBreakLock)
		{
			bBreakLock = false;
			bLockedOn = false;
			SeekTarget = none;
		}
		StartTrace = Instigator.Location + Instigator.EyePosition();
		Aim = Instigator.GetViewRotation();
		bestAim = LockAim;
		Other = Instigator.Controller.PickTarget(bestAim, BestDist, Vector(Aim), StartTrace, SeekRange);
		// End:0x194
		if(CanLockOnTo(Other))
		{
			// End:0x170
			if(Other == SeekTarget)
			{
				LockTime += SeekCheckFreq;
				// End:0x16D
				if(!bLockedOn && LockTime >= LockRequiredTime)
				{
					bLockedOn = true;
					PlayerController(Instigator.Controller).ClientPlaySound(SoundGroup'WeaponSounds.RocketLauncher.LockOn');
				}				
			}
			else
			{
				SeekTarget = Other;
				LockTime = 0.0000000;
			}
			UnLockTime = 0.0000000;			
		}
		else
		{
			// End:0x1F7
			if(SeekTarget != none)
			{
				UnLockTime += SeekCheckFreq;
				// End:0x1F4
				if(UnLockTime >= UnLockRequiredTime)
				{
					SeekTarget = none;
					// End:0x1F4
					if(bLockedOn)
					{
						bLockedOn = false;
						PlayerController(Instigator.Controller).ClientPlaySound(SoundGroup'WeaponSounds.RocketLauncher.SeekLost');
					}
				}				
			}
			else
			{
				bLockedOn = false;
			}
		}
		SeekCheckTime = Level.TimeSeconds + SeekCheckFreq;
	}
	//return;	
}

function bool CanLockOnTo(Actor Other)
{
	local Pawn P;

	P = Pawn(Other);
	// End:0x44
	if(((P == none) || P == Instigator) || !P.bProjTarget)
	{
		return false;
	}
	// End:0x63
	if(!Level.Game.bTeamGame)
	{
		return true;
	}
	// End:0xA4
	if((Instigator.Controller != none) && Instigator.Controller.SameTeamAs(P.Controller))
	{
		return false;
	}
	return (P.PlayerReplicationInfo == none) || P.PlayerReplicationInfo.Team != Instigator.PlayerReplicationInfo.Team;
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	// End:0xE4
	if(bLockedOn)
	{
		Canvas.DrawColor = CrossHairColor;
		Canvas.DrawColor.A = byte(255);
		Canvas.Style = 5;
		Canvas.SetPos((float(Canvas.SizeX) * 0.5000000) - CrosshairX, (float(Canvas.SizeY) * 0.5000000) - CrosshairY);
		Canvas.DrawTile(Texture'XWeapons_rc.Icons.SniperArrows', CrosshairX * 2.0000000, CrosshairY * 2.0000000, 0.0000000, 0.0000000, float(Texture'XWeapons_rc.Icons.SniperArrows'.USize), float(Texture'XWeapons_rc.Icons.SniperArrows'.VSize));
	}
	super.RenderOverlays(Canvas);
	//return;	
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local RocketProj Rocket;
	local SeekingRocketProj SeekingRocket;
	local Bot B;

	bBreakLock = true;
	B = Bot(Instigator.Controller);
	// End:0x153
	if((((((((B != none) && B.Skill > (float(2) + (float(5) * FRand()))) && FRand() < 0.6000000) && B.Target != none) && B.Target == B.Enemy) && VSize(B.Enemy.Location - B.Pawn.Location) > (float(2000) + (float(2000) * FRand()))) && (Level.TimeSeconds - B.LastSeenTime) < 0.4000000) && (Level.TimeSeconds - B.AcquireTime) > 1.5000000)
	{
		bLockedOn = true;
		SeekTarget = B.Enemy;
	}
	// End:0x1C7
	if(bLockedOn && SeekTarget != none)
	{
		SeekingRocket = Spawn(Class'XWeapons.SeekingRocketProj',,, Start, Dir);
		// End:0x190
		if(SeekingRocket == none)
		{
			return none;
		}
		SeekingRocket.Seeking = SeekTarget;
		// End:0x1BE
		if(B != none)
		{
			bLockedOn = false;
			SeekTarget = none;
		}
		return SeekingRocket;		
	}
	else
	{
		Rocket = Spawn(Class'XWeapons.RocketProj',,, Start, Dir);
		return Rocket;
	}
	//return;	
}

simulated function PlayIdle()
{
	LoopAnim(IdleAnim, IdleAnimRate, 0.2500000);
	//return;	
}

simulated function PlayFiring(bool plunge)
{
	// End:0x15
	if(plunge)
	{
		GotoState('AnimateLoad', 'Begin');
	}
	//return;	
}

simulated function PlayLoad(bool full)
{
	// End:0x17
	if(!full)
	{
		GotoState('AnimateLoad', 'Begin');
	}
	//return;	
}

simulated function AnimEnd(int Channel)
{
	// End:0x46
	if((Channel == 0) && int(ClientState) == int(4))
	{
		PlayIdle();
		// End:0x46
		if((int(Role) < int(ROLE_Authority)) && !HasAmmo())
		{
			DoAutoSwitch();
		}
	}
	//return;	
}

simulated function RotateBarrel()
{
	FinalRotation += (65535.0000000 / float(3));
	// End:0x39
	if(FinalRotation >= 65535.0000000)
	{
		FinalRotation -= 65535.0000000;
		BarrelRotation -= 65535.0000000;
	}
	bRotateBarrel = true;
	//return;	
}

simulated function UpdateBarrel(float dt)
{
	local Rotator R;

	BarrelRotation += (((dt * 65535.0000000) * 2.9500000) / float(3));
	// End:0x42
	if(BarrelRotation > FinalRotation)
	{
		BarrelRotation = FinalRotation;
		bRotateBarrel = false;
	}
	R.Roll = int(BarrelRotation);
	SetBoneRotation('Bone_Barrel', R, 0, 1.0000000);
	//return;	
}

simulated function plunge()
{
	PlayAnim('load', 0.8000000, 0.0000000, 1);
	PlayAnim('load', 0.8000000, 0.0000000, 2);
	//return;	
}

simulated event ClientStartFire(int Mode)
{
	local int OtherMode;

	// End:0x20
	if(RocketMultiFire(FireMode[Mode]) != none)
	{
		SetTightSpread(false);		
	}
	else
	{
		// End:0x35
		if(Mode == 0)
		{
			OtherMode = 1;			
		}
		else
		{
			OtherMode = 0;
		}
		// End:0x123
		if(FireMode[OtherMode].bIsFiring || FireMode[OtherMode].NextFireTime > Level.TimeSeconds)
		{
			// End:0xA0
			if(FireMode[OtherMode].load > float(0))
			{
				SetTightSpread(true);
			}
			// End:0x121
			if(bDebugging)
			{
				Log((("No RL reg fire because other firing " $ string(FireMode[OtherMode].bIsFiring)) $ " next fire ") $ string(FireMode[OtherMode].NextFireTime - Level.TimeSeconds));
			}
			return;
		}
	}
	super.ClientStartFire(Mode);
	//return;	
}

simulated function bool StartFire(int Mode)
{
	local int OtherMode;

	// End:0x15
	if(Mode == 0)
	{
		OtherMode = 1;		
	}
	else
	{
		OtherMode = 0;
	}
	// End:0x5F
	if(FireMode[OtherMode].bIsFiring || FireMode[OtherMode].NextFireTime > Level.TimeSeconds)
	{
		return false;
	}
	return super.StartFire(Mode);
	//return;	
}

simulated function SetTightSpread(bool bNew, optional bool bForce)
{
	// End:0x41
	if((bTightSpread != bNew) || bForce)
	{
		bTightSpread = bNew;
		// End:0x3B
		if(bTightSpread)
		{
			ServerSetTightSpread();			
		}
		else
		{
			ServerClearTightSpread();
		}
	}
	//return;	
}

function ServerClearTightSpread()
{
	bTightSpread = false;
	//return;	
}

function ServerSetTightSpread()
{
	bTightSpread = true;
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	SetTightSpread(false, true);
	// End:0x6F
	if(Instigator.IsLocallyControlled())
	{
		AnimBlendParams(1, 1.0000000, 0.0000000, 0.0000000, 'bone_shell');
		AnimBlendParams(2, 1.0000000, 0.0000000, 0.0000000, 'bone_feed');
		SetBoneRotation('Bone_Barrel', rot(0, 0, 0), 0, 1.0000000);
	}
	super.BringUp(PrevWeapon);
	//return;	
}

function float SuggestAttackStyle()
{
	local float enemyDist;

	enemyDist = VSize(Instigator.Controller.Enemy.Location - Owner.Location);
	// End:0x6C
	if(enemyDist < float(750))
	{
		// End:0x63
		if(enemyDist < float(500))
		{
			return -1.5000000;			
		}
		else
		{
			return -0.7000000;
		}		
	}
	else
	{
		// End:0x86
		if(enemyDist > float(1600))
		{
			return 0.5000000;			
		}
		else
		{
			return -0.1000000;
		}
	}
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float enemyDist, rating, ZDiff;
	local Vector enemyDir;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return AIRating;
	}
	// End:0xA0
	if(((Instigator.Base != none) && Instigator.Base.Velocity != vect(0.0000000, 0.0000000, 0.0000000)) && !B.CheckFutureSight(0.1000000))
	{
		return 0.1000000;
	}
	enemyDir = B.Enemy.Location - Instigator.Location;
	enemyDist = VSize(enemyDir);
	rating = AIRating;
	// End:0x179
	if(enemyDist < float(360))
	{
		// End:0x165
		if(Instigator.Weapon == self)
		{
			// End:0x165
			if((enemyDist > float(250)) || (Instigator.Health < 50) && Instigator.Health < (B.Enemy.Health - 30))
			{
				return rating;
			}
		}
		return 0.0500000 + (enemyDist * 0.0010000);
	}
	ZDiff = Instigator.Location.Z - B.Enemy.Location.Z;
	// End:0x1CD
	if(ZDiff > float(120))
	{
		rating += 0.2500000;		
	}
	else
	{
		// End:0x1ED
		if(ZDiff < float(-160))
		{
			rating -= 0.3500000;			
		}
		else
		{
			// End:0x20A
			if(ZDiff < float(-80))
			{
				rating -= 0.0500000;
			}
		}
	}
	// End:0x26C
	if(((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon) && enemyDist < float(2500))
	{
		rating += 0.2500000;
	}
	return rating;
	//return;	
}

function byte BestMode()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x7D
	if(((FRand() < 0.3000000) && !B.IsStrafing()) && int(Instigator.Physics) != int(2))
	{
		return 1;
	}
	return 0;
	//return;	
}

simulated state AnimateLoad
{
	simulated function Tick(float dt)
	{
		// End:0x14
		if(bRotateBarrel)
		{
			UpdateBarrel(dt);
		}
		//return;		
	}
Begin:

	Sleep(0.1500000);
	RotateBarrel();
	Sleep(0.0700000);
	PlayOwnedSound(SoundGroup'WeaponSounds.RocketLauncher.RocketLauncherLoad', 0,,,,, false);
	ClientPlayForceFeedback("RocketLauncherLoad");
	Sleep(0.2800000);
	plunge();
	PlayOwnedSound(Sound'WeaponSounds.RocketLauncher.RocketLauncherPlunger', 0,,,,, false);
	ClientPlayForceFeedback("RocketLauncherPlunger");
	Sleep(0.2900000);
	GotoState('None');
	stop;		
}

defaultproperties
{
	SeekCheckFreq=0.5000000
	SeekRange=8000.0000000
	LockRequiredTime=1.2500000
	UnLockRequiredTime=0.5000000
	LockAim=0.9960000
	CrossHairColor=(R=250,G=0,B=0,A=255)
	CrosshairX=16.0000000
	CrosshairY=16.0000000
	FireModeClass[0]=Class'XWeapons.RocketFire'
	FireModeClass[1]=Class'XWeapons.RocketMultiFire'
	SelectAnim="Pickup"
	PutDownAnim="PutDown"
	IdleAnimRate=0.5000000
	SelectSound=Sound'WeaponSounds.RocketLauncher.SwitchToRocketLauncher'
	SelectForce="SwitchToRocketLauncher"
	AIRating=0.7800000
	CurrentRating=0.7800000
	Description="The Trident Tri-barrel Rocket Launcher is extremely popular among competitors who enjoy more bang for their buck.|The rotating rear loading barrel design allows for both single- and multi-warhead launches, letting you place up to three dumb fire rockets on target.|The warheads are designed to deliver maximum concussive force to the target and surrounding area upon detonation."
	EffectOffset=(X=50.0000000,Y=1.0000000,Z=10.0000000)
	DisplayFOV=60.0000000
	Priority=14
	HudColor=(R=255,G=0,B=0,A=255)
	SmallViewOffset=(X=12.0000000,Y=14.0000000,Z=-6.0000000)
	CenteredOffsetY=-5.0000000
	CenteredYaw=-500
	CustomCrosshair=8
	CustomCrossHairColor=(R=255,G=0,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Triad2"
	InventoryGroup=8
	PickupClass=Class'XWeapons.RocketLauncherPickup'
	PlayerViewOffset=(X=0.0000000,Y=8.0000000,Z=0.0000000)
	PlayerViewPivot=(Pitch=0,Yaw=500,Roll=1000)
	BobDamping=1.5000000
	AttachmentClass=Class'XWeapons.RocketAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=253,Y1=146,X2=333,Y2=181)
	ItemName="Rocket Launcher"
	Mesh=SkeletalMesh'Weapons.RocketLauncher_1st'
	HighDetailOverlay=Combiner'UT2004Weapons.WeaponSpecMap2'
}
