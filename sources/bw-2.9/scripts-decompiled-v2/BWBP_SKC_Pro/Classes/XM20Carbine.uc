class XM20Carbine extends BallisticWeapon
	config(BallisticProV55);

var() bool bIsPrototype;
var() Sound DoubleVentSound;
var() Sound OverheatSound;
var float lastModeChangeTime;
var() Sound ModeCycleSound;
var int NumpadYOffset1;
var int NumpadYOffset2;
var int NumpadYOffset3;
var int NumpadYOffset4;
var int NumpadYOffset5;
var int NumpadXPosOnes;
var int NumpadXPosTens;
var int NumpadXScaleHunreds;
var() ScriptedTexture WeaponScreen;
var() Material WeaponScreenShader;
var() Material ScreenTex;
var() Material ScreenTexBase1;
var() Material ScreenTexBase2;
var() Material ScreenRedBar;
var() Material Numbers;
var protected const Color MyFontColor;
var() Actor HeatSteam;
var() Actor VentCore;
var() Actor VentBarrel;
var() Actor CoverGlow;
var() Actor glow1;
var() bool bLaserOn;
var() LaserActor Laser;
var() Emitter LaserBlast;
var() Emitter LaserDot;
var() bool bBigLaser;
var() bool bIsCharging;
var() bool bOvercharged;
var() bool bShieldEquipped;
var() bool bShieldUp;
var() bool bOldShieldUp;
var() bool bBroken;
var() name ShieldBone;
var() int ShieldPower;
var() int ShieldPowerMax;
var() float ShieldGainPerSecond;
var() float ShieldPowerFraction;
var() Sound ShieldHitSound;
var() FullSound ShieldOnSound;
var() FullSound ShieldOffSound;
var() Sound ShieldPierceSound;
var() string ShieldHitForce;
var() byte ShieldSoundVolume;
var() int PierceThreshold;
var() Sound ChargingSound;
var() Sound DamageSound;
var() Sound BrokenSound;
var() Actor ShieldTipFX;
var() Actor GlowFX;
var() XM20ShieldEffect XM20ShieldEffect;
var() float ChargeRate;
var() float ChargeRateOvercharge;
var() float LaserCharge;
var() float MaxCharge;
var() float Heat;
var() float CoolRate;
var float X1;
var float X2;
var float X3;
var float X4;
var float Y1;
var float Y2;
var float Y3;
var float Y4;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ChargeRate, ChargeRateOvercharge, 
		ClientScreenStart, ClientTakeHit, 
		bLaserOn, bOvercharged, 
		bShieldUp;

	// Pos:0x00D
	reliable if((bNetOwner && bNetDirty) && int(Role) == int(ROLE_Authority))
		ShieldPower, bBroken;

	// Pos:0x030
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSwitchShield;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bIsPrototype = false;
	bShieldEquipped = false;
	// End:0x69
	if(InStr(WeaponParams.LayoutTags, "prototype") != -1)
	{
		bIsPrototype = true;
		bOvercharged = true;
		ChargeRate = ChargeRateOvercharge;
		bBigLaser = true;
	}
	// End:0x93
	if(InStr(WeaponParams.LayoutTags, "shield") != -1)
	{
		bShieldEquipped = true;
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x24
	if(bShieldUp != bOldShieldUp)
	{
		bOldShieldUp = bShieldUp;
		AdjustShieldProperties();
	}
	super(Weapon).PostNetReceive();
	//return;	
}

simulated function ClientScreenStart()
{
	ScreenStart();
	//return;	
}

