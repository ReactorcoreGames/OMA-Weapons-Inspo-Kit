class DefibFists extends BallisticMeleeWeapon
	config(BallisticProV55);

var() int ElectroCharge;
var() int ChargePerSecond;
var() float DeflectionAmount;
var() float PulseCharge;
var() float PulseInterval;
var float LastPulse;
var float LastRecharge;
var Actor LSparks;
var Actor RSparks;
var float PointsHealed;
var() float HealRatio;
var float LastRegen;
var() Sound PulseSound;
var bool bSetAmbient;
var bool bDischarged;
var Class<DamageType> PulseDamageType;

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

simulated function float ChargeBar()
{
	return float(MagAmmo) / 100.0000000;
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super(BallisticWeapon).BringUp(PrevWeapon);
	// End:0x22
	if(LSparks != none)
	{
		LSparks.Destroy();
	}
	// End:0x39
	if(RSparks != none)
	{
		RSparks.Destroy();
	}
	// End:0xD5
	if((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
	{
		LSparks = none;
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(LSparks, Class'BWBP_OP_Pro.DefibFistsTazerEffect', DrawScale, self, 'LElectrode');
		RSparks = none;
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(RSparks, Class'BWBP_OP_Pro.DefibFistsTazerEffect', DrawScale, self, 'RElectrode');
	}
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(LSparks != none)
	{
		LSparks.Destroy();
	}
	// End:0x2E
	if(RSparks != none)
	{
		RSparks.Destroy();
	}
	super(BallisticWeapon).Destroyed();
	//return;	
}

simulated event Tick(float dt)
{
	// End:0xBE
	if((MagAmmo >= 10) && bDischarged)
	{
		// End:0xBB
		if((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
		{
			LSparks = none;
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(LSparks, Class'BWBP_OP_Pro.DefibFistsTazerEffect', DrawScale, self, 'LElectrode');
			RSparks = none;
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(RSparks, Class'BWBP_OP_Pro.DefibFistsTazerEffect', DrawScale, self, 'RElectrode');
			bDischarged = false;
		}		
	}
	else
	{
		// End:0x12B
		if((MagAmmo < 10) && !bDischarged)
		{
			// End:0xF6
			if(LSparks != none)
			{
				Emitter(LSparks).Kill();
			}
			LSparks = none;
			// End:0x11C
			if(RSparks != none)
			{
				Emitter(RSparks).Kill();
			}
			RSparks = none;
			bDischarged = true;
		}
	}
	super.Tick(dt);
	// End:0x1B9
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x1AE
		if(((ElectroCharge < default.ElectroCharge) && !bBlocked) && Level.TimeSeconds > LastRecharge)
		{
			ElectroCharge = Min(default.MagAmmo, ElectroCharge + ChargePerSecond);
			LastRecharge = Level.TimeSeconds + float(1);
		}
		MagAmmo = ElectroCharge;
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	super(BallisticWeapon).WeaponTick(dt);
	// End:0x1D
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0xEC
	if(Level.TimeSeconds > LastPulse)
	{
		// End:0xD4
		if(bBlocked && float(ElectroCharge) >= PulseCharge)
		{
			// End:0x6B
			if(!bSetAmbient)
			{
				bPlayAmbient(true);
				bSetAmbient = true;
			}
			ElectroPulseWave(5.0000000, 350.0000000, Class'BWBP_OP_Pro.DTShockGauntlet', 10000.0000000, Instigator.Location);
			LastPulse = Level.TimeSeconds + PulseInterval;
			ElectroCharge -= int(PulseCharge);
			DefibFistsAttachment(ThirdPersonActor).DoWave(false);			
		}
		else
		{
			// End:0xEC
			if(bSetAmbient)
			{
				bPlayAmbient(false);
				bSetAmbient = false;
			}
		}
	}
	// End:0x18F
	if(Level.TimeSeconds > LastRegen)
	{
		LastRegen = Level.TimeSeconds + 0.5000000;
		// End:0x18F
		if((PointsHealed >= HealRatio) && float(Instigator.Health) < (Instigator.HealthMax * 1.2000000))
		{
			// End:0x173
			if(PointsHealed > float(250))
			{
				PointsHealed = 250.0000000;
			}
			Instigator.Health++;
			PointsHealed -= HealRatio;
		}
	}
	//return;	
}

simulated function bPlayAmbient(bool bPulseOn)
{
	// End:0x31
	if(bPulseOn)
	{
		Instigator.AmbientSound = PulseSound;
		Instigator.SoundVolume = 128;		
	}
	else
	{
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = 0;
	}
	//return;	
}

function ElectroPulseWave(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector ShockWaveStart)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;
	local BallisticPawn PulseTarget;
	local int PrevHealth;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x1F5
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, ShockWaveStart)
	{
		// End:0x1F4
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && Victims.bCanBeDamaged) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Instigator)
		{
			PulseTarget = BallisticPawn(Victims);
			// End:0x10A
			if(IsValidHealTarget(PulseTarget))
			{
				PrevHealth = PulseTarget.Health;
				DamageAmount = 0.0000000;
				PulseTarget.GiveAttributedHealth(5, 100, Instigator);
				PointsHealed += float(PulseTarget.Health - PrevHealth);
				continue;				
				// End:0x1F4
				continue;
			}
			Dir = Victims.Location - ShockWaveStart;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, PulseDamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function ElectroShockWave(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector ShockWaveStart)
{
	local Actor Victims;
	local float damageScale, dist, finalDamage;
	local Vector Dir;
	local BallisticPawn ShockTarget;
	local int PrevHealth;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x205
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, ShockWaveStart)
	{
		// End:0x204
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && Victims.bCanBeDamaged) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Instigator)
		{
			ShockTarget = BallisticPawn(Victims);
			// End:0x10A
			if(IsValidHealTarget(ShockTarget))
			{
				PrevHealth = ShockTarget.Health;
				DamageAmount = 0.0000000;
				ShockTarget.GiveAttributedHealth(15, 100, Instigator);
				PointsHealed += float(ShockTarget.Health - PrevHealth);
				continue;				
				// End:0x204
				continue;
			}
			Dir = Victims.Location - ShockWaveStart;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = FClamp(1.0000000 - ((dist - Victims.CollisionRadius) / DamageRadius), 0.0000000, 1.0000000);
			finalDamage = damageScale * DamageAmount;
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, finalDamage, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function bool IsValidHealTarget(Pawn PulseTarget)
{
	// End:0x1E
	if((PulseTarget == none) || PulseTarget == Instigator)
	{
		return false;
	}
	// End:0x34
	if(PulseTarget.Health <= 0)
	{
		return false;
	}
	// End:0x53
	if(!Level.Game.bTeamGame)
	{
		return false;
	}
	// End:0x65
	if(Vehicle(PulseTarget) != none)
	{
		return false;
	}
	return (PulseTarget.Controller != none) && Instigator.Controller.SameTeamAs(PulseTarget.Controller);
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0xD2
	if((((((ElectroCharge > 0) && bBlocked) && !IsFiring()) && Level.TimeSeconds > (LastFireTime + float(1))) && Class<BallisticDamageType>(DamageType) != none) && (Normal(HitLocation - (Instigator.Location + Instigator.EyePosition())) Dot Vector(Instigator.GetViewRotation())) > 0.4000000)
	{
		// End:0xD2
		if(Class<BallisticDamageType>(DamageType).default.bCanBeBlocked)
		{
			Damage *= 0.1000000;
			BallisticAttachment(ThirdPersonActor).UpdateBlockHit();
		}
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated function bool MayNeedReload(byte Mode, float load)
{
	return false;
	//return;	
}

function ServerStartReload(optional byte i)
{
	//return;	
}

simulated function string GetHUDAmmoText(int Mode)
{
	return "";
	//return;	
}

function bool CanAttack(Actor Other)
{
	return true;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float Result;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x86
	if(VSize(B.Enemy.Location - Instigator.Location) > (FireMode[0].MaxRange() * 1.5000000))
	{
		return 1;
	}
	Result = FRand();
	// End:0xEB
	if((Vector(B.Enemy.Rotation) Dot Normal(Instigator.Location - B.Enemy.Location)) < 0.0000000)
	{
		Result += 0.3000000;		
	}
	else
	{
		Result -= 0.3000000;
	}
	// End:0x109
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
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return AIRating;
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = AIRating;
	// End:0x9C
	if(dist > float(1500))
	{
		return 0.1000000;
	}
	// End:0xE4
	if((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000)
	{
		Result += (0.0800000 * B.Skill);
	}
	// End:0x153
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		Result = FMax(0.0000000, Result *= (0.7000000 - (dist / float(1000))));		
	}
	else
	{
		Result = FMax(0.0000000, Result *= (float(1) - (dist / float(1000))));
	}
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
	return AIController(Instigator.Controller).Skill / float(4);
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
	Result *= (float(1) - (dist / float(1500)));
	return FClamp(Result, -1.0000000, -0.3000000);
	//return;	
}

simulated function GetAmmoCount(out float MaxAmmoPrimary, out float CurAmmoPrimary)
{
	MaxAmmoPrimary = float(default.ElectroCharge);
	CurAmmoPrimary = float(ElectroCharge);
	//return;	
}

simulated function float AmmoStatus(optional int Mode)
{
	return float(ElectroCharge) / float(default.ElectroCharge);
	//return;	
}

defaultproperties
{
	ElectroCharge=100
	ChargePerSecond=10
	DeflectionAmount=25.0000000
	PulseCharge=5.0000000
	PulseInterval=0.5000000
	HealRatio=5.0000000
	PulseSound=Sound'BW_Core_WeaponSound.LightningGun.LG-FireLoop'
	PulseDamageType=Class'BWBP_OP_Pro.DTShockGauntletPulse'
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;-999.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_OP_Pro.DefibWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.DefibWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.DefibWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.DefibWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.Defist.BigIcon_DefibFists'
	BigIconCoords=(X1=96,Y1=10,X2=418,Y2=245)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Pullout',Volume=0.1100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Putaway',Volume=0.1100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Strikes",bUnavailable=true,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="KILL!",bUnavailable=true,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=0,G=0,B=0,A=133),Color2=(R=51,G=62,B=255,A=235),StartSize1=51,StartSize2=69)
	bWT_Heal=true
	ManualLines[0]="Strike with the gauntlets. Deals minor damage when charged and blinds the opponent for a short duration. When discharged, deals poor damage. Allies struck by this attack will be healed. A successful strike depletes charge."
	ManualLines[1]="Uppercut with the gauntlets. Deals good damage with some charge remaining. Allies struck will be healed. With over 55% charge, gains power, discharging a shockwave which increases the effectiveness of the attack and causes some radius damage. A successful or empowered strike depletes charge."
	ManualLines[2]="Holding Weapon Function allows the defibrillators to block. This generates a frontal shield which reduces damage from attacks by 35. The weapon will also project pulses which inflict poor healing or damage upon nearby targets. Melee attacks are blocked regardless of charge. Charge drains over time with the shield engaged.||Effective in a defensive and supporting role."
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.DefibFistsPrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.DefibFistsSecondaryFire'
	PutDownTime=0.6600000
	BringUpTime=0.6600000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.2000000
	CurrentRating=0.2000000
	bMeleeWeapon=true
	bCanThrow=false
	Description="The FMD H14 Combat Defibrillator is the go-to weapon of combat medics everywhere. Discharging electrical pulses from a pair of gauntlets, it can be used in both offensive and defensive roles. However, charge is limited, and when it is depleted the weapon becomes nearly useless."
	Priority=1
	HudColor=(R=255,G=0,B=0,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=1
	PickupClass=Class'BWBP_OP_Pro.DefibFistsPickup'
	PlayerViewOffset=(X=20.0000000,Y=0.0000000,Z=-5.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.DefibFistsAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.Defist.Icon_DefibFists'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="FMD H14 Combat Defibrillator"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.FMD_FPm'
	DrawScale=0.3000000
	bFullVolume=true
	SoundVolume=64
	SoundRadius=128.0000000
}
