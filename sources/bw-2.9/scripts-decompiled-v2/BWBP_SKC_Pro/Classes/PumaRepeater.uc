class PumaRepeater extends BallisticWeapon
	config(BallisticProV55);

var bool bFirstDraw;
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
var float FrequencyModulator;
var float LastRangeFound;
var int LastRangeFoundM;
var float PriDetRange;
var int PriDetRangeM;
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
var() Sound RangeBeepSound;
var Actor Arc;
var Actor GlowFX;
var PumaShieldEffect PumaShieldEffect;
var() float AmmoRegenTime;
var() float ChargeupTime;
var float RampTime;
var Sound ChargingSound;
var() byte ShieldSoundVolume;

replication
{
	// Pos:0x000
	reliable if((bNetOwner && bNetDirty) && int(Role) == int(ROLE_Authority))
		ShieldPower;

	// Pos:0x023
	reliable if(int(Role) == int(ROLE_Authority))
		ClientAdjustProps, ClientScreenStart, 
		ClientSwitchCannonMode, ClientTakeHit, 
		bShieldUp;

	// Pos:0x030
	reliable if(int(Role) < int(ROLE_Authority))
		ServerAdjustProps, ServerSwitchRange, 
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
	Skins[4] = screen;
	// End:0x46
	if(!bRangeSet)
	{
		ScreenBaseY = ScreenBase1;
	}
	// End:0x68
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
	// End:0x236
	if(bRangeSet && !bShieldUp)
	{
		Tex.DrawTile(90.0000000, 5.0000000, 50.0000000, 50.0000000, 30.0000000, float(NumpadYOffset4), 50.0000000, 50.0000000, Numbers, MyFontColor);
		Tex.DrawTile(110.0000000, 5.0000000, 50.0000000, 50.0000000, 30.0000000, float(NumpadYOffset5), 50.0000000, 50.0000000, Numbers, MyFontColor);
		Tex.DrawTile(130.0000000, 5.0000000, 50.0000000, 50.0000000, 30.0000000, float(NumpadYOffset6), 50.0000000, 50.0000000, Numbers, MyFontColor);
	}
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
	// End:0x131
	if(bRangeSet)
	{
		// End:0xCA
		if(PriDetRangeM >= 100)
		{
			NumpadYOffset4 = 5 + ((PriDetRangeM / 100) * 49);
			NumpadYOffset5 = int(float(5) + ((float(PriDetRangeM / 10) % float(10)) * float(49)));
			NumpadYOffset6 = int(float(5) + (((float(PriDetRangeM) % float(100)) % float(10)) * float(49)));			
		}
		else
		{
			// End:0x119
			if(PriDetRangeM >= 15)
			{
				NumpadYOffset4 = 5;
				NumpadYOffset5 = 5 + ((PriDetRangeM / 10) * 49);
				NumpadYOffset6 = int(float(5) + ((float(PriDetRangeM) % float(10)) * float(49)));				
			}
			else
			{
				NumpadYOffset4 = 5;
				NumpadYOffset5 = 54;
				NumpadYOffset6 = 250;
			}
		}
	}
	// End:0x153
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
		PumaPrimaryFire(FireMode[0]).SwitchCannonMode(CurrentWeaponMode);
	}
	ClientSwitchCannonMode(CurrentWeaponMode);
	//return;	
}

simulated function ClientSwitchCannonMode(byte newmode)
{
	PumaPrimaryFire(FireMode[0]).SwitchCannonMode(newmode);
	//return;	
}

function ServerAdjustProps(byte newmode)
{
	// End:0x2F
	if(!Instigator.IsLocallyControlled())
	{
		PumaPrimaryFire(FireMode[0]).AdjustProps(newmode);
	}
	ClientAdjustProps(newmode);
	//return;	
}

