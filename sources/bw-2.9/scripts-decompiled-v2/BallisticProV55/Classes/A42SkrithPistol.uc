class A42SkrithPistol extends BallisticHandgun
	config(BallisticProV55);

var float NextAmmoTickTime;
var Actor GlowFX;
var float HeatLevel;
var float HeatDeclineTime;
var() Sound OverheatSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSetHeat;
}

simulated function bool CanAlternate(int Mode)
{
	// End:0x2C
	if(((Mode != 0) && OtherGun != none) && A42SkrithPistol(OtherGun) == none)
	{
		return false;
	}
	return super.CanAlternate(Mode);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x22
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	// End:0x16E
	if((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
	{
		// End:0xA3
		if(int(LayoutIndex) == 1)
		{
			GlowFX = none;
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BallisticProV55.A42AmbientFXRed', DrawScale, self, 'tip');			
		}
		else
		{
			// End:0xDF
			if(int(LayoutIndex) == 2)
			{
				GlowFX = none;
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BallisticProV55.A42AmbientFXGreen', DrawScale, self, 'tip');				
			}
			else
			{
				GlowFX = none;
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BallisticProV55.A42AmbientFX', DrawScale, self, 'tip');
			}
		}
		// End:0x16E
		if(GlowFX != none)
		{
			// End:0x16E
			if((IsSlave() && OtherGun.hand >= float(0)) || !IsSlave() && hand < float(0))
			{
				GlowFX.SetRelativeRotation(rot(0, 0, 32768));
			}
		}
	}
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

simulated function float AmmoStatus(optional int Mode)
{
	return float(MagAmmo) / float(default.MagAmmo);
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated event Tick(float dt)
{
	super(BallisticWeapon).Tick(dt);
	// End:0x62
	if(NextAmmoTickTime < Level.TimeSeconds)
	{
		// End:0x47
		if(MagAmmo < default.MagAmmo)
		{
			MagAmmo = Min(default.MagAmmo, MagAmmo + 1);
		}
		NextAmmoTickTime = Level.TimeSeconds + 0.3500000;
	}
	// End:0xA8
	if((HeatLevel > float(0)) && Level.TimeSeconds > HeatDeclineTime)
	{
		HeatLevel = FMax(HeatLevel - (float(10) * dt), 0.0000000);
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local float F;

	super.WeaponTick(dt);
	// End:0x5C
	if(FireMode[1].IsFiring())
	{
		F = 56.0000000 + (float(32) * (FMin(FireMode[1].HoldTime, 2.0000000) / float(2)));
		SoundPitch = byte(F);
	}
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
	HeatDeclineTime = FMax(Level.TimeSeconds + DeclineTime, HeatDeclineTime);
	// End:0x5F
	if(HeatLevel >= 9.7500000)
	{
		HeatLevel = 10.0000000;
		return;
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	HeatLevel = NewHeat;
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
	if((AmmoAmount(0)) < FireMode[1].AmmoPerFire)
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
	// End:0x2A9
	if(dist > float(1024))
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

	// End:0x0F
	if(IsSlave())
	{
		return 0.0000000;
	}
	B = Bot(Instigator.Controller);
	// End:0x39
	if(B == none)
	{
		return AIRating;
	}
	// End:0x4D
	if(RecommendHeal(B))
	{
		return 1.1000000;
	}
	// End:0x68
	if(B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	switch(BestMode())
	{
		// End:0xE4
		case 0:
			return Class'BCoreProV55.BUtil'.static.DistanceAtten(Result, 0.3300000, dist, 1024.0000000, 2048.0000000);
		// End:0xEF
		case 1:
			return 0.5000000;
		// End:0xFFFF
		default:
			//return;
			break;
	}	
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
	return 0.7000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.7000000;
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

simulated function float ChargeBar()
{
	// End:0x2F
	if(FireMode[1].IsFiring())
	{
		return FMin(FireMode[1].HoldTime, 1.0000000);		
	}
	else
	{
		return HeatLevel / float(10);
	}
	//return;	
}

defaultproperties
{
	bShouldDualInLoadout=false
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;-15.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BallisticProV55.A42WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.A42WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.A42WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.A42WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_A42'
	BigIconCoords=(X1=80,Y1=24,X2=410,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Pullout',Volume=0.1485000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Putaway',Volume=0.1510000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bNoCrosshairInScope=true
	bNonCocking=true
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc7',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc10',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=89,G=44,B=160,A=137),Color2=(R=0,G=255,B=151,A=202),StartSize1=84,StartSize2=61)
	NDCrosshairInfo=(SpreadRatios=(X1=0.3000000,Y1=0.3000000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.7000000
	MeleeFireClass=Class'BallisticProV55.A42MeleeFire'
	bWT_RapidProj=true
	bWT_Energy=true
	ManualLines[0]="Launches moderate damage plasma projectiles at a good rate of fire. These projectiles gain damage over range."
	ManualLines[1]="A charging hitscan beam whose lethality increases with charge. Both pistols will charge and fire simultaneously if dual wielded."
	ManualLines[2]="Due to rechargeable batteries, the A42 will regain ammo at a slow rate when not in use. It is moderately effective at close range, with low recoil and good hipfire. A42 plasma will repair nodes and vehicles. The projectile attack will only penetrate players and not the environment."
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	SightOffset=(X=-80.0000000,Y=-6.0000000,Z=18.2500000)
	MagAmmo=18
	FireModeClass[0]=Class'BallisticProV55.A42PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.A42SecondaryFire'
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bShowChargingBar=true
	Description="The A42 is an energy pistol of Skrith origin. Nicknamed 'Whip' by the UTC Marines, it has been the standard issue Skrith sidearm in both wars."
	Priority=16
	HudColor=(R=100,G=175,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	PickupClass=Class'BallisticProV55.A42Pickup'
	PlayerViewOffset=(X=32.0000000,Y=19.0000000,Z=-13.0000000)
	AttachmentClass=Class'BallisticProV55.A42Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_A42'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="A42 Skrith Sidearm"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.A42_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BW_Core_WeaponTex.A42.A42Skin_SD'
	SoundPitch=56
	SoundRadius=32.0000000
}
