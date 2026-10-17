class A73SkrithRifle extends BallisticWeapon
	config(BallisticProV55);

var float HeatLevel;
var float HeatDeclineTime;
var() Sound OverheatSound;
var Actor GlowFX;
var Actor HeatFX;
var(A73) bool bDecorativeHeat;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSetHeat;
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x20
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		bDecorativeHeat = true;
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0xB4
	if(HeatLevel >= float(7))
	{
		// End:0xB1
		if((((Instigator.IsLocallyControlled() && HeatFX == none) && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2) && (HeatFX == none) || HeatFX.bDeleteMe)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(HeatFX, Class'BallisticProV55.A73HeatGlow', DrawScale, self, 'tip');
		}		
	}
	else
	{
		// End:0xD3
		if(HeatFX != none)
		{
			Emitter(HeatFX).Kill();
		}
	}
	//return;	
}

simulated function float ChargeBar()
{
	return HeatLevel / float(10);
	//return;	
}

simulated function AddHeat(float Amount, float DeclineTime)
{
	// End:0x15
	if(bBerserk)
	{
		Amount *= 0.7500000;
	}
	HeatLevel += Amount;
	SoundPitch = byte(float(56) + (HeatLevel * float(11)));
	HeatDeclineTime = FMax(Level.TimeSeconds + DeclineTime, HeatDeclineTime);
	// End:0xC3
	if((HeatLevel >= 9.7500000) && !bDecorativeHeat)
	{
		HeatLevel = 10.0000000;
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 10.0000000, Instigator, Instigator.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BallisticProV55.DTA73Overheat');
		return;
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
	// End:0x5F
	if((HeatLevel > float(0)) && Level.TimeSeconds > HeatDeclineTime)
	{
		HeatLevel = FMax(HeatLevel - (float(10) * dt), 0.0000000);
		SoundPitch = byte(float(56) + (HeatLevel * float(11)));
	}
	super.Tick(dt);
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x1C
	if(int(MeleeState) >= int(2))
	{
		Momentum *= 0.5000000;
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
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
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BallisticProV55.A73GlowFXBal', DrawScale, self, 'tip');			
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
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BallisticProV55.A73GlowFX', DrawScale, self, 'tip');
			}
		}
	}
	//return;	
}

simulated event Timer()
{
	// End:0x38
	if(int(ClientState) == int(3))
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(GlowFX);
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(HeatFX);
	}
	super.Timer();
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(HeatFX != none)
	{
		HeatFX.Destroy();
	}
	// End:0x2E
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	super.Destroyed();
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
	// End:0x163
	if((((DestroyableObjective(B.Squad.SquadObjective) != none) && B.Squad.SquadObjective.TeamLink(B.GetTeamNum())) || ((B.Squad.SquadObjective == none) && DestroyableObjective(B.Target) != none) && B.Target.TeamLink(B.GetTeamNum())) && (B.Enemy == none) || !B.EnemyVisible())
	{
		return 0;
	}
	// End:0x19F
	if(FocusOnLeader(B.Focus == B.Squad.SquadLeader.Pawn))
	{
		return 0;
	}
	// End:0x1B3
	if(dist > float(300))
	{
		return 0;
	}
	V = B.Squad.GetLinkVehicle(B);
	// End:0x1FA
	if(V == none)
	{
		V = Vehicle(B.MoveTarget);
	}
	// End:0x215
	if(V == B.Target)
	{
		return 0;
	}
	// End:0x276
	if((((V != none) && float(V.Health) < V.HealthMax) && V.LinkHealMult > float(0)) && B.LineOfSightTo(V))
	{
		return 0;
	}
	// End:0x284
	if(Rand(100) < 10)
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
	// End:0x3E
	if(RecommendHeal(B))
	{
		return 1.2000000;
	}
	rating = super.GetAIRating();
	// End:0x64
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.5000000, dist, 3072.0000000, 3072.0000000);
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

function float SuggestAttackStyle()
{
	return 0.3000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.3000000;
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
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;20.0;0.9;80.0;0.0;0.4;0.1")
	ParamsClasses[0]=Class'BallisticProV55.A73WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.A73WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.A73WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.A73WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_A73'
	BigIconCoords=(X1=0,Y1=32,X2=511,Y2=220)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Putaway',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	SightBobScale=0.7000000
	bNonCocking=true
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc7',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross4',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=65,G=68,B=255,A=137),Color2=(R=255,G=185,B=96,A=255),StartSize1=133,StartSize2=47)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	MeleeFireClass=Class'BallisticProV55.A73MeleeFire'
	bWT_RapidProj=true
	bWT_Energy=true
	ManualLines[0]="Launches a torrent of energy projectiles. The damage of these projectiles increases at range.||This attack generates heat, and if the weapon overheats, the fire rate is reduced and the player will take damage."
	ManualLines[1]="Launches a single, slower moving yet powerful projectile with minor radius damage. This projectile inflicts a short-duration blind effect and increased damage upon a direct hit. Spreads when used from the hip.||This attack generates substantial heat, and the player will take damage if the weapon overheats."
	ManualLines[2]="Has a melee attack. The damage of this attack increases to its maximum over 1.5 seconds of holding the altfire key. It inflicts more damage on a backstab.||The A73 is effective at close range and very effective at medium range. It is also capable of healing nodes and vehicles with its plasma attacks. As an energy weapon, the A73 has lower recoil than conventional arms and its projectiles penetrate players but not walls and surfaces."
	UsedAmbientSound=Sound'BW_Core_WeaponSound.A73.A73Hum1'
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	SightOffset=(X=14.0000000,Y=0.0000000,Z=5.5000000)
	FireModeClass[0]=Class'BallisticProV55.A73PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.A73SecondaryFire'
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	bShowChargingBar=true
	Description="The A73 is an energy-based assault rifle. It was one of the most devastating weapons in the first Human-Skrith war, before the production of energy resistant armor. Many UTC divisions suffered immense casualties at the hands of Skrith A73s and the savage manner in which they were used. The weapon uses a 90MW Skrith charge module for ammunition. Despite the dangerous energy projectile of the weapon, capable of burning through metal, the Skrith prefer brutal melee combat to ranged battle so the A73 was outfitted with razor sharp, Triclonium blades, making it even more popular among the alien warriors."
	Priority=39
	HudColor=(R=100,G=175,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	GroupOffset=1
	PickupClass=Class'BallisticProV55.A73Pickup'
	PlayerViewOffset=(X=-5.0000000,Y=8.0000000,Z=-9.0000000)
	AttachmentClass=Class'BallisticProV55.A73Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_A73'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="A73 Skrith Rifle"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.A73_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BW_Core_WeaponTex.A73.A73AmmoSkin'
	Skins[2]=Shader'BW_Core_WeaponTex.A73.A73Skin_SD'
	Skins[3]=Texture'BW_Core_WeaponTex.A73.A73SkinB'
	Skins[4]=Shader'BW_Core_WeaponTex.A73.A73BladeShader'
	SoundPitch=56
	SoundRadius=32.0000000
}
