class TyphonPDW extends BallisticWeapon
	config(BallisticProV55);

var bool bPierce;
var bool bBroken;
var name BulletBone;
var() name ShieldBone;
var float ShieldPower;
var Sound ShieldHitSound;
var Sound ShieldOnSound;
var Sound ShieldOffSound;
var Sound ShieldPierceSound;
var string ShieldHitForce;
var bool bShieldUp;
var bool bOldShieldUp;
var() Sound DamageSound;
var() Sound BrokenSound;
var() Sound ClipOutSoundEmpty;
var() ScriptedTexture WeaponScreen;
var int NumpadYOffset1;
var int NumpadYOffset2;
var int NumpadYOffset3;
var int NumpadYOffset4;
var int NumpadYOffset5;
var int NumpadYOffset6;
var() Material screen;
var() Material ScreenBaseX;
var() Material ScreenBaseY;
var() Material ScreenBase1;
var() Material ScreenBase2;
var() Material ScreenBase3;
var() Material ScreenBase4;
var() Material ScreenBase5;
var() Material Numbers;
var protected const Color MyFontColor;
var bool bRangeSet;
var Actor Arc;
var Actor GlowFX;
var PumaShieldEffect PumaShieldEffect;
var() float AmmoRegenTime;
var() float ChargeupTime;
var float RampTime;
var bool bIsCharging;
var Sound ChargingSound;
var() byte ShieldSoundVolume;
var float ChargeRate;
var float ChargeRateOvercharge;
var float LaserCharge;
var float MaxCharge;
var() float Heat;
var() float CoolRate;

replication
{
	// Pos:0x000
	reliable if((bNetOwner && bNetDirty) && int(Role) == int(ROLE_Authority))
		ShieldPower;

	// Pos:0x023
	reliable if(int(Role) == int(ROLE_Authority))
		ClientScreenStart, ClientSwitchCannonMode, 
		ClientTakeHit, bShieldUp;

	// Pos:0x030
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSwitchShield;
}

simulated event PostNetReceive()
{
	// End:0x2A
	if(bShieldUp != bOldShieldUp)
	{
		bOldShieldUp = bShieldUp;
		AdjustShieldProperties(bShieldUp);
	}
	super(Weapon).PostNetReceive();
	//return;	
}

