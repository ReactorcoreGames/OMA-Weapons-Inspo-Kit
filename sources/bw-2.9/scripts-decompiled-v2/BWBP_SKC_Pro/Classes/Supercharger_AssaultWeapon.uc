class Supercharger_AssaultWeapon extends BallisticWeapon
	config(BallisticProV55);

var Supercharger_ChargeControl ChargeControl;
var() ScriptedTexture WeaponScreen;
var() Material WeaponScreenShader;
var() Material ScreenBase;
var() Material ScreenHeat;
var protected const Color MyFontColor;
var float HeatBar;
var float HeatLevel;
var bool bCriticalHeat;
var() Sound OverheatSound;
var() Sound HighHeatSound;
var() Sound MedHeatSound;
var() Sound VentingSound;
var Actor GlowFX;
var float NextChangeMindTime;
var bool bWaterBurn;
var bool bIsVenting;
var Actor ClawSpark1;
var Actor ClawSpark2;
var float ClawAlpha;
var bool bLatchedOn;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ChargeControl, ClientOverCharge, 
		ClientScreenStart, ClientSetHeat, 
		bLatchedOn;
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
	Skins[2] = WeaponScreenShader;
	UpdateScreen();
	// End:0x58
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	HeatBar = 256.0000000 - ((FMin(HeatLevel, 10.0000000) / 10.0000000) * float(256));
	Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenBase, MyFontColor);
	Tex.DrawTile(HeatBar, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 512.0000000, ScreenHeat, MyFontColor);
	//return;	
}

simulated function UpdateScreen()
{
	// End:0x22
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	// End:0x22
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	super.RenderOverlays(Canvas);
	//return;	
}

simulated function bool ConsumeMagAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	// End:0x52
	if(bNoMag || (bFireMode[Mode] != none) && bFireMode[Mode].bUseWeaponMag == false)
	{
		ConsumeAmmo(Mode, load, bAmountNeededIsMax);		
	}
	else
	{
		// End:0x6D
		if(float(MagAmmo) < load)
		{
			MagAmmo = 0;			
		}
		else
		{
			MagAmmo -= int(load);
		}
	}
	UpdateScreen();
	return true;
	//return;	
}

simulated function ClientOverCharge()
{
	// End:0x1B
	if(FireMode[0].bIsFiring)
	{
		StopFire(0);
	}
	// End:0x36
	if(FireMode[1].bIsFiring)
	{
		StopFire(1);
	}
	//return;	
}

simulated function float ChargeBar()
{
	return HeatLevel / float(10);
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x58
	if(HeatLevel > float(0))
	{
		// End:0x38
		if(bIsVenting)
		{
			HeatLevel = FMax(HeatLevel - (float(4) * dt), 0.0000000);			
		}
		else
		{
			HeatLevel = FMax(HeatLevel - (0.4000000 * dt), 0.0000000);
		}
	}
	super.Tick(dt);
	//return;	
}

simulated function AddHeat(float Amount)
{
	HeatLevel += Amount;
	// End:0xB5
	if((HeatLevel >= float(10)) && HeatLevel < float(12))
	{
		HeatLevel = 12.0000000;
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 20.0000000 + float(Rand(40)), Instigator, Instigator.Location, (-Vector(Instigator.GetViewRotation()) * float(30000)) + vect(0.0000000, 0.0000000, 10000.0000000), Class'BWBP_SKC_Pro.DT_SuperchargeOverheat');
		ChargeControl.FireSinge(Instigator, Instigator, 1, 5);
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
	// End:0x1F1
	if(W == none)
	{
		bJustSpawned = true;
		super(Inventory).GiveTo(Other);
		bPossiblySwitch = true;
		W = self;
		// End:0xEA
		if((Pickup != none) && BallisticWeaponPickup(Pickup) != none)
		{
			GenerateLayout(BallisticWeaponPickup(Pickup).LayoutIndex);
			GenerateCamo(BallisticWeaponPickup(Pickup).CamoIndex);
			// End:0xCE
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
			// End:0x126
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = MagAmmo + ((int(!bNonCocking) * int(bMagPlusOne)) * int(!bNeedCock));
		}
		// End:0x1AF
		if(Supercharger_Pickup(Pickup) != none)
		{
			HeatLevel = FMax(0.0000000, Supercharger_Pickup(Pickup).HeatLevel - ((Level.TimeSeconds - Supercharger_Pickup(Pickup).HeatTime) * 0.2500000));
		}
		// End:0x1EE
		if((int(Level.NetMode) == int(NM_ListenServer)) || int(Level.NetMode) == int(NM_DedicatedServer))
		{
			ClientSetHeat(HeatLevel);
		}		
	}
	else
	{
		// End:0x20D
		if(!W.HasAmmo())
		{
			bPossiblySwitch = true;
		}
	}
	// End:0x220
	if(Pickup == none)
	{
		bPossiblySwitch = true;
	}
	M = 0;
	J0x227:

	// End:0x283 [Loop If]
	if(M < 2)
	{
		// End:0x279
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0x227;
	}
	// End:0x2BC
	if((Instigator.Weapon != none) && Instigator.Weapon.IsFiring())
	{
		bPossiblySwitch = false;
	}
	// End:0x2E9
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	bAimDisabled = default.bAimDisabled || !Instigator.IsHumanControlled();
	// End:0x344
	if(!bJustSpawned)
	{
		M = 0;
		J0x31E:

		// End:0x341 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x31E;
		}
		Destroy();
	}
	//return;	
}

