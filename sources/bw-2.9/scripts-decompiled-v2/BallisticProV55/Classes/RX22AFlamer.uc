class RX22AFlamer extends BallisticWeapon
	config(BallisticProV55);

var float HeatLevel;
var RX22AHeater Heater;
var() FullSound PackOnSound;
var() FullSound LeverOnSound;
var() FullSound LeverOffSound;
var RX22AFireControl FireControl;
var RX22ASpray Flame;
var RX22AGasSpray GasSpray;
var() name ValveAnim;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		FireControl;
}

simulated function PostNetBeginPlay()
{
	local RX22AFireControl FC;

	super.PostNetBeginPlay();
	// End:0x6A
	if((int(Role) == int(ROLE_Authority)) && FireControl == none)
	{
		// End:0x5A
		foreach DynamicActors(Class'BallisticProV55.RX22AFireControl', FC)
		{
			// End:0x59
			if(FC.Class == Class'BallisticProV55.RX22AFireControl')
			{
				FireControl = FC;				
				return;
			}			
		}		
		FireControl = Spawn(Class'BallisticProV55.RX22AFireControl', none);
	}
	//return;	
}

function RX22AFireControl GetFireControl()
{
	return FireControl;
	//return;	
}

simulated function Notify_RX22APackOn()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, PackOnSound);
	//return;	
}

simulated function Notify_RX22ALeverOn()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LeverOnSound);
	//return;	
}

simulated function Notify_RX22ALeverOff()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LeverOffSound);
	//return;	
}

