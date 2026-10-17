class BX5Mine extends BallisticWeapon
	config(BallisticProV55);

var bool bSpringMode;
var() name SpringOnAnim;
var() name SpringOffAnim;
var() FullSound DeploySound;
var() FullSound OpenSound;
var() FullSound CloseSound;
var float LastMineCheckTime;
var float Failure;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSetSringMode;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientPlayMineDeploy;
}

simulated function ClientPlayMineDeploy()
{
	BX5PrimaryFire(FireMode[0]).ClientPlayMineDeploy();
	//return;	
}

function ServerSetSringMode(bool bNewValue)
{
	bSpringMode = bNewValue;
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	SwitchSpringMode();
	//return;	
}

simulated function SwitchSpringMode()
{
	// End:0x20
	if(!bSpringMode)
	{
		PlayAnim(SpringOnAnim, 1.0000000, 0.1000000);		
	}
	else
	{
		PlayAnim(SpringOffAnim, 1.0000000, 0.1000000);
	}
	bSpringMode = !bSpringMode;
	// End:0x84
	if(bSpringMode)
	{
		IdleAnim = 'SecIdle';
		SelectAnim = 'SecPullout';
		PutDownAnim = 'Secputaway';
		FireMode[0].FireAnim = 'SecDeploy';		
	}
	else
	{
		IdleAnim = 'Idle';
		SelectAnim = 'Pullout';
		PutDownAnim = 'putaway';
		FireMode[0].FireAnim = 'Deploy';
	}
	// End:0xE0
	if(int(Level.NetMode) == int(NM_Client))
	{
		ServerSetSringMode(bSpringMode);
	}
	//return;	
}

simulated function Notify_BX5Open()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, OpenSound);
	//return;	
}

simulated function Notify_BX5Close()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, CloseSound);
	//return;	
}

simulated function Notify_BX5Deploy()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, DeploySound);
	SetBoneScale(0, 0.0000000, 'Mine');
	// End:0x3A
	if((AmmoAmount(0)) < 1)
	{
		KillWeapon(true);
	}
	//return;	
}

simulated function Notify_BX5OutOfSight()
{
	// End:0x21
	if((AmmoAmount(0)) > 0)
	{
		SetBoneScale(0, 1.0000000, 'Mine');		
	}
	else
	{
		KillWeapon(true);
	}
	//return;	
}

simulated function KillWeapon(optional bool bCreateGhost)
{
	local BCGhostWeapon GW;
	local Weapon W;
	local Inventory Inv;

	AIRating = -999.0000000;
	Priority = byte(-999);
	Instigator.Weapon = none;
	// End:0x14D
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x92
		if(bCreateGhost)
		{
			GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
			// End:0x92
			if(GW != none)
			{
				GW.MyWeaponClass = Class;
				GW.GiveTo(Instigator);
			}
		}
		// End:0x14D
		if(AIController(Instigator.Controller) != none)
		{
			Inv = Instigator.Inventory;
			J0xBF:

			// End:0x101 [Loop If]
			if(Inv != none)
			{
				// End:0xEA
				if((Weapon(Inv) != none) && Inv != self)
				{
					// [Explicit Break]
					goto J0x101;
				}
				Inv = Inv.Inventory;
				// [Loop Continue]
				goto J0xBF;
			}
			J0x101:

			// End:0x14D
			if(Inv == none)
			{
				W = Spawn(Class'BCoreProV55.NullGun', Instigator,, Instigator.Location);
				// End:0x14D
				if(W != none)
				{
					W.GiveTo(Instigator);
				}
			}
		}
	}
	// End:0x244
	if(Instigator != none)
	{
		// End:0x18C
		if(PlayerController(Instigator.Controller) != none)
		{
			Instigator.Controller.ClientSwitchToBestWeapon();			
		}
		else
		{
			// End:0x244
			if(AIController(Instigator.Controller) != none)
			{
				Inv = Instigator.Inventory;
				J0x1B9:

				// End:0x244 [Loop If]
				if(Inv != none)
				{
					// End:0x22D
					if((Weapon(Inv) != none) && Weapon(Inv) != self)
					{
						// End:0x202
						if(!Weapon(Inv).HasAmmo())
						{							
						}
						else
						{
							Instigator.PendingWeapon = Weapon(Inv);
							Instigator.ChangedWeapon();
							// [Explicit Break]
							goto J0x244;
						}
					}
					Inv = Inv.Inventory;
					// [Loop Continue]
					goto J0x1B9;
				}
			}
		}
	}
	J0x244:

	Destroy();
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	SetBoneScale(0, 1.0000000, 'Mine');
	// End:0x45
	if(AIController(Instigator.Controller) != none)
	{
		bSpringMode = FRand() > 0.5000000;
	}
	//return;	
}

function DropFrom(Vector StartLocation)
{
	// End:0x1A
	if(!bCanThrow && PickupClass != none)
	{
		return;
	}
	// End:0x2C
	if(!HasAmmo())
	{
		PickupClass = none;
	}
	super.DropFrom(StartLocation);
	//return;	
}

function bool ShouldFireWithoutTarget()
{
	return true;
	//return;	
}

