class Minigun extends Weapon
	config(User);

var float CurrentRoll;
var float RollSpeed;
var() xEmitter ShellCaseEmitter;
var() Vector AttachLoc;
var() Rotator AttachRot;
var int CurrentMode;
var() float GearRatio;
var() float GearOffset;
var() float Blend;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x21
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	ShellCaseEmitter = Spawn(Class'XEffects.ShellSpewer');
	// End:0x5F
	if(ShellCaseEmitter != none)
	{
		ShellCaseEmitter.Trigger(self, Instigator);
		AttachToBone(ShellCaseEmitter, 'shell');
	}
	//return;	
}

function DropFrom(Vector StartLocation)
{
	super.DropFrom(StartLocation);
	//return;	
}

simulated function OutOfAmmo()
{
	// End:0x2E
	if(((Instigator == none) || !Instigator.IsLocallyControlled()) || HasAmmo())
	{
		return;
	}
	Instigator.AmbientSound = none;
	Instigator.SoundVolume = Instigator.default.SoundVolume;
	DoAutoSwitch();
	//return;	
}

simulated function Destroyed()
{
	// End:0x1E
	if(ShellCaseEmitter != none)
	{
		ShellCaseEmitter.Destroy();
		ShellCaseEmitter = none;
	}
	super.Destroyed();
	//return;	
}

function bool BotFire(bool bFinished, optional name FiringMode)
{
	local int newmode;
	local Controller C;

	C = Instigator.Controller;
	newmode = int(BestMode());
	// End:0x52
	if(newmode == 0)
	{
		C.bFire = 1;
		C.bAltFire = 0;		
	}
	else
	{
		C.bFire = 0;
		C.bAltFire = 1;
	}
	// End:0x7F
	if(bFinished)
	{
		return true;
	}
	// End:0xB3
	if(FireMode[BotMode].bIsFiring && newmode != BotMode)
	{
		StopFire(BotMode);
	}
	// End:0xD7
	if(!ReadyToFire(newmode) || int(ClientState) != int(4))
	{
		return false;
	}
	BotMode = newmode;
	StartFire(newmode);
	return true;
	//return;	
}

function float GetAIRating()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x9E
	if(B.Enemy == none)
	{
		// End:0x98
		if((B.Target != none) && VSize(B.Target.Location - B.Pawn.Location) > float(8000))
		{
			return 0.5000000;
		}
		return AIRating;
	}
	// End:0xBF
	if(!B.EnemyVisible())
	{
		return AIRating - 0.1500000;
	}
	return AIRating * FMin(Pawn(Owner).DamageScaling, 1.5000000);
	//return;	
}

function byte BestMode()
{
	local float enemyDist;
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x57
	if(FireMode[0].bIsFiring)
	{
		return 0;		
	}
	else
	{
		// End:0x6E
		if(FireMode[1].bIsFiring)
		{
			return 1;
		}
	}
	enemyDist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0xB1
	if(enemyDist < float(2000))
	{
		return 0;
	}
	return 1;
	//return;	
}

simulated function SpawnShells(float amountPerSec)
{
	// End:0x1A
	if((ShellCaseEmitter == none) || !FirstPersonView())
	{
		return;
	}
	// End:0x41
	if(Bot(Instigator.Controller) != none)
	{
		ShellCaseEmitter.Destroy();
		return;
	}
	ShellCaseEmitter.mRegenRange[0] = amountPerSec;
	ShellCaseEmitter.mRegenRange[1] = amountPerSec;
	ShellCaseEmitter.Trigger(self, Instigator);
	//return;	
}

simulated function bool FirstPersonView()
{
	return (Instigator.IsLocallyControlled() && PlayerController(Instigator.Controller) != none) && !PlayerController(Instigator.Controller).bBehindView;
	//return;	
}

simulated function AnimEnd(int Channel)
{
	//return;	
}

simulated function UpdateRoll(float dt, float Speed, int Mode)
{
	local Rotator R;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xBF
	if(Mode == CurrentMode)
	{
		RollSpeed = Speed;
		CurrentRoll += (dt * RollSpeed);
		CurrentRoll = CurrentRoll % 65536.0000000;
		R.Roll = int(CurrentRoll);
		SetBoneRotation('Bone Barrels', R, 0, Blend);
		R.Roll = int(GearOffset + (float(R.Roll) * GearRatio));
		SetBoneRotation('Bone gear', R, 0, Blend);
	}
	//return;	
}

simulated function bool StartFire(int Mode)
{
	local bool bStart;

	// End:0x3A
	if(!MinigunFire(FireMode[0]).IsIdle() || !MinigunFire(FireMode[1]).IsIdle())
	{
		return false;
	}
	bStart = super.StartFire(Mode);
	// End:0x6A
	if(bStart)
	{
		FireMode[Mode].StartFiring();
	}
	return bStart;
	//return;	
}

simulated function DetachFromPawn(Pawn P)
{
	ReturnToIdle();
	super.DetachFromPawn(P);
	//return;	
}

simulated function bool PutDown()
{
	ReturnToIdle();
	return super.PutDown();
	//return;	
}

simulated function ReturnToIdle()
{
	local int Mode;

	Mode = 0;
	J0x07:

	// End:0x44 [Loop If]
	if(Mode < 2)
	{
		// End:0x3A
		if(FireMode[Mode] != none)
		{
			FireMode[Mode].GotoState('Idle');
		}
		Mode++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

defaultproperties
{
	AttachLoc=(X=-77.0000000,Y=6.0000000,Z=4.0000000)
	AttachRot=(Pitch=22000,Yaw=-16384,Roll=0)
	GearRatio=-2.3700000
	Blend=1.0000000
	FireModeClass[0]=Class'XWeapons.MinigunFire'
	FireModeClass[1]=Class'XWeapons.MinigunAltFire'
	PutDownAnim="PutDown"
	SelectSound=Sound'WeaponSounds.Minigun.SwitchToMiniGun'
	SelectForce="SwitchToMiniGun"
	AIRating=0.7100000
	CurrentRating=0.7100000
	Description="The Schultz-Metzger T23-A 23mm rotary cannon is capable of firing both high-velocity caseless ammunition and cased rounds. With an unloaded weight of only 8 kilograms, the T23 is portable and maneuverable, easily worn across the back when employing the optional carrying strap.|The T23-A is the rotary cannon of choice for the discerning soldier."
	EffectOffset=(X=100.0000000,Y=18.0000000,Z=-16.0000000)
	DisplayFOV=60.0000000
	Priority=9
	HudColor=(R=255,G=255,B=255,A=255)
	SmallViewOffset=(X=8.0000000,Y=1.0000000,Z=-2.0000000)
	CenteredOffsetY=-6.0000000
	CenteredRoll=0
	CenteredYaw=-500
	CustomCrosshair=12
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Circle1"
	InventoryGroup=6
	PickupClass=Class'XWeapons.MinigunPickup'
	PlayerViewOffset=(X=2.0000000,Y=-1.0000000,Z=0.0000000)
	PlayerViewPivot=(Pitch=0,Yaw=500,Roll=0)
	BobDamping=2.2500000
	AttachmentClass=Class'XWeapons.MinigunAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=246,Y1=80,X2=332,Y2=106)
	ItemName="Minigun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=255.0000000
	LightRadius=5.0000000
	LightPeriod=3
	Mesh=SkeletalMesh'Weapons.Minigun_1st'
	DrawScale=0.4000000
	SoundRadius=400.0000000
	HighDetailOverlay=Combiner'UT2004Weapons.WeaponSpecMap2'
}