simulated function Vector ConvertFOVs(Vector InVec, float InFOV, float OutFOV, float Distance)
{
	local Vector ViewLoc, Outvec, Dir, X, Y, Z;

	local Rotator ViewRot;

	ViewLoc = Instigator.Location + Instigator.EyePosition();
	ViewRot = Instigator.GetViewRotation();
	Dir = InVec - ViewLoc;
	GetAxes(ViewRot, X, Y, Z);
	Outvec.X = Distance / Tan((OutFOV * 3.1415930) / float(360));
	Outvec.Y = ((Dir Dot Y) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec.Z = ((Dir Dot Z) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec = Outvec >> ViewRot;
	return Outvec + ViewLoc;
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	super.RenderOverlays(C);
	// End:0xA3
	if(Flame != none)
	{
		Flame.SetLocation(ConvertFOVs(GetBoneCoords('tip').Origin, DisplayFOV, Instigator.Controller.FovAngle, 32.0000000));
		Flame.SetRotation(Rotator(GetFireDir() >> (GetPlayerAim())));
		C.DrawActor(Flame, false, false, Instigator.Controller.FovAngle);		
	}
	else
	{
		// End:0x151
		if(GasSpray != none)
		{
			GasSpray.SetLocation(ConvertFOVs(GetBoneCoords('tip').Origin + (Vector(Instigator.GetViewRotation()) * float(32)), DisplayFOV, Instigator.Controller.FovAngle, 32.0000000));
			GasSpray.SetRotation(Rotator(GetFireDir() >> (GetPlayerAim())));
			C.DrawActor(GasSpray, false, false, Instigator.Controller.FovAngle);
		}
	}
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x89
	if(HeatLevel > float(0))
	{
		// End:0x4C
		if(PhysicsVolume.bWaterVolume)
		{
			HeatLevel = FMax(0.0000000, HeatLevel - (dt * float(5)));			
		}
		else
		{
			// End:0x89
			if(LastFireTime < (Level.TimeSeconds - float(4)))
			{
				HeatLevel = FMax(0.0000000, HeatLevel - (dt / float(10)));
			}
		}
	}
	//return;	
}

simulated function WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x59
	if(FireMode[0].IsFiring() && RX22APrimaryFire(FireMode[0]).bIgnited)
	{
		HeatLevel = FMin(1.0000000, HeatLevel + (dt / float(6)));
	}
	// End:0x78
	if(Heater != none)
	{
		Heater.SetHeat(HeatLevel);
	}
	// End:0x147
	if(((ThirdPersonActor != none) && !Instigator.IsFirstPerson()) && AIController(Instigator.Controller) == none)
	{
		// End:0xFF
		if(Flame != none)
		{
			Flame.SetLocation(RX22AAttachment(ThirdPersonActor).GetModeTipLocation());
			Flame.SetRotation(Rotator(GetFireDir() >> (GetPlayerAim())));			
		}
		else
		{
			// End:0x147
			if(GasSpray != none)
			{
				GasSpray.SetLocation(RX22AAttachment(ThirdPersonActor).GetModeTipLocation());
				GasSpray.SetRotation(Rotator(GetFireDir() >> (GetPlayerAim())));
			}
		}
	}
	//return;	
}

simulated event Destroyed()
{
	// End:0x1C
	if(Flame != none)
	{
		Flame.bHidden = false;
	}
	// End:0x38
	if(GasSpray != none)
	{
		GasSpray.bHidden = false;
	}
	// End:0x4F
	if(Heater != none)
	{
		Heater.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated exec function CockGun(optional byte Type)
{
	//return;	
}

function ServerCockGun(optional byte Type)
{
	//return;	
}

function DropFrom(Vector StartLocation)
{
	local int M;

	// End:0x2F
	if(!RX22AAttachment(ThirdPersonActor).GasTank.GoneOff())
	{
		super.DropFrom(StartLocation);
		return;
	}
	// End:0x41
	if(AmbientSound != none)
	{
		AmbientSound = none;
	}
	ClientWeaponThrown();
	M = 0;
	J0x4E:

	// End:0x9A [Loop If]
	if(M < 2)
	{
		// End:0x90
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0x4E;
	}
	// End:0xDC
	if(int(RX22AAttachment(ThirdPersonActor).GasTank.DeathStage) < 12)
	{
		RX22AAttachment(ThirdPersonActor).GasTank.GoRogue();
	}
	// End:0xF2
	if(Instigator != none)
	{
		DetachFromPawn(Instigator);
	}
	Destroy();
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;
	local int i;

	B = Bot(Instigator.Controller);
	// End:0x2B
	if(B == none)
	{
		return byte(Rand(2));
	}
	// End:0x42
	if(B.Target == none)
	{
		return 1;
	}
	dist = VSize(B.Target.Location - Instigator.Location);
	// End:0x93
	if(dist > FireMode[0].MaxRange())
	{
		return byte(Rand(2));
	}
	// End:0xDB
	if((dist > FireMode[1].MaxRange()) && (Level.TimeSeconds - Instigator.LastPainTime) < 2.0000000)
	{
		return 0;
	}
	// End:0x2E7
	if((B.Skill > float(Rand(7))) && FireControl != none)
	{
		i = 0;
		J0x108:

		// End:0x290 [Loop If]
		if(i < FireControl.GasNodes.Length)
		{
			// End:0x286
			if((FireControl.GasNodes[i] != none) && FireControl.GasNodes[i].Base == B.Target)
			{
				// End:0x193
				if(!FireControl.GasNodes[i].bCanFeed)
				{
					return 0;
				}
				// End:0x241
				if(FireControl.GasNodes[i].bCanIgnite && (((dist > FireMode[1].MaxRange()) || FireControl.GasNodes[i].Fuel >= (FireControl.GasNodes[i].MaxFuel * 0.9000000)) || MagAmmo < 20) || Instigator.Health < 20)
				{
					return 0;
				}
				// End:0x283
				if((float(Instigator.Health) + ((Level.TimeSeconds - Instigator.LastPainTime) * float(5))) < float(30))
				{
					return 0;
				}
				return 1;
			}
			i++;
			// [Loop Continue]
			goto J0x108;
		}
		// End:0x29F
		if(MagAmmo < 20)
		{
			return 0;
		}
		// End:0x2E1
		if((float(Instigator.Health) + ((Level.TimeSeconds - Instigator.LastPainTime) * float(5))) < float(30))
		{
			return 0;
		}
		return 1;		
	}
	else
	{
		// End:0x315
		if((Level.TimeSeconds - Instigator.LastPainTime) < 1.5000000)
		{
			return 0;			
		}
		else
		{
			// End:0x336
			if(dist > FireMode[1].MaxRange())
			{
				return 0;				
			}
			else
			{
				// End:0x355
				if(FRand() > (1.0000000 - B.Aggression))
				{
					return 0;
				}
			}
		}
		return 1;
	}
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.2000000, dist, 2048.0000000, 512.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return 1.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -1.0000000;
	//return;	
}

defaultproperties
{
	PackOnSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-PackOn',Volume=0.6000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	LeverOnSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-LeverOn',Volume=0.6000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	LeverOffSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-LeverOff',Volume=0.6000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ValveAnim="TurnValve"
	SpecialInfo[0]=(Id="EvoDefs",Info="360.0;50.0;0.96;90.0;0.0;0.3;1.0")
	ParamsClasses[0]=Class'BallisticProV55.RX22AWeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.RX22AWeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.RX22AWeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.RX22AWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_RX22A'
	BigIconCoords=(X1=0,Y1=48,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-Pullout',Volume=0.2100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-Putaway',Volume=0.2100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	SightDisplayFOV=40.0000000
	SightZoomFactor=1.2000000
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-PipeOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-PipeIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc8',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.G5OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=94),Color2=(R=255,G=255,B=0,A=181),StartSize1=115,StartSize2=82)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.7000000
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_RapidProj=true
	bWT_Projectile=true
	bWT_Super=true
	ManualLines[0]="Sprays fire, blinding the enemy, inflicting initial damage and burning them for damage over time. Hip-accurate and capable of hitting multiple enemies at a time. May cause surfaces struck to burn."
	ManualLines[1]="Sprays unignited flamer gas. This gas will collect on surfaces or players. When on a surface, it can be ignited later to set a trap for the enemy or to close off areas. When on a player, it increases the damage dealt by the next primary attack."
	ManualLines[2]="Has a high capacity, but long reload time. Will not function underwater.||Effective at close range. Extremely effective when used defensively."
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	SightOffset=(X=-12.0000000,Y=0.0000000,Z=7.0000000)
	FireModeClass[0]=Class'BallisticProV55.RX22APrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.RX22ASecondaryFire'
	BringUpTime=1.2000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.9000000
	CurrentRating=0.9000000
	Description="A very deadly weapon designed and constructed by the UTCï¿½s Defence Research Wing, to combat the Cryons before the second Human-Skrith war. It proved highly effective, being unchallenged by both of the Skrithï¿½s major allies, the Cryons and Krao. The RX22A proved to be an extrmely useful weapon, when clearing out Krao from many underground tunnels and facilities on the OutWorld planet. The weapon, now feared by Cryons. and especially Krao, is one of the most dangerous weapons a Terran soldier may possess. Despite its long range, searing flames and ability to litterally fill a small room with fire make it a very powerful weapon, it has a great disadvantage. The flames may just as easily incinerate the operator when used close up, and if the fuel tanks carried on the soldiers back, were to rupture and catch fire, the user may find themselves in a very unpleasant situation."
	Priority=46
	HudColor=(R=255,G=50,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	GroupOffset=1
	PickupClass=Class'BallisticProV55.RX22APickup'
	PlayerViewOffset=(X=5.0000000,Y=2.0000000,Z=-2.0000000)
	AttachmentClass=Class'BallisticProV55.RX22AAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_RX22A'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="RX-22A Flamethrower"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.RX22A_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BW_Core_WeaponTex.RX22A.RX22ASkin'
	Skins[2]=Texture'BW_Core_WeaponTex.RX22A.RX22AShield'
	bFullVolume=true
	SoundRadius=128.0000000
}