simulated event Timer()
{
	// End:0x16
	if(Instigator.Weapon != self)
	{
		return;
	}
	// End:0x4E
	if((!bWaterBurn || int(ClientState) == int(2)) || int(ClientState) == int(3))
	{
		super.Timer();		
	}
	else
	{
		// End:0xBB
		if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && (AmmoAmount(0)) > 0)
		{
			ConsumeAmmo(0, 2.0000000);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Instigator, 2.0000000, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BallisticProV55.DT_HVCDunk');
		}
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Vector End;

	super.WeaponTick(dt);
	// End:0x97
	if(AIController(Instigator.Controller) != none)
	{
		// End:0x88
		if(HeatLevel > float(0))
		{
			// End:0x85
			if(((BotShouldReload()) && !Instigator.Controller.LineOfSightTo(AIController(Instigator.Controller).Enemy)) && !IsGoingToVent())
			{
				BotReload();
			}			
		}
		else
		{
			// End:0x97
			if(bIsVenting)
			{
				ReloadRelease();
			}
		}
	}
	// End:0x12A
	if(Instigator.PhysicsVolume.bWaterVolume)
	{
		// End:0xD1
		if((AmmoAmount(0)) > 0)
		{
			AddHeat(dt * 0.5000000);
		}
		// End:0x127
		if((!bWaterBurn && int(Role) == int(ROLE_Authority)) && (int(ClientState) == int(4)) || !Instigator.IsLocallyControlled())
		{
			bWaterBurn = true;
			SetTimer(0.4000000, true);
		}		
	}
	else
	{
		// End:0x153
		if(bWaterBurn)
		{
			bWaterBurn = false;
			// End:0x153
			if(TimerRate == 0.2000000)
			{
				SetTimer(0.0000000, false);
			}
		}
	}
	// End:0x169
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x1E7
	if(ClawSpark1 != none)
	{
		End = GetBoneCoords('tip').Origin + (Vector(Instigator.GetViewRotation()) * float(96));
		BeamEmitter(Emitter(ClawSpark1).Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(End, End);
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	bIsVenting = false;
	// End:0x4E
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		ScreenStart();
		// End:0x4E
		if(!Instigator.IsLocallyControlled())
		{
			ClientScreenStart();
		}
	}
	super.BringUp(PrevWeapon);
	AmbientSound = none;
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = true;
	//return;	
}

simulated function bool PutDown()
{
	// End:0xC9
	if(super.PutDown())
	{
		// End:0x39
		if(bIsVenting)
		{
			// End:0x33
			if(int(Level.NetMode) == int(NM_Client))
			{
				bIsVenting = false;
			}
			ServerReloadRelease();
		}
		bWaterBurn = false;
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;
		return true;
	}
	return false;
	//return;	
}

simulated function bool IsGoingToVent()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == 'StartReload')
	{
		return true;
	}
	return false;
	//return;	
}

simulated exec function Reload(optional byte i)
{
	// End:0x20
	if(!IsFiring())
	{
		SafePlayAnim('StartReload', 1.0000000, 0.1000000);
	}
	//return;	
}

simulated function Notify_LGArcOff()
{
	Instigator.AmbientSound = VentingSound;
	Instigator.SoundVolume = 128;
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x4C
	if(Anim == 'StartReload')
	{
		// End:0x46
		if(int(Level.NetMode) == int(NM_Client))
		{
			bIsVenting = true;
		}
		ServerStartReload();
	}
	super.AnimEnd(Channel);
	//return;	
}

