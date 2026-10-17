class A49SkrithBlaster extends BallisticWeapon
	config(BallisticProV55);

var bool bVariableHeatProps;
var bool bCharging;
var float HeatLevel;
var float HeatDeclineDelay;
var bool bIsVenting;
var() Sound OverheatSound;
var() Sound DamageSound;
var() Sound BrokenSound;
var() Class<DamageType> BlastDamageType;
var Actor VentSteam;
var Actor VentSteam2;
var Actor GlowFX;
var Actor glow1;
var Actor GlowFXDamaged;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSetHeat;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bVariableHeatProps = false;
	bCharging = false;
	// End:0x64
	if(InStr(WeaponParams.LayoutTags, "mod_rof") != -1)
	{
		bVariableHeatProps = true;
		A49PrimaryFire(FireMode[0]).bVariableHeatProps = true;
	}
	// End:0x8E
	if(InStr(WeaponParams.LayoutTags, "charge") != -1)
	{
		bCharging = true;
	}
	//return;	
}

simulated function float ChargeBar()
{
	return HeatLevel / float(10);
	//return;	
}

simulated function AddHeat(float Amount)
{
	HeatLevel += Amount;
	SoundPitch = byte(float(56) + (HeatLevel * float(11)));
	// End:0x8F
	if((HeatLevel >= 9.7500000) && !bVariableHeatProps)
	{
		HeatLevel = 10.0000000;
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 10.0000000, Instigator, Instigator.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BWBP_SKC_Pro.DTA49OverHeat');
		return;		
	}
	else
	{
		// End:0xBB
		if(HeatLevel >= 10.5000000)
		{
			HeatLevel = 15.0000000;
			ConsumeMagAmmo(0, 10.0000000);
			CommonCockGun();
		}
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	HeatLevel = NewHeat;
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x80
	if(bVariableHeatProps && HeatLevel > float(0))
	{
		// End:0x44
		if(bIsVenting)
		{
			HeatLevel = FMax(HeatLevel - (6.5000000 * dt), 0.0000000);			
		}
		else
		{
			HeatLevel = FMax(HeatLevel - (3.5000000 * dt), 0.0000000);
		}
		SoundPitch = byte(float(56) + (HeatLevel * float(11)));		
	}
	else
	{
		// End:0xE6
		if((HeatLevel > float(0)) && Level.TimeSeconds > (LastFireTime + HeatDeclineDelay))
		{
			HeatLevel = FMax(HeatLevel - (float(10) * dt), 0.0000000);
			SoundPitch = byte(float(56) + (HeatLevel * float(11)));
		}
	}
	super.Tick(dt);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	SoundPitch = 56;
	GunLength = default.GunLength;
	// End:0x112
	if(((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2) && (GlowFX == none) || GlowFX.bDeleteMe)
	{
		// End:0xB9
		if(int(LayoutIndex) == 1)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BWBP_SKC_Pro.A49GlowFXRed', DrawScale, self, 'tip');			
		}
		else
		{
			// End:0xEE
			if(int(LayoutIndex) == 2)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BallisticProV55.A73GlowFXB', DrawScale, self, 'tip');				
			}
			else
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BWBP_SKC_Pro.A49GlowFX', DrawScale, self, 'tip');
			}
		}
	}
	//return;	
}