simulated function CommonStartReload(optional byte i)
{
	local int M;

	// End:0x18
	if(int(ClientState) == int(2))
	{
		ClientState = 4;
	}
	// End:0x2C
	if(bShovelLoad)
	{
		ReloadState = 4;		
	}
	else
	{
		ReloadState = 1;
	}
	PlayReload();
	// End:0x62
	if(bScopeView && Instigator.IsLocallyControlled())
	{
		TemporaryScopeDown(default.SightingTime);
	}
	M = 0;
	J0x69:

	// End:0xAA [Loop If]
	if(M < 2)
	{
		// End:0xA0
		if(bFireMode[M] != none)
		{
			bFireMode[M].ReloadingGun(i);
		}
		M++;
		// [Loop Continue]
		goto J0x69;
	}
	// End:0xBB
	if(bCockAfterReload)
	{
		bNeedCock = true;
	}
	// End:0x101
	if((bCockOnEmpty && MagAmmo < 1) && Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
	{
		bNeedCock = true;
	}
	bNeedReload = false;
	//return;	
}

simulated function PlayReload()
{
	// End:0x26
	if(bShovelLoad)
	{
		SafePlayAnim(StartShovelAnim, StartShovelAnimRate,, 0, "RELOAD");		
	}
	else
	{
		// End:0x6F
		if(((MagAmmo < 1) && HasAnim(ReloadEmptyAnim)) && Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
		{
			SafePlayAnim(ReloadEmptyAnim, ReloadAnimRate,, 0, "RELOAD");			
		}
		else
		{
			SafePlayAnim(ReloadAnim, ReloadAnimRate,, 0, "RELOAD");
		}
	}
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
	Skins[6] = screen;
	ScreenBaseY = ScreenBase1;
	// End:0x5D
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated event Destroyed()
{
	// End:0x36
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		WeaponScreen.Client = none;
	}
	// End:0x4D
	if(Arc != none)
	{
		Arc.Destroy();
	}
	// End:0x64
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	// End:0xFE
	if(Instigator.AmbientSound != none)
	{
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;
	}
	super.Destroyed();
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	// End:0x4D
	if(bShieldUp)
	{
		Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenBaseX, MyFontColor);		
	}
	else
	{
		Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenBaseY, MyFontColor);
	}
	Tex.DrawTile(0.0000000, 70.0000000, 100.0000000, 100.0000000, 30.0000000, float(NumpadYOffset1), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(50.0000000, 70.0000000, 100.0000000, 100.0000000, 30.0000000, float(NumpadYOffset2), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(100.0000000, 70.0000000, 100.0000000, 100.0000000, 30.0000000, float(NumpadYOffset3), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(90.0000000, 5.0000000, 50.0000000, 50.0000000, 30.0000000, float(NumpadYOffset4), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(110.0000000, 5.0000000, 50.0000000, 50.0000000, 30.0000000, float(NumpadYOffset5), 50.0000000, 50.0000000, Numbers, MyFontColor);
	Tex.DrawTile(130.0000000, 5.0000000, 50.0000000, 50.0000000, 30.0000000, float(NumpadYOffset6), 50.0000000, 50.0000000, Numbers, MyFontColor);
	//return;	
}

simulated function UpdateScreen()
{
	// End:0x28
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x44
	if(ShieldPower < float(40))
	{
		ScreenBaseX = ScreenBase3;		
	}
	else
	{
		ScreenBaseX = ScreenBase2;
	}
	// End:0x69
	if(MagAmmo <= 5)
	{
		ScreenBaseY = ScreenBase4;		
	}
	else
	{
		ScreenBaseY = ScreenBase1;
	}
	// End:0x96
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x25
	if((int(CurrentWeaponMode) > 0) && FireMode[0].IsFiring())
	{
		return;
	}
	super.ServerSwitchWeaponMode(newmode);
	// End:0x5F
	if(!Instigator.IsLocallyControlled())
	{
		TyphonPDWPrimaryFire(FireMode[0]).SwitchCannonMode(CurrentWeaponMode);
	}
	ClientSwitchCannonMode(CurrentWeaponMode);
	//return;	
}

simulated function ClientSwitchCannonMode(byte newmode)
{
	TyphonPDWPrimaryFire(FireMode[0]).SwitchCannonMode(newmode);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x46
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		ScreenStart();
		// End:0x46
		if(!Instigator.IsLocallyControlled())
		{
			ClientScreenStart();
		}
	}
	SetBoneScale(0, 0.0000000, ShieldBone);
	// End:0x75
	if(PumaShieldEffect == none)
	{
		PumaShieldEffect = Spawn(Class'BWBP_SKC_Pro.PumaShieldEffect', Instigator);
	}
	super.BringUp(PrevWeapon);
	GunLength = default.GunLength;
	//return;	
}

simulated function bool PutDown()
{
	// End:0x17
	if(bShieldUp)
	{
		bShieldUp = false;
		AdjustShieldProperties();
	}
	// End:0x39
	if(super.PutDown())
	{
		// End:0x37
		if(Arc != none)
		{
			Arc.Destroy();
		}
		return true;
	}
	return false;
	//return;	
}

simulated function SetLaserCharge(float NewLaserCharge)
{
	LaserCharge = NewLaserCharge;
	//return;	
}

simulated exec function ShieldDeploy(optional byte i)
{
	// End:0x1D
	if((int(ClientState) != int(4)) || bBroken)
	{
		return;
	}
	// End:0x33
	if(bShieldUp)
	{
		PlaySound(ShieldOffSound, 0);		
	}
	else
	{
		PlaySound(ShieldOnSound, 0);
	}
	bShieldUp = !bShieldUp;
	ServerSwitchShield(bShieldUp);
	AdjustShieldProperties();
	//return;	
}

function ServerSwitchShield(bool bNewValue)
{
	local TyphonPDWAttachment Attachment;

	bShieldUp = bNewValue;
	Attachment = TyphonPDWAttachment(ThirdPersonActor);
	// End:0x7E
	if((Attachment != none) && Attachment.PumaShieldEffect3rd != none)
	{
		// End:0x64
		if(bShieldUp)
		{
			Attachment.PumaShieldEffect3rd.bHidden = false;			
		}
		else
		{
			Attachment.PumaShieldEffect3rd.bHidden = true;
		}
	}
	AdjustShieldProperties();
	//return;	
}

simulated function AdjustShieldProperties(optional bool bDepleted)
{
	local ShieldAttachment Attachment;

	// End:0xD5
	if((bShieldUp && !bDepleted) && !bBroken)
	{
		Instigator.AmbientSound = ChargingSound;
		Instigator.SoundVolume = ShieldSoundVolume;
		// End:0x86
		if((Attachment != none) && Attachment.ShieldEffect3rd != none)
		{
			Attachment.ShieldEffect3rd.bHidden = false;
		}
		UpdateScreen();
		// End:0xBB
		if(Arc == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc, Class'BWBP_SKC_Pro.M2020ShieldEffect', DrawScale, self, 'tip2');
		}
		PumaShieldEffect.Flash(0, int(ShieldPower));		
	}
	else
	{
		Attachment = ShieldAttachment(ThirdPersonActor);
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		// End:0x160
		if((Attachment != none) && Attachment.ShieldEffect3rd != none)
		{
			Attachment.ShieldEffect3rd.bHidden = true;
			StopForceFeedback("ShieldNoise");
		}
		// End:0x17F
		if(Arc != none)
		{
			Emitter(Arc).Kill();
		}
	}
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x46
	if(ShieldPower < float(100))
	{
		// End:0x46
		if(!bShieldUp && !bBroken)
		{
			ShieldPower = FMin(ShieldPower + (5.0000000 * dt), 100.0000000);
		}
	}
	super.Tick(dt);
	// End:0x7B
	if(FireMode[1].bIsFiring)
	{
		CoolRate = 0.0000000;
		bIsCharging = true;		
	}
	else
	{
		CoolRate = default.CoolRate;
		bIsCharging = false;
	}
	Heat = FMax(0.0000000, Heat - (CoolRate * dt));
	// End:0xD2
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Heat = 0.0000000;
	}
	//return;	
}

function SetBrightness(bool bHit)
{
	local TyphonPDWAttachment Attachment;
	local float Brightness;

	Brightness = ShieldPower;
	// End:0x2D
	if(RampTime < ChargeupTime)
	{
		Brightness *= (RampTime / ChargeupTime);
	}
	// End:0x4E
	if(PumaShieldEffect != none)
	{
		PumaShieldEffect.SetBrightness(int(Brightness));
	}
	Attachment = TyphonPDWAttachment(ThirdPersonActor);
	// End:0x85
	if(Attachment != none)
	{
		Attachment.SetBrightness(int(Brightness), bHit);
	}
	//return;	
}

simulated function TakeHit(int Drain)
{
	// End:0x26
	if(PumaShieldEffect != none)
	{
		PumaShieldEffect.Flash(Drain, int(ShieldPower));
	}
	// End:0x156
	if(ShieldPower < float(10))
	{
		ServerSwitchShield(false);
		bShieldUp = false;
		AdjustShieldProperties(true);
		// End:0x156
		if(ShieldPower <= float(-40))
		{
			bBroken = true;
			AmbientSound = none;
			Instigator.AmbientSound = BrokenSound;
			Instigator.SoundVolume = default.SoundVolume;
			Instigator.SoundPitch = default.SoundPitch;
			Instigator.SoundRadius = default.SoundRadius;
			Instigator.bFullVolume = true;
			// End:0x156
			if(((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2) && (GlowFX == none) || GlowFX.bDeleteMe)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BWBP_SKC_Pro.PumaGlowFXDamaged', DrawScale, self, 'tip2');
			}
		}
	}
	UpdateScreen();
	SetBrightness(true);
	//return;	
}

simulated event Timer()
{
	// End:0x24
	if(int(ClientState) == int(3))
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(GlowFX);
	}
	super.Timer();
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

simulated event RenderOverlays(Canvas Canvas)
{
	local Coords Z;

	// End:0x232
	if(bShieldUp)
	{
		// End:0x83
		if(ShieldPower >= float(100))
		{
			NumpadYOffset1 = 5 + ((int(ShieldPower) / 100) * 49);
			NumpadYOffset2 = int(float(5) + ((float(int(ShieldPower) / 10) % float(10)) * float(49)));
			NumpadYOffset3 = int(float(5) + (((float(int(ShieldPower)) % float(100)) % float(10)) * float(49)));			
		}
		else
		{
			// End:0xD8
			if(ShieldPower >= float(10))
			{
				NumpadYOffset1 = 5;
				NumpadYOffset2 = 5 + ((int(ShieldPower) / 10) * 49);
				NumpadYOffset3 = int(float(5) + ((float(int(ShieldPower)) % float(10)) * float(49)));				
			}
			else
			{
				// End:0x10D
				if(ShieldPower >= float(0))
				{
					NumpadYOffset1 = 5;
					NumpadYOffset2 = 5;
					NumpadYOffset3 = 5 + (int(ShieldPower) * 49);					
				}
				else
				{
					NumpadYOffset1 = 5;
					NumpadYOffset2 = 5;
					NumpadYOffset3 = 5;
				}
			}
		}
		// End:0x197
		if(MagAmmo >= 100)
		{
			NumpadYOffset4 = 5 + ((MagAmmo / 100) * 49);
			NumpadYOffset5 = int(float(5) + ((float(MagAmmo / 10) % float(10)) * float(49)));
			NumpadYOffset6 = int(float(5) + (((float(MagAmmo) % float(100)) % float(10)) * float(49)));			
		}
		else
		{
			// End:0x1E6
			if(MagAmmo >= 10)
			{
				NumpadYOffset4 = 5;
				NumpadYOffset5 = 5 + ((MagAmmo / 10) * 49);
				NumpadYOffset6 = int(float(5) + ((float(MagAmmo) % float(10)) * float(49)));				
			}
			else
			{
				// End:0x217
				if(MagAmmo >= 0)
				{
					NumpadYOffset4 = 5;
					NumpadYOffset5 = 5;
					NumpadYOffset6 = 5 + (MagAmmo * 49);					
				}
				else
				{
					NumpadYOffset4 = 5;
					NumpadYOffset5 = 5;
					NumpadYOffset6 = 5;
				}
			}
		}		
	}
	else
	{
		// End:0x2A4
		if(MagAmmo >= 100)
		{
			NumpadYOffset1 = 5 + ((MagAmmo / 100) * 49);
			NumpadYOffset2 = int(float(5) + ((float(MagAmmo / 10) % float(10)) * float(49)));
			NumpadYOffset3 = int(float(5) + (((float(MagAmmo) % float(100)) % float(10)) * float(49)));			
		}
		else
		{
			// End:0x2F3
			if(MagAmmo >= 10)
			{
				NumpadYOffset1 = 5;
				NumpadYOffset2 = 5 + ((MagAmmo / 10) * 49);
				NumpadYOffset3 = int(float(5) + ((float(MagAmmo) % float(10)) * float(49)));				
			}
			else
			{
				// End:0x324
				if(MagAmmo >= 0)
				{
					NumpadYOffset1 = 5;
					NumpadYOffset2 = 5;
					NumpadYOffset3 = 5 + (MagAmmo * 49);					
				}
				else
				{
					NumpadYOffset1 = 5;
					NumpadYOffset2 = 5;
					NumpadYOffset3 = 5;
				}
			}
		}
		// End:0x3B6
		if(ShieldPower >= float(100))
		{
			NumpadYOffset4 = 5 + ((int(ShieldPower) / 100) * 49);
			NumpadYOffset5 = int(float(5) + ((float(int(ShieldPower) / 10) % float(10)) * float(49)));
			NumpadYOffset6 = int(float(5) + (((float(int(ShieldPower)) % float(100)) % float(10)) * float(49)));			
		}
		else
		{
			// End:0x40B
			if(ShieldPower >= float(10))
			{
				NumpadYOffset4 = 5;
				NumpadYOffset5 = 5 + ((int(ShieldPower) / 10) * 49);
				NumpadYOffset6 = int(float(5) + ((float(int(ShieldPower)) % float(10)) * float(49)));				
			}
			else
			{
				// End:0x440
				if(ShieldPower >= float(0))
				{
					NumpadYOffset4 = 5;
					NumpadYOffset5 = 5;
					NumpadYOffset6 = 5 + (int(ShieldPower) * 49);					
				}
				else
				{
					NumpadYOffset4 = 5;
					NumpadYOffset5 = 5;
					NumpadYOffset6 = 5;
				}
			}
		}
	}
	// End:0x47A
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	// End:0x4EA
	if(bShieldUp && PumaShieldEffect != none)
	{
		Z = GetBoneCoords(ShieldBone);
		PumaShieldEffect.SetLocation(Z.Origin);
		PumaShieldEffect.SetRotation(Instigator.GetViewRotation());
		Canvas.DrawActor(PumaShieldEffect, false, false, DisplayFOV);
	}
	super.RenderOverlays(Canvas);
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local int Drain;
	local Vector Reflect, HitNormal;
	local float DamageMax;

	DamageMax = 50.0000000;
	// End:0x28
	if(DamageType == Class'Engine.fell')
	{
		DamageMax = 20.0000000;		
	}
	else
	{
		// End:0x52
		if((Class<DTXM84GrenadeRadius>(DamageType) != none) && bShieldUp)
		{
			ClientTakeHit(200, 200);
			return;			
		}
		else
		{
			// End:0x8A
			if(!DamageType.default.bArmorStops || (DamageType == Class'XWeapons.DamTypeShieldImpact') && instigatedBy == Instigator)
			{
				return;
			}
		}
	}
	// End:0x1D2
	if(CheckReflect(HitLocation, HitNormal, 0))
	{
		Drain = Min(int(ShieldPower * float(2)), Damage);
		Drain = Min(Drain, int(DamageMax));
		Reflect = MirrorVectorByNormal(Normal(Location - HitLocation), Vector(Instigator.Rotation));
		// End:0x115
		if(float(Damage) > DamageMax)
		{
			bPierce = true;
			Drain += 10;
		}
		Damage -= Drain;
		Momentum *= 1.2500000;
		// End:0x1A3
		if(((Instigator != none) && Instigator.PlayerReplicationInfo != none) && Instigator.PlayerReplicationInfo.HasFlag != none)
		{
			Drain = Min(int(ShieldPower), Drain);
			ShieldPower -= float(Drain);
			DoReflectEffectA(Drain, bPierce);			
		}
		else
		{
			ShieldPower -= float(Drain / 2);
			DoReflectEffectA(Drain / 2, bPierce);
		}
		bPierce = false;
	}
	//return;	
}

function DoReflectEffectA(int Drain, bool bPierce)
{
	// End:0x16
	if(bPierce)
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

simulated function ClientTakeHit(int Drain, optional int ExtDrain)
{
	ClientPlayForceFeedback(ShieldHitForce);
	TakeHit(Drain);
	//return;	
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int AmmoDrain)
{
	local Vector HitDir, FaceDir;

	// End:0x1C
	if(!bShieldUp || ShieldPower <= float(0))
	{
		return false;
	}
	FaceDir = Vector(Instigator.Controller.Rotation);
	HitDir = Normal((Instigator.Location - HitLocation) + vect(0.0000000, 0.0000000, 8.0000000));
	RefNormal = FaceDir;
	// End:0xA3
	if((FaceDir Dot HitDir) < -0.3700000)
	{
		// End:0xA1
		if(AmmoDrain > 0)
		{
			ShieldPower -= float(AmmoDrain);
		}
		return true;
	}
	return false;
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x1B
	if(!bShieldUp)
	{
		return FMin(LaserCharge, MaxCharge);		
	}
	else
	{
		return ShieldPower / float(100);
	}
	//return;	
}

defaultproperties
{
	ShieldBone="Shield"
	ShieldHitSound=ProceduralSound'WeaponSounds.ShieldGun.ShieldReflection'
	ShieldOnSound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-ShieldOn'
	ShieldOffSound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-ShieldOff'
	ShieldPierceSound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-ShieldPierce'
	ShieldHitForce="ShieldReflection"
	DamageSound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Overload'
	BrokenSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Ambient'
	ClipOutSoundEmpty=Sound'BWBP_SKC_Sounds.SK410.SK410-MagOut'
	WeaponScreen=ScriptedTexture'BWBP_SKC_Tex.PUMA.PUMA-ScriptLCD'
	screen=Shader'BWBP_SKC_Tex.PUMA.PUMA-ScriptLCD-SD'
	ScreenBase1=Texture'BWBP_SKC_Tex.PUMA.PUMA-Screen'
	ScreenBase2=Texture'BWBP_SKC_Tex.PUMA.PUMA-Screen2'
	ScreenBase3=Texture'BWBP_SKC_Tex.PUMA.PUMA-Screen3'
	ScreenBase4=Texture'BWBP_SKC_Tex.PUMA.PUMA-Screen4'
	ScreenBase5=Texture'BWBP_SKC_Tex.PUMA.PUMA-Screen5'
	Numbers=Texture'BWBP_SKC_Tex.PUMA.PUMA-Numbers'
	MyFontColor=(R=255,G=255,B=255,A=255)
	ChargingSound=Sound'WeaponSounds.BaseFiringSounds.BShield1'
	ShieldSoundVolume=220
	ChargeRate=5.0000000
	ChargeRateOvercharge=2.4000000
	MaxCharge=1.0000000
	CoolRate=1.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;15.0;0.4;25.0;0.8;0.0;-999.0")
	AIReloadTime=1.5000000
	SightAnimScale=0.4000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.TyphonPDWWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.TyphonPDWWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.Typhon.BigIcon_Typhon'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.Typhon.Typhon-Draw',Volume=0.2160000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Mode: Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Mode: Charged Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Charged Shot",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Cock',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-BoltSlap',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-MagOut',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-MagIn',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50In',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M353OutA',USize1=128,VSize1=128,USize2=256,VSize2=256,Color1=(R=0,G=0,B=255,A=255),Color2=(R=62,G=65,B=68,A=188),StartSize1=96,StartSize2=69)
	bWT_Bullet=true
	ManualLines[0]="Fires laser shots. Has a decent fire rate with moderate DPS and low recoil, but has inaccuracy problems and prefire wind-up time."
	ManualLines[1]="Employs an energy shield. Pressing altfire again removes the shield."
	ManualLines[2]="Can fire rapid or power laser shots. Power shots have higher DPS and AoE damage, at the cost of a higher wind-up time and lower fire rate."
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=2.1900000)
	CockingBringUpTime=1.2000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.TyphonPDWPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.TyphonPDWSecondaryFire'
	PutDownTime=0.8000000
	BringUpTime=1.0000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bShowChargingBar=true
	Description="The LRX-5 'Typhon' was a popular energy weapon used alongside the LS14 prior to the first Skrith War, but was quickly phased out due to its ineffectiveness against Skrith energy shielding. It wasnâ€™t until the Battle of Gahenna where the Typhon found its value in the war. A Cryon mechanised force was bearing down on Frontier Tech's vaunted energy research labs, but the invaders were unable to punch through the base defenders' brand new weapon mounted energy shields. The engineering team evacuated safely with the tech, and since then upgraded Typhons are still seen in the hands of the core world military and police forces. These post war LRX-5s are all outfitted with the X57 shield projector, a reverse-engineered portable energy shield."
	Priority=19
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	GroupOffset=18
	PickupClass=Class'BWBP_SKC_Pro.TyphonPDWPickup'
	PlayerViewOffset=(X=5.0000000,Y=3.5000000,Z=-4.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.TyphonPDWAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.Typhon.SmallIcon_Typhon'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="LRX-5 'Typhon' Pulse PDW"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.Typhon_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_SKC_Tex.Typhon.Typhon-Shine'
	Skins[2]=Shader'BWBP_SKC_Tex.Typhon.Typhon-ShineMag'
	Skins[3]=Shader'BWBP_SKC_Tex.PUMA.PUMA-ShieldSD'
	Skins[4]=Texture'BWBP_SKC_Tex.Typhon.Typhon-Misc'
	Skins[5]=Shader'BWBP_SKC_Tex.Typhon.Typhon-HolosightGlow'
	Skins[6]=Texture'BWBP_SKC_Tex.PUMA.PUMA-ScreenBasic'
}