function ServerStartReload(optional byte i)
{
	// End:0x39
	if(!Instigator.IsLocallyControlled())
	{
		Instigator.AmbientSound = VentingSound;
		Instigator.SoundVolume = 128;
	}
	bIsVenting = true;
	//return;	
}

simulated function PlayIdle()
{
	// End:0x28
	if(bIsVenting)
	{
		SafeLoopAnim('ReloadLoop', 0.5000000, IdleTweenTime,, "IDLE");		
	}
	else
	{
		super.PlayIdle();
	}
	//return;	
}

simulated exec function ReloadRelease(optional byte i)
{
	local name Anim;
	local float frame, Rate;

	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	// End:0x93
	if(!bIsVenting)
	{
		GetAnimParams(0, Anim, frame, Rate);
		// End:0x5A
		if(Anim != 'StartReload')
		{
			return;
		}
		SafePlayAnim('EndReload', 1.0000000, 0.2000000);
		// End:0x90
		if(frame < 0.5000000)
		{
			SetAnimFrame(1.0000000 - frame);
		}		
	}
	else
	{
		SafePlayAnim('EndReload', 1.0000000, 0.2000000);
	}
	// End:0xC9
	if(int(Level.NetMode) == int(NM_Client))
	{
		bIsVenting = false;
	}
	ServerReloadRelease();
	//return;	
}

simulated function Notify_LGArcOn()
{
	//return;	
}