simulated function SetGlowSize(float NewSize)
{
	// End:0x36
	if((GlowFX != none) && A49GlowFXRed(GlowFX) != none)
	{
		A49GlowFXRed(GlowFX).SetSize(NewSize);
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x57
	if(bCharging && FireMode[0].bIsFiring)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(glow1, Class'BWBP_SKC_Pro.HMCBarrelGlowRed', DrawScale * float(4), self, 'tip');		
	}
	else
	{
		// End:0x6E
		if(glow1 != none)
		{
			glow1.Destroy();
		}
	}
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

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BWBP_SKC_Pro.AP_A49Clip';
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	// End:0x2E
	if(glow1 != none)
	{
		glow1.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function CommonCockGun(optional byte Type)
{
	local int M;

	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 8;
	PlayCocking(Type);
	M = 0;
	J0x32:

	// End:0x73 [Loop If]
	if(M < 2)
	{
		// End:0x69
		if(bFireMode[M] != none)
		{
			bFireMode[M].CockingGun(Type);
		}
		M++;
		// [Loop Continue]
		goto J0x32;
	}
	//return;	
}

simulated function Notify_VentStart()
{
	bIsVenting = true;
	// End:0x26
	if(VentSteam != none)
	{
		VentSteam.Destroy();
		VentSteam = none;
	}
	// End:0x44
	if(VentSteam2 != none)
	{
		VentSteam2.Destroy();
		VentSteam2 = none;
	}
	Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(VentSteam2, Class'BallisticProV55.RSNovaSteam', DrawScale, self, 'LeftVent');
	Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(VentSteam, Class'BallisticProV55.RSNovaSteam', DrawScale, self, 'RightVent');
	VentSteam.SetRelativeRotation(rot(10000, 0, 0));
	VentSteam2.SetRelativeRotation(rot(0, 32768, 0));
	//return;	
}

simulated function Notify_VentEnd()
{
	bIsVenting = false;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;
	local Vector Dir;
	local Vehicle V;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	// End:0x96
	if((AmmoAmount(0)) < bFireMode[1].AmmoPerFire)
	{
		return 0;
	}
	// End:0x295
	if(B.Squad != none)
	{
		// End:0x196
		if((((DestroyableObjective(B.Squad.SquadObjective) != none) && B.Squad.SquadObjective.TeamLink(B.GetTeamNum())) || ((B.Squad.SquadObjective == none) && DestroyableObjective(B.Target) != none) && B.Target.TeamLink(B.GetTeamNum())) && (B.Enemy == none) || !B.EnemyVisible())
		{
			return 0;
		}
		// End:0x1D2
		if(FocusOnLeader(B.Focus == B.Squad.SquadLeader.Pawn))
		{
			return 0;
		}
		V = B.Squad.GetLinkVehicle(B);
		// End:0x219
		if(V == none)
		{
			V = Vehicle(B.MoveTarget);
		}
		// End:0x234
		if(V == B.Target)
		{
			return 0;
		}
		// End:0x295
		if((((V != none) && float(V.Health) < V.HealthMax) && V.LinkHealMult > float(0)) && B.LineOfSightTo(V))
		{
			return 0;
		}
	}
	// End:0x2FE
	if(((dist < (FireMode[1].MaxRange() - float(100))) && B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		return 1;
	}
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
	// End:0x61
	if((HasMagAmmo(0)) || Ammo[0].AmmoAmount > 0)
	{
		// End:0x61
		if(RecommendHeal(B))
		{
			return 1.2000000;
		}
	}
	rating = super.GetAIRating();
	// End:0x87
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	rating = Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.6000000, dist, 768.0000000, 2048.0000000);
	// End:0xFE
	if(HeatLevel > float(8))
	{
		rating *= 0.6500000;
	}
	return rating;
	//return;	
}

function bool FocusOnLeader(bool bLeaderFiring)
{
	local Bot B;
	local Pawn LeaderPawn;
	local Actor Other;
	local Vector HitLocation, HitNormal, StartTrace;
	local Vehicle V;

	B = Bot(Instigator.Controller);
	// End:0x26
	if(B == none)
	{
		return false;
	}
	// End:0x71
	if(PlayerController(B.Squad.SquadLeader) != none)
	{
		LeaderPawn = B.Squad.SquadLeader.Pawn;		
	}
	else
	{
		V = B.Squad.GetLinkVehicle(B);
		// End:0x113
		if(V != none)
		{
			LeaderPawn = V;
			bLeaderFiring = ((float(LeaderPawn.Health) < LeaderPawn.HealthMax) && V.LinkHealMult > float(0)) && (B.Enemy == none) || V.bKeyVehicle;
		}
	}
	// End:0x151
	if(LeaderPawn == none)
	{
		LeaderPawn = B.Squad.SquadLeader.Pawn;
		// End:0x151
		if(LeaderPawn == none)
		{
			return false;
		}
	}
	// End:0x15E
	if(!bLeaderFiring)
	{
		return false;
	}
	// End:0x20C
	if(Vehicle(LeaderPawn) != none)
	{
		StartTrace = Instigator.Location + Instigator.EyePosition();
		// End:0x20C
		if(VSize(LeaderPawn.Location - StartTrace) < FireMode[0].MaxRange())
		{
			Other = Trace(HitLocation, HitNormal, LeaderPawn.Location, StartTrace, true);
			// End:0x20C
			if(Other == LeaderPawn)
			{
				B.Focus = Other;
				return true;
			}
		}
	}
	return false;
	//return;	
}

function ConicalBlast(float DamageAmount, float DamageRadius, Vector Aim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x2B6
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, Location)
	{
		// End:0x2B5
		if(((Victims != Instigator) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
		{
			// End:0x9B
			if((Aim Dot Normal(Victims.Location - Location)) < 0.5000000)
			{
				continue;				
			}
			// End:0xFA
			if(((Pawn(Victims) != none) && Pawn(Victims).Controller != none) && Pawn(Victims).Controller.SameTeamAs(Instigator.Controller))
			{
				continue;				
			}
			// End:0x119
			if(!FastTrace(Victims.Location, Location))
			{
				continue;				
			}
			Dir = Victims.Location - Location;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), float(175000) * Dir, BlastDamageType);
			// End:0x242
			if(BallisticKHandGrenadeProjectile(Victims) != none)
			{
				BallisticKHandGrenadeProjectile(Victims).KickPineapple(Normal(Victims.Location - Location) * float(20000));
			}
			// End:0x2B5
			if(((Instigator != none) && Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
			{
				Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, Instigator.Controller, BlastDamageType, 0.0000000, Location);
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

simulated function float RateSelf()
{
	// End:0x24
	if(HeatLevel > float(11))
	{
		CurrentRating = super.RateSelf() * 0.2000000;		
	}
	else
	{
		// End:0x78
		if(((PlayerController(Instigator.Controller) != none) && Ammo[0].AmmoAmount < 1) && MagAmmo < 1)
		{
			CurrentRating = super.RateSelf() * 0.2000000;			
		}
		else
		{
			return super.RateSelf();
		}
	}
	return CurrentRating;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x10
	if(HeatLevel > float(11))
	{
		return false;
	}
	return super.CanAttack(Other);
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

function bool CanHeal(Actor Other)
{
	// End:0x2F
	if((DestroyableObjective(Other) != none) && DestroyableObjective(Other).LinkHealMult > float(0))
	{
		return true;
	}
	// End:0x5E
	if((Vehicle(Other) != none) && Vehicle(Other).LinkHealMult > float(0))
	{
		return true;
	}
	return false;
	//return;	
}

defaultproperties
{
	HeatDeclineDelay=0.2000000
	BlastDamageType=Class'BWBP_SKC_Pro.DTA49Shockwave'
	SpecialInfo[0]=(Id="EvoDefs",Info="60.0;-15.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.A49WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.A49WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.A49WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.A49WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.A6.BigIcon_A49'
	BigIconCoords=(X1=0,Y1=24,X2=511,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Pullout',Volume=0.1450000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Putaway',Volume=0.1500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	SightZoomFactor=1.2000000
	CockAnim="Overheat"
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc7',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc10',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=89,G=44,B=160,A=137),Color2=(R=0,G=255,B=151,A=202),StartSize1=84,StartSize2=61)
	NDCrosshairInfo=(SpreadRatios=(X1=0.3000000,Y1=0.3000000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.7000000
	bWT_RapidProj=true
	bWT_Energy=true
	ManualLines[0]="Fires a stream of plasma projectiles. These projectiles deal high damage and gain damage over range, but are slow.||Using this mode generates heat, and if the weapon overheats, the user will take damage and the fire rate is reduced."
	ManualLines[1]="Projects a short-range shockwave, dealing low damage and pushing nearby enemies back.||Using this mode generates significant heat, and if the weapon overheats, the user will take damage."
	ManualLines[2]="Effective at close range. Especially effective at repelling charges and melee."
	UsedAmbientSound=Sound'BW_Core_WeaponSound.A73.A73Hum1'
	SightPivot=(Pitch=2000,Yaw=0,Roll=-768)
	SightOffset=(X=-10.0000000,Y=0.5000000,Z=8.0000000)
	GunLength=0.1000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.A49PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.A49SecondaryFire'
	PutDownAnimRate=2.3000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8500000
	CurrentRating=0.8500000
	bShowChargingBar=true
	Description="A49 Skrith Blaster"
	Priority=16
	HudColor=(R=100,G=175,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	GroupOffset=1
	PickupClass=Class'BWBP_SKC_Pro.A49Pickup'
	PlayerViewOffset=(X=10.0000000,Y=3.0000000,Z=-6.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.A49Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.A6.SmallIcon_A49'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="A49 Skrith Blaster"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.A49_FPm'
	DrawScale=0.3000000
	SoundPitch=56
	SoundRadius=32.0000000
}