simulated function ScreenStart()
{
	// End:0x22
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Client = self;
	}
	Skins[1] = WeaponScreenShader;
	UpdateScreen();
	// End:0x57
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	local float ShieldCharge;

	ShieldCharge = float(ShieldPower) / float(ShieldPowerMax);
	Tex.DrawTile(0.0000000, 0.0000000, 512.0000000, 512.0000000, 0.0000000, 0.0000000, 512.0000000, 512.0000000, ScreenTex, MyFontColor);
	// End:0xD4
	if(!bShieldEquipped)
	{
		Tex.DrawTile(0.0000000, 512.0000000 - (float(512) * LaserCharge), 512.0000000, 512.0000000 * LaserCharge, 0.0000000, 512.0000000 - (float(512) * LaserCharge), 512.0000000, 512.0000000 * LaserCharge, ScreenRedBar, MyFontColor);		
	}
	else
	{
		// End:0x14C
		if(bShieldUp)
		{
			Tex.DrawTile(0.0000000, 512.0000000 - (float(512) * ShieldCharge), 512.0000000, 512.0000000 * ShieldCharge, 0.0000000, 512.0000000 - (float(512) * ShieldCharge), 512.0000000, 512.0000000 * ShieldCharge, ScreenRedBar, MyFontColor);
		}
	}
	// End:0x1DD
	if(!bNoMag)
	{
		Tex.DrawTile(80.0000000, 65.0000000, 250.0000000, 250.0000000, 45.0000000, float(NumpadYOffset1), 50.0000000, 50.0000000, Numbers, MyFontColor);
		Tex.DrawTile(220.0000000, 65.0000000, 250.0000000, 250.0000000, 45.0000000, float(NumpadYOffset2), 50.0000000, 50.0000000, Numbers, MyFontColor);
	}
	Tex.DrawTile(140.0000000, 300.0000000, float(NumpadXScaleHunreds), 120.0000000, 45.0000000, float(NumpadYOffset3), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(float(NumpadXPosTens), 300.0000000, 120.0000000, 120.0000000, 45.0000000, float(NumpadYOffset4), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(float(NumpadXPosOnes), 300.0000000, 120.0000000, 120.0000000, 45.0000000, float(NumpadYOffset5), 50.0000000, 50.0000000, Numbers, MyFontColor);
	//return;	
}

simulated function UpdateScreen()
{
	// End:0x33
	if(bIsPrototype || (Instigator != none) && AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x55
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated function bool ConsumeMagAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	local bool bSuper;

	bSuper = super.ConsumeMagAmmo(Mode, load, bAmountNeededIsMax);
	UpdateScreen();
	return bSuper;
	//return;	
}

simulated function Notify_ClipIn()
{
	super.Notify_ClipIn();
	UpdateScreen();
	//return;	
}

function int ManageHeatInteraction(Pawn P, int HeatPerShot)
{
	local XM20HeatManager HM;
	local int HeatBonus;

	// End:0x1D
	foreach P.BasedActors(Class'BWBP_SKC_Pro.XM20HeatManager', HM)
	{
		// End:0x1D
		break;		
	}	
	// End:0x6B
	if(HM == none)
	{
		HM = Spawn(Class'BWBP_SKC_Pro.XM20HeatManager', P,, P.Location + vect(0.0000000, 0.0000000, -30.0000000));
		HM.SetBase(P);
	}
	// End:0xCF
	if(HM != none)
	{
		HeatBonus = int(HM.Heat);
		// End:0xB9
		if(Vehicle(P) != none)
		{
			HM.AddHeat(float(HeatPerShot / 4));			
		}
		else
		{
			HM.AddHeat(float(HeatPerShot));
		}
	}
	return HeatBonus;
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x5E
	if((!bIsPrototype && Instigator != none) && AIController(Instigator.Controller) == none)
	{
		ScreenStart();
		// End:0x5E
		if(!Instigator.IsLocallyControlled())
		{
			ClientScreenStart();
		}
	}
	// End:0xC8
	if(bShieldEquipped && XM20ShieldEffect == none)
	{
		XM20ShieldEffect = Spawn(Class'BWBP_SKC_Pro.XM20ShieldEffect', Instigator);
		// End:0xC8
		if(Level.Game.bTeamGame && Instigator.GetTeamNum() == 0)
		{
			XM20ShieldEffect.SetRedSkin();
		}
	}
	// End:0x109
	if(((Instigator != none) && Laser == none) && AIController(Instigator.Controller) == none)
	{
		Laser = Spawn(Class'BWBP_SKC_Pro.LaserActor_XM20Red');
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x9E
	if(super.PutDown())
	{
		KillLaserDot();
		// End:0x30
		if(ThirdPersonActor != none)
		{
			XM20Attachment(ThirdPersonActor).bLaserOn = false;
		}
		// End:0x47
		if(glow1 != none)
		{
			glow1.Destroy();
		}
		// End:0x5E
		if(CoverGlow != none)
		{
			CoverGlow.Destroy();
		}
		// End:0x87
		if((int(Role) == int(ROLE_Authority)) && bShieldUp)
		{
			bShieldUp = false;
			AdjustShieldProperties();
		}
		// End:0x9E
		if(ShieldTipFX != none)
		{
			ShieldTipFX.Destroy();
		}
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	// End:0x36
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		WeaponScreen.Client = none;
	}
	// End:0x4D
	if(glow1 != none)
	{
		glow1.Destroy();
	}
	// End:0x64
	if(CoverGlow != none)
	{
		CoverGlow.Destroy();
	}
	// End:0x7B
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x92
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	// End:0xA9
	if(ShieldTipFX != none)
	{
		ShieldTipFX.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x77
	if(FireMode[1].bIsFiring && MagAmmo != 0)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(glow1, Class'BWBP_SKC_Pro.HMCBarrelGlowRed', DrawScale, self, 'tip');
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(CoverGlow, Class'BWBP_SKC_Pro.XM20GlowFX', DrawScale, self, 'CoreGlowL');		
	}
	else
	{
		// End:0x8E
		if(glow1 != none)
		{
			glow1.Destroy();
		}
		// End:0xA5
		if(CoverGlow != none)
		{
			CoverGlow.Destroy();
		}
	}
	//return;	
}

simulated function SetLaserCharge(float NewLaserCharge)
{
	LaserCharge = NewLaserCharge;
	//return;	
}

simulated function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x16
	if(FireMode[1].bIsFiring)
	{
		return;
	}
	PlaySound(ModeCycleSound,, 4.7000000,, 32.0000000);
	super.ServerSwitchWeaponMode(newmode);
	// End:0x64
	if(!Instigator.IsLocallyControlled())
	{
		XM20SecondaryFire(FireMode[1]).SwitchLaserMode(CurrentWeaponMode);
	}
	ClientSwitchLaserMode(CurrentWeaponMode);
	//return;	
}

simulated function ClientSwitchLaserMode(byte newmode)
{
	XM20SecondaryFire(FireMode[1]).SwitchLaserMode(newmode);
	// End:0x55
	if(int(newmode) == 2)
	{
		bBigLaser = true;
		// End:0x52
		if(ThirdPersonActor != none)
		{
			XM20Attachment(ThirdPersonActor).bBigLaser = true;
		}		
	}
	else
	{
		bBigLaser = false;
		// End:0x7E
		if(ThirdPersonActor != none)
		{
			XM20Attachment(ThirdPersonActor).bBigLaser = false;
		}
	}
	UpdateScreen();
	//return;	
}

simulated exec function ShieldDeploy(optional byte i)
{
	// End:0x1D
	if((int(ClientState) != int(4)) || bBroken)
	{
		return;
	}
	// End:0x3E
	if(bShieldUp)
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ShieldOffSound);		
	}
	else
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ShieldOnSound);
	}
	ServerSwitchShield(!bShieldUp);
	//return;	
}