function ServerReloadRelease(optional byte i)
{
	// End:0x3C
	if(!Instigator.IsLocallyControlled())
	{
		Instigator.AmbientSound = UsedAmbientSound;
		Instigator.SoundVolume = default.SoundVolume;
	}
	bIsVenting = false;
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
	if(ClawSpark1 != none)
	{
		ClawSpark1.Destroy();
	}
	// End:0x105
	if((Instigator.AmbientSound == UsedAmbientSound) || Instigator.AmbientSound == VentingSound)
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

function bool BotShouldReload()
{
	// End:0x7F
	if(((!bIsVenting && HeatLevel > float(2)) && (Level.TimeSeconds - AIController(Instigator.Controller).LastSeenTime) > AIReloadTime) && (Level.TimeSeconds - Instigator.LastPainTime) > AIReloadTime)
	{
		return true;
	}
	return false;
	//return;	
}

function bool BotReload(optional bool bForced)
{
	// End:0x3A
	if(bForced || AIController(Instigator.Controller).Skill >= float(Rand(4)))
	{
		Reload();
		return true;
	}
	return false;
	//return;	
}

function bool CanAttack(Actor Other)
{
	local float dist;
	local Vector HitLocation, HitNormal, projStart;
	local Actor HitActor;
	local int EC;
	local AIController B;
	local Actor Victims;

	// End:0x23
	if((Instigator == none) || Instigator.Controller == none)
	{
		return false;
	}
	dist = VSize(Instigator.Location - Other.Location);
	// End:0x6C
	if(dist > FireMode[0].MaxRange())
	{
		BotReload();
		return false;
	}
	// End:0xAB
	if(((BotShouldReload()) && !Instigator.Controller.LineOfSightTo(Other)) && !IsGoingToVent())
	{
		BotReload();
		return false;
	}
	// End:0xCE
	if((HeatLevel >= float(10)) && !IsGoingToVent())
	{
		BotReload();
		return false;
	}
	// End:0x273
	if(Instigator.PhysicsVolume.bWaterVolume)
	{
		B = AIController(Instigator.Controller);
		// End:0x273
		if((B != none) && B.Skill >= float(Rand(4)))
		{
			// End:0x261
			foreach Instigator.PhysicsVolume.TouchingActors(Class'Engine.Actor', Victims)
			{
				// End:0x260
				if(Pawn(Victims) != none)
				{
					dist = VSize(Victims.Location - Instigator.Location);
					// End:0x195
					if(dist > float(1900))
					{
						continue;						
					}
					// End:0x242
					if(Level.Game.bTeamGame && Instigator.Controller.SameTeamAs(Pawn(HitActor).Controller))
					{
						// End:0x23F
						if(((B.Skill >= float(Rand(4))) && TeamGame(Level.Game) != none) && TeamGame(Level.Game).FriendlyFireScale > 0.1000000)
						{							
							return false;
						}
						// End:0x260
						continue;
					}
					EC += Min(1500, int(float(2000) - dist));
				}				
			}			
			// End:0x273
			if(EC < 1990)
			{
				return false;
			}
		}
	}
	// End:0x2E5
	if(((bIsVenting && HeatLevel < float(10)) && AIController(Instigator.Controller).Skill >= float(Rand(5))) && (Level.TimeSeconds - Instigator.LastPainTime) < 0.5000000)
	{
		ReloadRelease();
	}
	// End:0x324
	if(bIsVenting && (AIController(Instigator.Controller).Skill + float(Rand(2))) >= HeatLevel)
	{
		ReloadRelease();
	}
	// End:0x429
	if(Level.Game.bTeamGame)
	{
		projStart = Instigator.Location + Instigator.EyePosition();
		HitActor = Trace(HitLocation, HitNormal, Other.Location + (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000)), projStart, true);
		// End:0x427
		if(((((HitActor == none) || HitActor == Other) || Pawn(HitActor) == none) || Pawn(HitActor).Controller == none) || !Instigator.Controller.SameTeamAs(Pawn(HitActor).Controller))
		{
			return true;
		}
		return false;
	}
	return true;
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
	// End:0x4D
	if(!HasAmmoLoaded(0))
	{
		return 1;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	// End:0x98
	if(dist > float(200))
	{
		return 0;
	}
	// End:0xB6
	if(dist < FireMode[1].MaxRange())
	{
		return 1;
	}
	return byte(Rand(2));
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float Result;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Result = super.GetAIRating();
	// End:0x84
	if(Instigator.PhysicsVolume.bWaterVolume)
	{
		Result -= (0.1500000 * B.Skill);
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.2000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.9000000;
	//return;	
}

defaultproperties
{
	WeaponScreen=ScriptedTexture'BWBP_SKC_Tex.SuperCharger.Supercharger-ScriptLCD'
	WeaponScreenShader=Shader'BWBP_SKC_Tex.SuperCharger.Supercharger-ScriptLCD-SD'
	ScreenBase=Texture'BWBP_SKC_Tex.LS14.LS14-ScreenBase'
	ScreenHeat=Texture'BWBP_SKC_Tex.SuperCharger.Supercharger-ScreenHeat'
	MyFontColor=(R=255,G=255,B=255,A=255)
	OverheatSound=Sound'BWBP_SKC_Sounds.SuperCharger.SC-Overheat'
	VentingSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Coolant'
	SpecialInfo[0]=(Id="EvoDefs",Info="360.0;40.0;1.0;90.0;0.0;0.75;2.0")
	AIReloadTime=0.2000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.SuperchargerWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.SuperCharger.BigIcon_Super'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.SuperCharger.SC-Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-Putaway',Volume=0.2180000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Max Safe Voltage",bUnavailable=false,ModeID="WM_Burst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Overload",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	ScopeViewTex=Texture'BWBP_SKC_Tex.XM20.XM20-ScopeView'
	bNoMag=true
	CockAnim="Idle"
	CockAnimPostReload="Idle"
	bNonCocking=true
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.R78OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.G5InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=0,A=255),Color2=(R=255,G=0,B=0,A=255),StartSize1=90,StartSize2=93)
	LongGunPivot=(Pitch=2000,Yaw=-1024,Roll=0)
	LongGunOffset=(X=-10.0000000,Y=0.0000000,Z=-5.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_RapidProj=true
	bWT_Projectile=true
	bWT_Energy=true
	UsedAmbientSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Ambient'
	SightOffset=(X=27.5000000,Y=0.0000000,Z=4.3000000)
	MagAmmo=100
	GunLength=16.5000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.Supercharger_PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.Supercharger_SecondaryFire'
	PutDownTime=1.5000000
	BringUpTime=1.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bShowChargingBar=true
	Description="Van Holt 500KW Supercharger||Manufacturer: Dipheox Combat Arms|Primary: Directed Energy Fire|Secondary: Magnetically Contained Projectile||Not much is known about this enigmatic CYLO variation. It is extremely rare and a cloesly guarded secret."
	Priority=41
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	PickupClass=Class'BWBP_SKC_Pro.Supercharger_Pickup'
	PlayerViewOffset=(X=8.0000000,Y=6.5000000,Z=-3.5000000)
	AttachmentClass=Class'BWBP_SKC_Pro.Supercharger_Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.SuperCharger.SmallIcon_Super'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="V-H 500KW Supercharger"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.SuperCharger_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Combiner'BW_Core_WeaponTex.M50.NoiseComb'
	Skins[2]=Combiner'BW_Core_WeaponTex.M50.NoiseComb'
	Skins[3]=Texture'BWBP_SKC_Tex.SuperCharger.Supercharger-Main'
}
