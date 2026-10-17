class LK05Carbine extends BallisticWeapon
	config(BallisticProV55);

var byte GearStatus;
var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var() float LaserAimSpread;
var bool bSilenced;
var() name SilencerBone;
var() name SilencerBone2;
var() Sound SilencerOnSound;
var() Sound SilencerOffSound;
var() name SilencerOnAnim;
var() name SilencerOffAnim;
var Projector FlashLightProj;
var Emitter FlashLightEmitter;
var bool bLightsOn;
var bool bFirstDraw;
var Vector TorchOffset;
var() Sound TorchOnSound;
var() Sound TorchOffSound;
var() name ScopeBone;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerFlashLight, ServerSwitchLaser, 
		ServerSwitchSilencer;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x45
	if(bLaserOn != bOldLaserOn)
	{
		OnLaserSwitched();
		bOldLaserOn = bLaserOn;
		ClientSwitchLaser();
	}
	super(Weapon).PostNetReceive();
	//return;	
}

simulated function OnAimParamsChanged()
{
	super.OnAimParamsChanged();
	// End:0x15
	if(bSilenced)
	{
		ApplySuppressorAim();
	}
	// End:0x24
	if(bLaserOn)
	{
		ApplyLaserAim();
	}
	//return;	
}

function ServerSwitchSilencer(bool bNewValue)
{
	// End:0x30
	if(!Instigator.IsLocallyControlled())
	{
		LK05PrimaryFire(FireMode[0]).SwitchSilencerMode(bNewValue);
	}
	LK05Attachment(ThirdPersonActor).bSilenced = bNewValue;
	PlaySuppressorAttachment(bNewValue);
	bSilenced = bNewValue;
	bFireMode[0].bAISilent = bSilenced;
	//return;	
}

simulated exec function SwitchSilencer()
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
	bSilenced = !bSilenced;
	ServerSwitchSilencer(bSilenced);
	PlaySuppressorAttachment(bSilenced);
	OnSuppressorSwitched();
	LK05PrimaryFire(FireMode[0]).SwitchSilencerMode(bSilenced);
	LK05Attachment(ThirdPersonActor).IAOverride(bSilenced);
	//return;	
}

simulated function OnSuppressorSwitched()
{
	// End:0x12
	if(bSilenced)
	{
		ApplySuppressorAim();		
	}
	else
	{
		AimComponent.Recalculate();
	}
	//return;	
}

simulated function ApplySuppressorAim()
{
	AimComponent.AimSpread.Min *= 1.2000000;
	AimComponent.AimSpread.Max *= 1.2000000;
	//return;	
}

simulated function PlaySuppressorAttachment(bool bSuppressed)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 9;
	// End:0x34
	if(bSuppressed)
	{
		PlayAnim(SilencerOnAnim);		
	}
	else
	{
		PlayAnim(SilencerOffAnim);
	}
	//return;	
}