function ServerSwitchShield(bool bNewValue)
{
	local XM20Attachment Attachment;

	bShieldUp = bNewValue;
	Attachment = XM20Attachment(ThirdPersonActor);
	// End:0x7E
	if((Attachment != none) && Attachment.XM20ShieldEffect3rd != none)
	{
		// End:0x64
		if(bShieldUp)
		{
			Attachment.XM20ShieldEffect3rd.bHidden = false;			
		}
		else
		{
			Attachment.XM20ShieldEffect3rd.bHidden = true;
		}
	}
	AdjustShieldProperties();
	//return;	
}

simulated function AdjustShieldProperties()
{
	local ShieldAttachment Attachment;

	// End:0xB3
	if(bShieldUp)
	{
		Instigator.AmbientSound = ChargingSound;
		Instigator.SoundVolume = ShieldSoundVolume;
		// End:0x6C
		if((Attachment != none) && Attachment.ShieldEffect3rd != none)
		{
			Attachment.ShieldEffect3rd.bHidden = false;
		}
		// End:0x9B
		if(ShieldTipFX == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(ShieldTipFX, Class'BWBP_SKC_Pro.M2020ShieldEffect', DrawScale, self, 'tip');
		}
		XM20ShieldEffect.Flash(0, ShieldPower);		
	}
	else
	{
		Attachment = ShieldAttachment(ThirdPersonActor);
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		// End:0x13E
		if((Attachment != none) && Attachment.ShieldEffect3rd != none)
		{
			Attachment.ShieldEffect3rd.bHidden = true;
			StopForceFeedback("ShieldNoise");
		}
		// End:0x15D
		if(ShieldTipFX != none)
		{
			Emitter(ShieldTipFX).Kill();
		}
	}
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x52
	if(ShieldPower < ShieldPowerMax)
	{
		// End:0x52
		if(!bShieldUp)
		{
			ShieldPowerFraction += (ShieldGainPerSecond * dt);
			J0x2D:

			// End:0x52 [Loop If]
			if(ShieldPowerFraction > 1.0000000)
			{
				++ShieldPower;
				ShieldPowerFraction -= 1.0000000;
				// [Loop Continue]
				goto J0x2D;
			}
		}
	}
	// End:0x83
	if(((int(Role) == int(ROLE_Authority)) && bBroken) && ShieldPower > 25)
	{
		bBroken = false;
	}
	super.Tick(dt);
	//return;	
}

