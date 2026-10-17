class TAC30Cannon extends BallisticWeapon
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var float lastModeChangeTime;
var bool bLaserOn;
var LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var() Sound QuickCockSound;

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	GunLength = default.GunLength;
	// End:0x57
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor');
	}
	// End:0x90
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0xC5
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
	}
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = true;
	//return;	
}

simulated function ClientSwitchLaser()
{
	// End:0x26
	if(bLaserOn)
	{
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 3.7000000,, 32.0000000);		
	}
	else
	{
		KillLaserDot();
		PlaySound(LaserOffSound,, 3.7000000,, 32.0000000);
	}
	// End:0x62
	if(!IsInState('DualAction') && !IsInState('PendingDualAction'))
	{
		PlayIdle();
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
		LaserDot = Spawn(Class'BWBP_SKC_Pro.TAC30LaserDot',,, loc);
	}
	//return;	
}

simulated function PlayIdle()
{
	super.PlayIdle();
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
	// End:0x3F
	if(bLaserOn != default.bLaserOn)
	{
		default.bLaserOn = bLaserOn;
		ClientSwitchLaser();
	}
	super(Weapon).PostNetReceive();
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x25
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x11
	if(super.PutDown())
	{
		KillLaserDot();
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

	// End:0x4F
	if(((((int(ClientState) == int(1)) || !bLaserOn) || Instigator == none) || Instigator.Controller == none) || Laser == none)
	{
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	loc = GetBoneCoords('tip2').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xE7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x152
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x174
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x2A6
	if(((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (FireMode[0].IsFiring() && (Level.TimeSeconds - FireMode[0].NextFireTime) > -0.0500000) || !FireMode[0].IsFiring() && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.1000000)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip2');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	super.RenderOverlays(Canvas);
	// End:0x23
	if(!IsInState('Lowered'))
	{
		DrawLaserSight(Canvas);
	}
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
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	Result += ((dist - float(1000)) / float(2000));
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	// End:0x1F
	if(AIController(Instigator.Controller) == none)
	{
		return 0.5000000;
	}
	return AIController(Instigator.Controller).Skill / float(7);
	//return;	
}

function float SuggestDefenseStyle()
{
	local Bot B;
	local float Result, dist;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return -0.5000000;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Result = -1.0000000 * (B.Skill / float(6));
	Result *= (float(1) - (dist / float(4000)));
	return FClamp(Result, -1.0000000, -0.3000000);
	//return;	
}

simulated function Notify_BrassOut()
{
	//return;	
}

simulated function Notify_ManualBrassOut()
{
	bFireMode[0].EjectBrass();
	//return;	
}

defaultproperties
{
	LaserOnSound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOn'
	LaserOffSound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOff'
	QuickCockSound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-CockQuick'
	SpecialInfo[0]=(Id="EvoDefs",Info="360.0;30.0;0.9;120.0;0.0;3.0;0.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.TAC30WeaponParamsClassic'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Select',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Double Shot",bUnavailable=false,ModeID="WM_Burst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Single Shot",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-CockQuick',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=0.9000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-ClipOut1',Volume=2.0000000,Radius=24.0000000,Slot=3,Pitch=0.9000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-ClipIn',Volume=2.0000000,Radius=24.0000000,Slot=3,Pitch=0.9000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	PlayerSpeedFactor=0.8500000
	SightPivot=(Pitch=1024,Yaw=0,Roll=2048)
	SightOffset=(X=0.0000000,Y=10.0000000,Z=16.0000000)
	MagAmmo=10
	GunLength=32.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.TAC30PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.TAC30SecondaryFire'
	IdleAnimRate=0.1000000
	PutDownTime=1.5000000
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="TAC30 Autocannon||Manufacturer: UTC Defense Tech|Primary: 30mm HE Shell|Secondary: Tri-Barrel Blast||The SRAC-21/G 20mm Autocannon is the grenade launching variant of the SKAS-21 weapon system. It fires the highly potent FRAG-12 explosive round, which turns what is normally a close range suppression shotgun into a long range sniping cannon. It fires from the same electrically assisted, rotating triple-barrel system as the SKAS-21, which means that it can also be used with manual mode to further propel the generally low-impulse explosive charge. The explosive charges are designed to detonate on contact, which means the SRAC can be used in a similar fashion to a standard slug firing rifles. A laser sight is included on all SRACs due to a lack of back up iron sights. Handle with care, as this is one expensive gun."
	Priority=245
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	PickupClass=Class'BWBP_SKC_Pro.TAC30Pickup'
	PlayerViewOffset=(X=-4.0000000,Y=8.0000000,Z=-11.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.TAC30Attachment'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=30)
	ItemName="[B] TAC-30 Autocannon"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	DrawScale=0.2600000
}