simulated function ClientAdjustProps(byte newmode)
{
	PumaPrimaryFire(FireMode[0]).AdjustProps(newmode);
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
	// End:0xB2
	if(bFirstDraw && MagAmmo > 0)
	{
		BringUpTime = default.BringUpTime * float(2);
		SelectAnim = 'Pullout';
		bFirstDraw = false;		
	}
	else
	{
		BringUpTime = default.BringUpTime;
		SelectAnim = 'Pullout';
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

simulated exec function WeaponSpecial(optional byte i)
{
	PriDetRange = LastRangeFound / float(6000);
	PriDetRangeM = LastRangeFoundM;
	ServerAdjustProps(2);
	ServerSwitchRange(PriDetRange);
	SwitchRange(PriDetRange);
	//return;	
}

function ServerSwitchRange(float NewRange)
{
	// End:0x2F
	if(!Instigator.IsLocallyControlled())
	{
		PumaPrimaryFire(FireMode[0]).SetDet(NewRange);
	}
	bRangeSet = true;
	// End:0x51
	if(LastRangeFoundM < 30)
	{
		ScreenBaseY = ScreenBase5;		
	}
	else
	{
		ScreenBaseY = ScreenBase4;
	}
	UpdateScreen();
	//return;	
}

simulated function SwitchRange(float NewRange)
{
	PumaPrimaryFire(FireMode[0]).SetDet(NewRange);
	PlaySound(RangeBeepSound, 0);
	bRangeSet = true;
	// End:0x47
	if(LastRangeFoundM < 30)
	{
		ScreenBaseY = ScreenBase5;		
	}
	else
	{
		ScreenBaseY = ScreenBase4;
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
	local PumaAttachment Attachment;

	bShieldUp = bNewValue;
	Attachment = PumaAttachment(ThirdPersonActor);
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
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc, Class'BWBP_SKC_Pro.M2020ShieldEffect', DrawScale, self, 'tip');
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
	//return;	
}

function SetBrightness(bool bHit)
{
	local PumaAttachment Attachment;
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
	Attachment = PumaAttachment(ThirdPersonActor);
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
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BWBP_SKC_Pro.PumaGlowFXDamaged', DrawScale, self, 'tip');
			}
		}
	}
	UpdateScreen();
	SetBrightness(true);
	//return;	
}

simulated event Timer()
{
	local Vector Start, HitLoc, HitNorm;
	local Actor t;

	// End:0xB1
	if(int(ClientState) == int(4))
	{
		Start = Instigator.Location + Instigator.EyePosition();
		t = Trace(HitLoc, HitNorm, Start + (Vector(Instigator.GetViewRotation()) * float(15000)), Start, true);
		// End:0x88
		if(t == none)
		{
			LastRangeFound = -1.0000000;			
		}
		else
		{
			LastRangeFound = VSize(HitLoc - Start);
			LastRangeFoundM = int(LastRangeFound / float(44));
		}
		return;
	}
	// End:0xCD
	if(int(ClientState) == int(2))
	{
		SetTimer(0.2000000, true);		
	}
	else
	{
		SetTimer(0.0000000, false);
	}
	// End:0xFA
	if(int(ClientState) == int(3))
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(GlowFX);
	}
	super.Timer();
	//return;	
}

simulated function float RateSelf()
{
	// End:0x54
	if(((PlayerController(Instigator.Controller) != none) && Ammo[0].AmmoAmount <= 0) && MagAmmo <= 0)
	{
		CurrentRating = super.RateSelf() * 0.2000000;		
	}
	else
	{
		return super.RateSelf();
	}
	return CurrentRating;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	// End:0x8B
	if(dist > float(400))
	{
		return 0;
	}
	// End:0xB7
	if((dist < FireMode[1].MaxRange()) && FRand() > 0.3000000)
	{
		return 1;
	}
	// End:0x141
	if(((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000) && (VSize(B.Enemy.Velocity) < float(100)) || (Normal(B.Enemy.Velocity) Dot Normal(B.Velocity)) < 0.5000000)
	{
		return 1;
	}
	return byte(Rand(2));
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
	// End:0xAA
	if(dist > float(1000))
	{
		Result -= ((dist - float(1000)) / float(2000));
	}
	// End:0x10C
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		Result += (0.1000000 * B.Skill);		
	}
	else
	{
		// End:0x16E
		if(((B.Enemy.Weapon != none) && B.Enemy.Weapon.bSniping) && dist > float(500))
		{
			Result -= 0.3000000;
		}
	}
	Result += (float(1) - (dist / float(1000)));
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

simulated event RenderOverlays(Canvas Canvas)
{
	local Coords Z;

	// End:0x128
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
	}
	else
	{
		// End:0x19A
		if(LastRangeFoundM >= 100)
		{
			NumpadYOffset1 = 5 + ((LastRangeFoundM / 100) * 49);
			NumpadYOffset2 = int(float(5) + ((float(LastRangeFoundM / 10) % float(10)) * float(49)));
			NumpadYOffset3 = int(float(5) + (((float(LastRangeFoundM) % float(100)) % float(10)) * float(49)));			
		}
		else
		{
			// End:0x1E9
			if(LastRangeFoundM >= 10)
			{
				NumpadYOffset1 = 5;
				NumpadYOffset2 = 5 + ((LastRangeFoundM / 10) * 49);
				NumpadYOffset3 = int(float(5) + ((float(LastRangeFoundM) % float(10)) * float(49)));				
			}
			else
			{
				// End:0x21A
				if(LastRangeFoundM >= 0)
				{
					NumpadYOffset1 = 5;
					NumpadYOffset2 = 5;
					NumpadYOffset3 = 5 + (LastRangeFoundM * 49);					
				}
				else
				{
					NumpadYOffset1 = 5;
					NumpadYOffset2 = 5;
					NumpadYOffset3 = 5;
				}
			}
		}
	}
	// End:0x254
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	// End:0x2C4
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
		// End:0x94
		if(((Class<DT_PUMASelf>(DamageType) != none) && bShieldUp) && ShieldPower > float(0))
		{
			Damage = 70;
			// End:0x7C
			if(ShieldPower >= float(40))
			{
				Damage = 30;
				Momentum *= -2.0000000;
			}
			ShieldPower -= float(80);
			ClientTakeHit(80);
			return;			
		}
		else
		{
			// End:0xBE
			if((Class<DTXM84GrenadeRadius>(DamageType) != none) && bShieldUp)
			{
				ClientTakeHit(200, 200);
				return;				
			}
			else
			{
				// End:0xF6
				if(!DamageType.default.bArmorStops || (DamageType == Class'XWeapons.DamTypeShieldImpact') && instigatedBy == Instigator)
				{
					return;
				}
			}
		}
	}
	// End:0x23E
	if(CheckReflect(HitLocation, HitNormal, 0))
	{
		Drain = Min(int(ShieldPower * float(2)), Damage);
		Drain = Min(Drain, int(DamageMax));
		Reflect = MirrorVectorByNormal(Normal(Location - HitLocation), Vector(Instigator.Rotation));
		// End:0x181
		if(float(Damage) > DamageMax)
		{
			bPierce = true;
			Drain += 10;
		}
		Damage -= Drain;
		Momentum *= 1.2500000;
		// End:0x20F
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
	return ShieldPower / float(100);
	//return;	
}