simulated function Notify_SilencerOn()
{
	PlaySound(SilencerOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOff()
{
	PlaySound(SilencerOffSound,, 0.5000000);
	SetBoneScale(0, 0.0000000, SilencerBone);
	SetBoneScale(1, 1.0000000, SilencerBone2);
	//return;	
}

simulated function Notify_SilencerShow()
{
	SetBoneScale(0, 1.0000000, SilencerBone);
	SetBoneScale(1, 0.0000000, SilencerBone2);
	//return;	
}

simulated function PlayReload()
{
	super.PlayReload();
	// End:0x23
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

simulated exec function WeaponSpecial(optional byte i)
{
	GearStatus++;
	// End:0x1D
	if(int(GearStatus) > 4)
	{
		GearStatus = 1;
	}
	// End:0xDA
	if(bool(int(GearStatus) & 1))
	{
		bLightsOn = !bLightsOn;
		ServerFlashLight(bLightsOn);
		// End:0xA6
		if(bLightsOn)
		{
			PlaySound(TorchOnSound,, 0.7000000,, 32.0000000);
			// End:0x84
			if(FlashLightEmitter == none)
			{
				FlashLightEmitter = Spawn(Class'BallisticProV55.MRS138TorchEffect', self,, Location);
			}
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(FlashLightEmitter, DrawScale);
			StartProjector();			
		}
		else
		{
			PlaySound(TorchOffSound,, 0.7000000,, 32.0000000);
			// End:0xD1
			if(FlashLightEmitter != none)
			{
				FlashLightEmitter.Destroy();
			}
			KillProjector();
		}		
	}
	else
	{
		ServerSwitchLaser(!bLaserOn);
		PlayIdle();
	}
	//return;	
}

function ServerFlashLight(bool bNew)
{
	bLightsOn = bNew;
	LK05Attachment(ThirdPersonActor).bLightsOn = bLightsOn;
	//return;	
}

simulated function StartProjector()
{
	// End:0x20
	if(FlashLightProj == none)
	{
		FlashLightProj = Spawn(Class'BallisticProV55.MRS138TorchProjector', self,, Location);
	}
	AttachToBone(FlashLightProj, 'tip4');
	FlashLightProj.SetRelativeLocation(TorchOffset);
	//return;	
}

simulated function KillProjector()
{
	// End:0x17
	if(FlashLightProj != none)
	{
		FlashLightProj.Destroy();
	}
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x2A
	if(!bLightsOn || int(ClientState) != int(4))
	{
		return;
	}
	// End:0x47
	if(!Instigator.IsFirstPerson())
	{
		KillProjector();		
	}
	else
	{
		// End:0x58
		if(FlashLightProj == none)
		{
			StartProjector();
		}
	}
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local Vector TazLoc;
	local Rotator TazRot;

	super.RenderOverlays(Canvas);
	// End:0x23
	if(!IsInState('Lowered'))
	{
		DrawLaserSight(Canvas);
	}
	// End:0x98
	if(bLightsOn)
	{
		TazLoc = GetBoneCoords('tip4').Origin;
		TazRot = GetBoneRotation('tip4');
		// End:0x98
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.SetLocation(TazLoc);
			FlashLightEmitter.SetRotation(TazRot);
			Canvas.DrawActor(FlashLightEmitter, false, false, DisplayFOV);
		}
	}
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

simulated function ApplyLaserAim()
{
	AimComponent.AimAdjustTime *= 1.5000000;
	AimComponent.AimSpread.Max *= 0.8000000;
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		LK05Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	OnLaserSwitched();
	// End:0x51
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	OnLaserSwitched();
	// End:0x2C
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
	//return;	
}

simulated function SpawnLaserDot(optional Vector loc)
{
	// End:0x20
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BallisticProV55.MD24LaserDot',,, loc);
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
	loc = GetBoneCoords('tip3').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xE7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x143
	if(((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x165
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = Class'BCoreProV55.BUtil'.static.ConvertFOVs(Instigator.Location + Instigator.EyePosition(), Instigator.GetViewRotation(), End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x2CE
	if(((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (FireMode[0].IsFiring() && (Level.TimeSeconds - FireMode[0].NextFireTime) > -0.0500000) || !FireMode[0].IsFiring() && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip3');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated function bool PutDown()
{
	// End:0xB0
	if(super.PutDown())
	{
		KillLaserDot();
		// End:0x30
		if(ThirdPersonActor != none)
		{
			LK05Attachment(ThirdPersonActor).bLaserOn = false;
		}
		KillProjector();
		// End:0x4D
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.Destroy();
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
	// End:0x4D
	if(FlashLightEmitter != none)
	{
		FlashLightEmitter.Destroy();
	}
	KillProjector();
	// End:0xBF
	if(Instigator != none)
	{
		Instigator.AmbientSound = UsedAmbientSound;
		Instigator.SoundVolume = default.SoundVolume;
		Instigator.SoundPitch = default.SoundPitch;
		Instigator.SoundRadius = default.SoundRadius;
		Instigator.bFullVolume = false;
	}
	super.Destroyed();
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x36
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		IdleAnim = 'OpenIdle';
		ReloadAnim = 'ReloadEmpty';		
	}
	else
	{
		IdleAnim = 'Idle';
		ReloadAnim = 'Reload';
	}
	super.BringUp(PrevWeapon);
	// End:0x98
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor');
	}
	// End:0xD1
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0x115
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
		ServerFlashLight(FRand() > 0.5000000);
	}
	// End:0x13E
	if(AIController(Instigator.Controller) != none)
	{
		bSilenced = FRand() > 0.5000000;
	}
	// End:0x15B
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
	}
	// End:0x192
	if(ThirdPersonActor != none)
	{
		LK05Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = true;
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0xE8
	if((((((((Anim == 'OpenFire') || Anim == 'Pullout') || Anim == 'PulloutFancy') || Anim == 'Fire') || Anim == 'SightFire') || Anim == 'OpenSightFire') || Anim == CockAnim) || Anim == ReloadAnim)
	{
		// End:0xD2
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'OpenIdle';
			ReloadAnim = 'ReloadEmpty';			
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

defaultproperties
{
	LaserOnSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserOffSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserAimSpread=64.0000000
	SilencerBone="Silencer"
	SilencerBone2="Silencer2"
	SilencerOnSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOff'
	SilencerOnAnim="SilencerOn"
	SilencerOffAnim="SilencerOff"
	TorchOffset=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	TorchOnSound=Sound'BW_Core_WeaponSound.MRS38.RSS-FlashClick'
	TorchOffSound=Sound'BW_Core_WeaponSound.MRS38.RSS-FlashClick'
	ScopeBone="EOTech"
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;30.0;0.9;80.0;0.7;0.7;0.4")
	AIReloadTime=1.0000000
	SightAnimScale=0.5000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.LK05WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.LK05WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.LK05WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.LK05WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.LK05.BigIcon_LK05'
	BigIconCoords=(X1=0,Y1=36,X2=511,Y2=225)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-PullOut',Volume=0.2230000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Putaway',Volume=0.2700000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.LK05.LK05-Cock',Volume=1.2000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.LK05.LK05-Cock',Volume=1.2000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.LK05.LK05-MagOut',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.LK05.LK05-MagIn',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50Out',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50In',USize1=128,VSize1=128,USize2=128,VSize2=128,Color1=(R=255,G=0,B=0,A=158),Color2=(R=255,G=255,B=0,A=255),StartSize1=75,StartSize2=72)
	bWT_Bullet=true
	ManualLines[0]="5.56 fire. Higher DPS than comparable weapons, but awkward recoil and highly visible tracers."
	ManualLines[1]="Attaches or removes the suppressor. When active, the suppressor reduces recoil and hides the muzzle flash. It also affects the rounds fired, reducing their velocity (and therefore, damage) and disabling their tracers."
	ManualLines[2]="The Weapon Function key, when used, first cycles between the weapon's laser sight and flashlight, and then activates both at once. Activate again to disable both. The laser sight provides a clear indication of where the barrel is pointing, which is useful when the weapon is suppressed, but compromises stealth.||Effective at close and medium range."
	SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
	CockingBringUpTime=1.1000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.LK05PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.LK05SecondaryFire'
	IdleAnimRate=0.5000000
	SelectAnimRate=1.6600000
	PutDownAnimRate=1.3300000
	PutDownTime=0.4000000
	BringUpTime=0.4500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	Priority=41
	HudColor=(R=255,G=48,B=24,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	PickupClass=Class'BWBP_SKC_Pro.LK05Pickup'
	PlayerViewOffset=(X=6.0000000,Y=3.5000000,Z=-2.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.LK05Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.LK05.SmallIcon_LK05'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="LK-05 Advanced Carbine"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.LK05_FPm'
	DrawScale=0.3000000
}