function bool CanAttack(Actor Other)
{
	local float dist;
	local BallisticProjectile bp;

	// End:0x0F
	if((AmmoAmount(0)) < 1)
	{
		return false;
	}
	// End:0x32
	if((Instigator == none) || Instigator.Controller == none)
	{
		return false;
	}
	// End:0x150
	if(Other != none)
	{
		dist = VSize(Instigator.Location - Other.Location);
		// End:0x150
		if(((dist < float(80)) || bSpringMode && dist < float(150)) && AIController(Instigator.Controller).Skill > float(Rand(7)))
		{
			// End:0x14E
			if((Level.TimeSeconds - LastMineCheckTime) > 1.0000000)
			{
				// End:0xFF
				if(Failure > (Level.TimeSeconds + float(5)))
				{
					Failure = 0.0000000;
					return true;
				}
				LastMineCheckTime = Level.TimeSeconds;
				// End:0x142
				if(Failure < Level.TimeSeconds)
				{
					Failure = Level.TimeSeconds;					
				}
				else
				{
					Failure += 2.0000000;
				}
			}
			return false;
		}
	}
	// End:0x236
	if((Level.TimeSeconds - LastMineCheckTime) > 1.0000000)
	{
		// End:0x19A
		if(Failure > (Level.TimeSeconds + float(5)))
		{
			Failure = 0.0000000;
			return true;
		}
		LastMineCheckTime = Level.TimeSeconds;
		// End:0x232
		foreach VisibleCollidingActors(Class'BCoreProV55.BallisticProjectile', bp, 150.0000000, Instigator.Location)
		{
			// End:0x231
			if((BX5VehicleMine(bp) != none) || BX5SpringMine(bp) != none)
			{
				// End:0x222
				if(Failure < Level.TimeSeconds)
				{
					Failure = Level.TimeSeconds;					
				}
				else
				{
					Failure += 2.0000000;
				}				
				return false;
			}			
		}				
	}
	else
	{
		return false;
	}
	return true;
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
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x2B
	if(B == none)
	{
		return super.GetAIRating();
	}
	// End:0x4F
	if(Failure > (Level.TimeSeconds + float(4)))
	{
		return 0.1000000;
	}
	// End:0x7D
	if((Level.TimeSeconds - Instigator.LastPainTime) < 4.0000000)
	{
		return 0.2000000;
	}
	// End:0xAB
	if((Level.TimeSeconds - Instigator.LastPainTime) < 8.0000000)
	{
		return 0.4000000;
	}
	// End:0xC5
	if(B.Enemy == none)
	{
		return 1.0000000;
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	// End:0x1C7
	if(((((Vehicle(B.Enemy) != none) && Vehicle(B.Enemy).bStationary) && (dist / VSize(B.Enemy.Velocity)) > float(3)) && (Level.TimeSeconds - Instigator.LastPainTime) > float(3)) && (Normal(B.Enemy.Velocity) Dot Normal(Dir)) < -0.7000000)
	{
		Result = 0.8000000;
	}
	return super.GetAIRating();
	//return;	
}

function float SuggestAttackStyle()
{
	// End:0x24
	if((Level.TimeSeconds - Failure) > float(2))
	{
		return 1.0000000;
	}
	return -1.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

defaultproperties
{
	SpringOnAnim="SecStart"
	SpringOffAnim="SecFinish"
	DeploySound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-Deploy',Volume=1.0000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	OpenSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOn',Volume=1.0000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	CloseSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOff',Volume=1.0000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="260.0;20.0;0.6;60.0;0.0;0.0;1.0")
	ParamsClasses[0]=Class'BallisticProV55.BX5WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.BX5WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.BX5WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.BX5WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_BX5'
	BigIconCoords=(X1=0,Y1=24,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-Pullout',Volume=0.1070000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-Putaway',Volume=0.1070000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bUseSights=false
	bNoMag=true
	NDCrosshairCfg=(Pic1=none,Pic2=Texture'BW_Core_WeaponTex.Crosshairs.A73OutA',USize1=128,VSize1=128,USize2=256,VSize2=256,Color1=(R=119,G=78,B=23,A=255),Color2=(R=158,G=98,B=0,A=255),StartSize1=135,StartSize2=87)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Trap=true
	ManualLines[0]="Places a BX5 mine."
	ManualLines[1]="Changes the mode of the mine. With the base extended outwards, the mine will spring off its base and explode in the air after a short delay. It will have a greater trigger radius in this mode. With the base not extended, the mine will explode immediately, but only upon direct contact."
	ManualLines[2]="This weapon is no longer available due to its effectiveness being independent of skill and its primary usage being to trap places where it cannot be avoided."
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BallisticProV55.BX5PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.BX5SecondaryFire'
	PutDownTime=0.7000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.3000000
	CurrentRating=0.3000000
	Description="Land mines have been around for centuries, changing little in their time. Used mainly for anti-vehicle use, the BX5 Mine is an efficient killer when used correctly. Mines can be easily hidden under dirt and leaves, and wait for unsuspecting vehicles to drive over them. The BX5 Switching Mine is a greatly modified version of the standard device with increased trigger sensitivity and the new jumping ability to make it an anti-infantry weapon. When approached, the device will spring from its unfolded base, and then explode, causing much harm to anyone unfortunate enough to be within its radius. As the Skrith did not know of such devices, the Terrans used them with great effectiveness against their oblivious troops and vehicles."
	Priority=0
	HudColor=(R=50,G=150,B=25,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	GroupOffset=21
	PickupClass=Class'BallisticProV55.BX5Pickup'
	PlayerViewOffset=(X=15.0000000,Y=0.0000000,Z=-18.0000000)
	AttachmentClass=Class'BallisticProV55.BX5Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_BX5'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="BX5-SM Land Mine"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.BX5_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BW_Core_WeaponTex.BX5.BX5Skin'
}