function SetBrightness(bool bHit)
{
	local XM20Attachment Attachment;
	local float Brightness;

	Brightness = float(ShieldPower);
	// End:0x2E
	if(XM20ShieldEffect != none)
	{
		XM20ShieldEffect.SetBrightness(int(Brightness));
	}
	Attachment = XM20Attachment(ThirdPersonActor);
	// End:0x65
	if(Attachment != none)
	{
		Attachment.SetBrightness(int(Brightness), bHit);
	}
	//return;	
}

simulated function TakeHit(int Drain)
{
	// End:0x24
	if(XM20ShieldEffect != none)
	{
		XM20ShieldEffect.Flash(Drain, ShieldPower);
	}
	// End:0xB4
	if(ShieldPower <= 0)
	{
		bShieldUp = false;
		ServerSwitchShield(false);
		AdjustShieldProperties();
		bBroken = true;
		AmbientSound = none;
		Instigator.AmbientSound = BrokenSound;
		Instigator.SoundVolume = default.SoundVolume;
		Instigator.SoundPitch = default.SoundPitch;
		Instigator.SoundRadius = default.SoundRadius;
		Instigator.bFullVolume = true;
	}
	SetBrightness(true);
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local float Drain;
	local Vector Reflect, HitNormal;

	// End:0x45
	if(((instigatedBy != none) && instigatedBy.Controller != none) && instigatedBy.Controller.SameTeamAs(InstigatorController))
	{
		return;
	}
	// End:0x5A
	if(bBerserk)
	{
		Damage *= 0.7500000;
	}
	// End:0x70
	if(!DamageType.default.bArmorStops)
	{
		return;
	}
	// End:0x88
	if(!CheckReflect(HitLocation, HitNormal, 0))
	{
		return;
	}
	Drain = float(Min(ShieldPower, Damage));
	Reflect = MirrorVectorByNormal(Normal(Location - HitLocation), Vector(Instigator.Rotation));
	Damage -= int(Drain);
	Momentum *= float(2);
	ShieldPower -= int(Drain);
	DoReflectEffectA(int(Drain), Damage > PierceThreshold);
	//return;	
}

function DoReflectEffectA(int Drain, bool Pierce)
{
	// End:0x16
	if(Pierce)
	{
		PlaySound(ShieldPierceSound, 0);		
	}
	else
	{
		PlaySound(ShieldHitSound, 0);
	}
	ClientTakeHit(Drain);
	//return;	
}

