class AK91ChargeRifle extends BallisticWeapon
	config(BallisticProV55);

var float HeatLevel;
var float MaxHeatLevel;
var() Sound OverheatSound;
var() Sound HighHeatSound;
var Actor GlowFX;
var Emitter LaserDot;
var bool bLaserOn;
var bool bFirstDraw;
var name BulletBone;
var name BulletBone2;
var Supercharger_ChargeControl ChargeControl;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ChargeControl, ClientSetHeat;
}

simulated function float ChargeBar()
{
	return HeatLevel / MaxHeatLevel;
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x2D
	if(HeatLevel > float(0))
	{
		HeatLevel = FMax(HeatLevel - (0.3500000 * dt), 0.0000000);
	}
	super.Tick(dt);
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0xB6
	if((((((HeatLevel >= float(5)) && Instigator.IsLocallyControlled()) && GlowFX == none) && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2) && (GlowFX == none) || GlowFX.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BWBP_SKC_Pro.HMCBarrelGlow', DrawScale, self, 'LAM');		
	}
	else
	{
		// End:0xE3
		if(HeatLevel < float(5))
		{
			// End:0xE3
			if(GlowFX != none)
			{
				Emitter(GlowFX).Kill();
			}
		}
	}
	//return;	
}

simulated function AddHeat(float Amount)
{
	HeatLevel = FClamp(HeatLevel + Amount, 0.0000000, MaxHeatLevel);
	AK91PrimaryFire(FireMode[0]).FireRate = AK91PrimaryFire(FireMode[0]).Params.FireInterval;
	// End:0x7D
	if(HeatLevel >= 9.5000000)
	{
		AK91PrimaryFire(FireMode[0]).FireRate *= 1.5000000;
	}
	// End:0xAD
	if(HeatLevel >= 5.0000000)
	{
		PlaySound(HighHeatSound,, 1.0000000 * (HeatLevel / float(10)),, 32.0000000);
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	HeatLevel = NewHeat;
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M;
	local Weapon W;
	local bool bPossiblySwitch, bJustSpawned;

	Instigator = Other;
	W = Weapon(Other.FindInventoryType(Class));
	// End:0x20B
	if((W == none) || Class != W.Class)
	{
		bJustSpawned = true;
		super(Inventory).GiveTo(Other);
		bPossiblySwitch = true;
		W = self;
		// End:0x104
		if((Pickup != none) && BallisticWeaponPickup(Pickup) != none)
		{
			GenerateLayout(BallisticWeaponPickup(Pickup).LayoutIndex);
			GenerateCamo(BallisticWeaponPickup(Pickup).CamoIndex);
			// End:0xE8
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = BallisticWeaponPickup(Pickup).MagAmmo;			
		}
		else
		{
			GenerateLayout(byte(255));
			GenerateCamo(byte(255));
			// End:0x140
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = MagAmmo + ((int(!bNonCocking) * int(bMagPlusOne)) * int(!bNeedCock));
		}
		// End:0x1C9
		if(AK91Pickup(Pickup) != none)
		{
			HeatLevel = FMax(0.0000000, AK91Pickup(Pickup).HeatLevel - ((Level.TimeSeconds - AK91Pickup(Pickup).HeatTime) * 0.2500000));
		}
		// End:0x208
		if((int(Level.NetMode) == int(NM_ListenServer)) || int(Level.NetMode) == int(NM_DedicatedServer))
		{
			ClientSetHeat(HeatLevel);
		}		
	}
	else
	{
		// End:0x227
		if(!W.HasAmmo())
		{
			bPossiblySwitch = true;
		}
	}
	// End:0x23A
	if(Pickup == none)
	{
		bPossiblySwitch = true;
	}
	M = 0;
	J0x241:

	// End:0x2A6 [Loop If]
	if(M < 2)
	{
		// End:0x29C
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			W.GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0x241;
	}
	// End:0x2C5
	if(MeleeFireMode != none)
	{
		MeleeFireMode.Instigator = Instigator;
	}
	// End:0x2FE
	if((Instigator.Weapon != none) && Instigator.Weapon.IsFiring())
	{
		bPossiblySwitch = false;
	}
	// End:0x32B
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	bAimDisabled = default.bAimDisabled || !Instigator.IsHumanControlled();
	// End:0x386
	if(!bJustSpawned)
	{
		M = 0;
		J0x360:

		// End:0x383 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x360;
		}
		Destroy();
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	local Supercharger_ChargeControl FC;

	super.PostNetBeginPlay();
	// End:0x52
	if((int(Role) == int(ROLE_Authority)) && ChargeControl == none)
	{
		// End:0x42
		foreach DynamicActors(Class'BWBP_SKC_Pro.Supercharger_ChargeControl', FC)
		{
			ChargeControl = FC;			
			return;			
		}		
		ChargeControl = Spawn(Class'BWBP_SKC_Pro.Supercharger_ChargeControl', none);
	}
	//return;	
}

function Supercharger_ChargeControl GetChargeControl()
{
	return ChargeControl;
	//return;	
}

function ConicalBlast(float DamageAmount, float DamageRadius, Vector Aim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir, Dummy;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x30B
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, Location)
	{
		// End:0x30A
		if(((Victims != Instigator) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
		{
			// End:0x9B
			if((Aim Dot Normal(Victims.Location - Location)) < 0.5000000)
			{
				continue;				
			}
			// End:0xBA
			if(!FastTrace(Victims.Location, Location))
			{
				continue;				
			}
			Dir = Victims.Location - Location;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, DamageAmount * float(int(HeatLevel)), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), vect(0.0000000, 0.0000000, 0.0000000), Class'BWBP_SKC_Pro.DT_AK91Zapped');
			// End:0x1D4
			if((xPawn(Victims) != none) && Level.Game.ReduceDamage(int(DamageAmount), xPawn(Victims), Instigator, Victims.Location, Dummy, Class'BWBP_SKC_Pro.DT_AK91Zapped') <= 0)
			{
				continue;				
			}
			// End:0x297
			if(Pawn(Victims) != none)
			{
				ChargeControl.FireSinge(Pawn(Victims), Instigator, 2, int(HeatLevel));
				// End:0x297
				if(Pawn(Victims).bProjTarget)
				{
					Pawn(Victims).AddVelocity(vect(0.0000000, 0.0000000, 200.0000000) + ((Normal(Victims.Acceleration) * -FMin(Pawn(Victims).GroundSpeed, VSize(Victims.Velocity))) + ((Normal(Dir) * float(3000)) * damageScale)));
				}
			}
			// End:0x30A
			if(((Instigator != none) && Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
			{
				Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, Instigator.Controller, Class'BWBP_SKC_Pro.DT_AK91Zapped', 0.0000000, Location);
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x78
	if((Anim == 'Fire') || Anim == 'ReloadEmpty')
	{
		// End:0x78
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 2)
		{
			SetBoneScale(2, 0.0000000, BulletBone);
			SetBoneScale(3, 0.0000000, BulletBone2);
		}
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x37
	if(bFirstDraw && MagAmmo > 0)
	{
		BringUpTime = 2.0000000;
		SelectAnim = 'PulloutFancy';
		bFirstDraw = false;		
	}
	else
	{
		BringUpTime = default.BringUpTime;
		SelectAnim = 'Pullout';
	}
	// End:0x9C
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		SetBoneScale(2, 0.0000000, BulletBone);
		SetBoneScale(3, 0.0000000, BulletBone2);
		ReloadAnim = 'ReloadEmpty';		
	}
	else
	{
		ReloadAnim = 'Reload';
	}
	super.BringUp(PrevWeapon);
	SoundPitch = 56;
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function PlayReload()
{
	// End:0x19
	if(MagAmmo < 1)
	{
		ReloadAnim = 'ReloadEmpty';		
	}
	else
	{
		ReloadAnim = 'Reload';
	}
	SafePlayAnim(ReloadAnim, ReloadAnimRate,, 0, "RELOAD");
	//return;	
}

simulated function Notify_ClipUp()
{
	SetBoneScale(2, 1.0000000, BulletBone);
	SetBoneScale(3, 1.0000000, BulletBone2);
	//return;	
}

simulated function Notify_ClipOut()
{
	super.Notify_ClipOut();
	// End:0x35
	if(MagAmmo < 1)
	{
		SetBoneScale(2, 0.0000000, BulletBone);
		SetBoneScale(3, 0.0000000, BulletBone2);
	}
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

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return 0;		
	}
	else
	{
		// End:0x4F
		if(FRand() > 0.7500000)
		{
			return 1;
		}
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
	// End:0x12B
	if(Result < 0.3400000)
	{
		// End:0x12B
		if(int(CurrentWeaponMode) != 2)
		{
			CurrentWeaponMode = 2;
		}
	}
	return Result;
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
	MaxHeatLevel=10.0000000
	OverheatSound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Overload'
	HighHeatSound=Sound'BWBP_SKC_Sounds.SuperCharger.SC-FireSingle'
	BulletBone="Bullet1"
	BulletBone2="Bullet2"
	SpecialInfo[0]=(Id="EvoDefs",Info="320.0;25.0;1.0;110.0;0.5;0.8;0.6")
	AIReloadTime=1.0000000
	SightAnimScale=0.5000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.AK91WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.AK91WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.AK91WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.AK91WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.AK91.BigIcon_AK91'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-Cock',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-Cock',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-ClipHit',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-ClipOut',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-ClipIn',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	bWT_Bullet=true
	UsedAmbientSound=Sound'BW_Core_WeaponSound.A73.A73Hum1'
	SightingTime=0.3000000
	SightOffset=(X=10.5000000,Y=0.0000000,Z=1.7000000)
	CockingBringUpTime=2.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.AK91PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.AK91SecondaryFire'
	IdleAnimRate=0.4000000
	PutDownTime=0.7000000
	BringUpTime=0.9000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bShowChargingBar=true
	Description="AK-91 Charge Rifle||Manufacturer: Zavod Tochnogo Voorujeniya (ZTV Export)|Primary: 7.62 AP Rounds|Secondary: Emergency Vent||War, war never changes. But technology does as the fight against the Skrith wages on, cultivated in various weapon research facilities across the galaxies.  While some built from the ground up, others have been reverse engineered from the enemy factions. Most of them work after hard work and dedication, then thereâ€™s ZTV Exports.  Legendary for their reliable and hard hitting weapons, but even they need to catch up in the arms race. Against their code of ethics, the brilliant minds at ZTV somehow managed to reverse engineer the AMP system and slap it onto their older AK91 models, causing it to hit much harder than before.  However, they also found that it can be overloaded with unstable energy particles that can severely harm the user unless they somehow purge it.  With the war raging on, ZTV Exports are willing to risk the chance in order to save the motherland."
	Priority=65
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	GroupOffset=11
	PickupClass=Class'BWBP_SKC_Pro.AK91Pickup'
	PlayerViewOffset=(X=5.0000000,Y=4.0000000,Z=-5.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.AK91Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.AK91.SmallIcon_AK91'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="AK-91 Charge Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.AK91_FPm'
	DrawScale=0.3000000
	SoundPitch=56
	SoundRadius=32.0000000
}