defaultproperties
{
	bFirstDraw=true
	BulletBone="Bullet1"
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
	RangeBeepSound=Sound'MenuSounds.select3'
	ChargingSound=Sound'WeaponSounds.BaseFiringSounds.BShield1'
	ShieldSoundVolume=200
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;30.0;0.5;60.0;0.0;1.0;0.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.PumaWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.PumaWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.PumaWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.PumaWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.PUMA.BigIcon_PUMA'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Putaway',Volume=0.2600000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Airburst: Impact Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Airburst: Proximity Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Airburst: Variable Range Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	bNoCrosshairInScope=true
	SightBobScale=0.3000000
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Cock',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bNonCocking=true
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-MagOut',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-MagIn',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M763OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M763InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=255,A=192),Color2=(R=255,G=0,B=0,A=192),StartSize1=113,StartSize2=120)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=0.7500000,Y1=1.0000000,X2=0.7500000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	LongGunOffset=(X=8.0000000,Y=-5.0000000,Z=-3.0000000)
	bWT_Shotgun=true
	bWT_Machinegun=true
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	SightOffset=(X=-3.0000000,Y=0.0000000,Z=2.0000000)
	MagAmmo=8
	GunLength=48.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.PumaPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.PumaSecondaryFire'
	PutDownTime=0.8000000
	BringUpTime=1.0000000
	AIRating=0.6000000
	CurrentRating=0.6000000
	bShowChargingBar=true
	Description="PUMA-77 Repeating Pulse Rifle||Manufacturer: Majestic Firearms 12|Primary: Programmable Smart Round|Secondary: Shield Projector||The Type-77 RPR, better known as the 'PUMA', is one of the more recognizable light grenade launchers on the market. It was used extensively by the UTC before their widespread adoption of the SRAC-21/G during the first Skrith war. This powerful weapon differs from other conventional grenade launchers in that it utilizes specialized fission batteries as ammunition, which both power and act as the carrier of the projectile. The projectiles themselves can be programmed by the side-mounted rangefinding module and allow soldiers to selectively airburst the rounds to hit targets behind cover. The PUMA-77s seen here are equipped with Frontier Tech's lightweight X57 shield projector, which is a reverse-engineered prototype of the Skrith personal energy shields."
	Priority=245
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	PickupClass=Class'BWBP_SKC_Pro.PumaPickup'
	PlayerViewOffset=(X=5.0000000,Y=4.0000000,Z=-3.5000000)
	PlayerViewPivot=(Pitch=0,Yaw=-16400,Roll=0)
	AttachmentClass=Class'BWBP_SKC_Pro.PumaAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.PUMA.SmallIcon_PUMA'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=35)
	ItemName="PUMA-77 Repeater"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.PUMA_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_SKC_Tex.PUMA.PUMA-MainShine'
	Skins[2]=Shader'BWBP_SKC_Tex.PUMA.PUMA-BackShine'
	Skins[3]=Texture'BWBP_SKC_Tex.Typhon.Typhon-Misc'
	Skins[4]=Texture'BWBP_SKC_Tex.PUMA.PUMA-ScreenBasic'
}