simulated function ClientTakeHit(int Drain)
{
	ClientPlayForceFeedback(ShieldHitForce);
	TakeHit(Drain);
	//return;	
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int AmmoDrain)
{
	local Vector HitDir, FaceDir;

	// End:0x1A
	if(!bShieldUp || ShieldPower <= 0)
	{
		return false;
	}
	FaceDir = Vector(Instigator.Controller.Rotation);
	HitDir = Normal((Instigator.Location - HitLocation) + vect(0.0000000, 0.0000000, 8.0000000));
	RefNormal = FaceDir;
	// End:0x9F
	if((FaceDir Dot HitDir) < -0.3700000)
	{
		// End:0x9D
		if(AmmoDrain > 0)
		{
			ShieldPower -= AmmoDrain;
		}
		return true;
	}
	return false;
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
		XM20Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0x5E
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
		LaserDot = Spawn(Class'BWBP_SKC_Pro.IE_XM20Impact',,, loc);
	}
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
	// End:0x85
	if(bScopeView)
	{
		loc = Instigator.Location + (vect(0.0000000, 0.0000000, 1.0000000) * (Instigator.EyeHeight - float(8)));		
	}
	else
	{
		loc = GetBoneCoords('tip').Origin;
	}
	End = Start + (Normal(Vector(AimDir)) * float(3000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xFC
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x126
	if((int(ReloadState) == int(0)) && int(ClientState) == int(4))
	{
		bAimAligned = true;
	}
	// End:0x14A
	if(bAimAligned && Other != none)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x1FE
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		LaserDot.SetRotation(Rotator(HitNormal));
		LaserDot.Emitters[1].AutomaticInitialSpawning = Other.bWorldGeometry;
		LaserDot.Emitters[5].AutomaticInitialSpawning = Other.bWorldGeometry;
		Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	}
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x267
	if(bAimAligned)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	// End:0x2D6
	if(!bBigLaser)
	{
		Scale3D.Y = 4.0000000;
		Scale3D.Z = 4.0000000;		
	}
	else
	{
		Scale3D.Y = 9.0000000;
		Scale3D.Z = 9.0000000;
	}
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	local Coords Z;
	local float ScaleFactor;

	// End:0x70
	if(bShieldUp && XM20ShieldEffect != none)
	{
		Z = GetBoneCoords(ShieldBone);
		XM20ShieldEffect.SetLocation(Z.Origin);
		XM20ShieldEffect.SetRotation(Instigator.GetViewRotation());
		C.DrawActor(XM20ShieldEffect, false, false, DisplayFOV);
	}
	// End:0x8B
	if(int(CurrentWeaponMode) == 1)
	{
		ScreenTex = ScreenTexBase1;		
	}
	else
	{
		ScreenTex = ScreenTexBase2;
	}
	NumpadYOffset1 = 5 + ((MagAmmo / 10) * 49);
	NumpadYOffset2 = int(float(5) + ((float(MagAmmo) % float(10)) * float(49)));
	// End:0x160
	if(!bShieldEquipped)
	{
		NumpadYOffset3 = 5 + ((Ammo[0].AmmoAmount / 100) * 49);
		NumpadYOffset4 = int(float(5) + ((float(Ammo[0].AmmoAmount / 10) % float(10)) * float(49)));
		NumpadYOffset5 = int(float(5) + (((float(Ammo[0].AmmoAmount) % float(100)) % float(10)) * float(49)));		
	}
	else
	{
		NumpadYOffset3 = 5 + ((ShieldPower / 100) * 49);
		NumpadYOffset4 = int(float(5) + ((float(ShieldPower / 10) % float(10)) * float(49)));
		NumpadYOffset5 = int(float(5) + (((float(ShieldPower) % float(100)) % float(10)) * float(49)));
	}
	// End:0x211
	if((Ammo[0].AmmoAmount >= 100) || bShieldEquipped && ShieldPower >= 100)
	{
		NumpadXScaleHunreds = 120;
		NumpadXPosTens = 200;
		NumpadXPosOnes = 260;		
	}
	else
	{
		NumpadXScaleHunreds = 0;
		NumpadXPosTens = 170;
		NumpadXPosOnes = 230;
	}
	// End:0x292
	if(!bScopeView || bIsPrototype)
	{
		// End:0x26D
		if(Instigator.IsLocallyControlled() && !bIsPrototype)
		{
			WeaponScreen.Revision++;
		}
		super.RenderOverlays(C);
		// End:0x290
		if(!IsInState('Lowered'))
		{
			DrawLaserSight(C);
		}
		return;
	}
	SetLocation(Instigator.Location + Instigator.CalcDrawOffset(self));
	SetRotation(Instigator.GetViewRotation());
	ScaleFactor = C.ClipY / float(1200);
	// End:0x4C8
	if(ScopeViewTex != none)
	{
		C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
		C.SetPos(C.OrgX, C.OrgY);
		C.DrawTile(ScopeViewTex, float(C.SizeX - C.SizeY) / float(2), float(C.SizeY), 0.0000000, 0.0000000, 1.0000000, 1.0000000);
		C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
		C.DrawTile(ScopeViewTex, float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
		C.SetPos(float(C.SizeX - ((C.SizeX - C.SizeY) / 2)), C.OrgY);
		C.DrawTile(ScopeViewTex, float(C.SizeX - C.SizeY) / float(2), float(C.SizeY), 0.0000000, 0.0000000, 1.0000000, 1.0000000);
	}
	DrawLaserSight(C);
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
	local Bot B;
	local float Result, Height, dist, VDot;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return 0;		
	}
	else
	{
		// End:0x4E
		if(MagAmmo < 1)
		{
			return 1;
		}
	}
	// End:0x64
	if(int(CurrentWeaponMode) != 2)
	{
		CurrentWeaponMode = 2;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	VDot = Normal(B.Enemy.Velocity) Dot Normal(Instigator.Location - B.Enemy.Location);
	Result = FRand() - 0.3000000;
	// End:0x152
	if(dist > float(800))
	{
		Result -= ((dist - float(800)) / float(2000));
	}
	// End:0x192
	if((dist < float(500)) && VDot > 0.3000000)
	{
		Result -= ((float(500) - dist) / float(1000));
	}
	// End:0x1F9
	if(VSize(B.Enemy.Velocity) > float(50))
	{
		// End:0x1D1
		if(Abs(VDot) > 0.8000000)
		{
			Result += 0.1000000;
		}
		// End:0x1ED
		if(VDot < float(0))
		{
			Result -= 0.2000000;			
		}
		else
		{
			Result += 0.2000000;
		}
	}
	dist = VSize((B.Enemy.Location * vect(1.0000000, 1.0000000, 0.0000000)) - (Instigator.Location * vect(1.0000000, 1.0000000, 0.0000000)));
	// End:0x274
	if(Height < float(-100))
	{
		Result += Abs((Height / float(2)) / dist);
	}
	// End:0x286
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
	local float Result, dist;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return AIRating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Result = super.GetAIRating();
	// End:0xA9
	if(dist < float(500))
	{
		Result -= (float(1) - (dist / float(500)));		
	}
	else
	{
		// End:0xDB
		if(dist < float(3000))
		{
			Result += ((dist - float(1000)) / float(2000));			
		}
		else
		{
			Result = (Result + 0.6600000) - ((dist - float(3000)) / float(2500));
		}
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x1D
	if(bShieldEquipped)
	{
		return float(ShieldPower) / float(ShieldPowerMax);		
	}
	else
	{
		return FMin(LaserCharge, MaxCharge);
	}
	//return;	
}

defaultproperties
{
	ModeCycleSound=Sound'BWBP_SKC_Sounds.AH104.AH104-ModeCycle'
	WeaponScreen=ScriptedTexture'BWBP_SKC_Tex.XM20.XM20-ScriptLCD'
	WeaponScreenShader=Shader'BWBP_SKC_Tex.XM20.XM20-ScriptLCD-SD'
	ScreenTex=Texture'BWBP_SKC_Tex.XM20.XM20-ScreenBase'
	ScreenTexBase1=Texture'BWBP_SKC_Tex.XM20.XM20-ScreenBase'
	ScreenTexBase2=Texture'BWBP_SKC_Tex.XM20.XM20-ScreenBaseCharged'
	ScreenRedBar=Texture'BWBP_SKC_Tex.XM20.XM20-DisplayBars'
	Numbers=Texture'BWBP_SKC_Tex.XM20.XM20-Numbers'
	MyFontColor=(R=255,G=255,B=255,A=255)
	ShieldBone="tip"
	ShieldPower=100
	ShieldPowerMax=200
	ShieldGainPerSecond=5.0000000
	ShieldHitSound=ProceduralSound'WeaponSounds.ShieldGun.ShieldReflection'
	ShieldOnSound=(Sound=Sound'BWBP_SKC_Sounds.XM20.XM20-CockQuick',Volume=1.3000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ShieldOffSound=(Sound=Sound'BWBP_SKC_Sounds.XM20.XM20-CockQuickWarn',Volume=1.3000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ShieldPierceSound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-ShieldPierce'
	ShieldHitForce="ShieldReflection"
	ShieldSoundVolume=220
	PierceThreshold=50
	ChargingSound=Sound'WeaponSounds.BaseFiringSounds.BShield1'
	DamageSound=Sound'BWBP_SKC_Sounds.NEX.NEX-Overload'
	BrokenSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Ambient'
	ChargeRate=2.4000000
	ChargeRateOvercharge=0.6000000
	MaxCharge=1.0000000
	CoolRate=1.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;15.0;1.1;90.0;1.0;0.0;0.3")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.XM20WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.XM20WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.XM20WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.XM20WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.XM20.BigIcon_XM20'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.XM20.XM20-Deploy',Volume=0.8800000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-Deselect',Volume=0.8200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Laser: Quick Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FullZoomFOV=40.0000000
	ScopeViewTex=Texture'BWBP_SKC_Tex.XM20.XM20-ScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.XM20.XM20-CockQuick',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.XM20.XM20-CockQuick',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.XM20.XM20-MagClose',Volume=1.4200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.XM20.XM20-MagOpen',Volume=1.4200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	bWT_Bullet=true
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	bWT_Energy=true
	PlayerSpeedFactor=1.1000000
	PlayerJumpFactor=1.1000000
	UsedAmbientSound=Sound'BWBP_SKC_Sounds.XM20.XM20-Idle'
	SightOffset=(X=-2.0000000,Y=0.0000000,Z=2.8900000)
	MagAmmo=40
	CockingBringUpTime=1.2000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.XM20PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.XM20SecondaryFire'
	PutDownAnimRate=1.5000000
	PutDownTime=1.0000000
	BringUpTime=0.8000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bSniping=true
	bShowChargingBar=true
	Description="XM-20 Laser Carbine||Manufacturer: UTC Defense Tech|Primary: Laser Blasts|Secondary: Laser Stream||The XM-20 is an experimental laser weapon that has been designed to bypass the Skrith shielding technology that rendered most UTC energy weapons obsolete. Unlike earlier designs, the XM20 emits variable wavelength photons from an automated phase splitter which rapidly pulses Skrith shields. Fields tests have shown it to be effective so far, and UTC command has ordered this weapon into widespread phase 2 testing. An advanced version of the LS14 laser controller has been installed into this weapon, allowing it to switch between laser pulses or a sustained laser beam. The high powered beam is known to turn Cryon ballistic armor to slag with relative ease!"
	Priority=194
	HudColor=(R=150,G=0,B=25,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	GroupOffset=8
	PickupClass=Class'BWBP_SKC_Pro.XM20Pickup'
	PlayerViewOffset=(X=10.0000000,Y=5.0000000,Z=-7.5000000)
	AttachmentClass=Class'BWBP_SKC_Pro.XM20Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.XM20.SmallIcon_XM20'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="XM20 Laser Carbine"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.XM20_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=none
	Skins[2]=Texture'BWBP_SKC_Tex.XM20.XM20-Main'
	Skins[3]=Texture'BWBP_SKC_Tex.XM20.XM20-Misc'
	Skins[4]=Texture'ONSstructureTextures.CoreGroup.Invisible'
	bFullVolume=true
	SoundRadius=256.0000000
}
