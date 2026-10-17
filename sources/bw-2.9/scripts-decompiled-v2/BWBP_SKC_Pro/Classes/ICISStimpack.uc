class ICISStimpack extends BallisticWeapon
	config(BallisticProV55);

var() Sound HealSound;
var float LastRegenTick;

simulated function Notify_SelfInject()
{
	PlaySound(HealSound, 1, 1.5000000,, 64.0000000);
	//return;	
}

simulated function Tick(float dt)
{
	super.Tick(dt);
	// End:0x5B
	if(!IsFiring() && Level.TimeSeconds >= LastRegenTick)
	{
		Ammo[0].AddAmmo(1);
		LastRegenTick = Level.TimeSeconds + float(1);
	}
	//return;	
}

simulated function bool PutDown()
{
	local BCGhostWeapon GW;

	// End:0x8C
	if(super.PutDown())
	{
		// End:0x8A
		if(Ammo[0].AmmoAmount < 1)
		{
			GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
			// End:0x70
			if(GW != none)
			{
				GW.MyWeaponClass = Class;
				GW.GiveTo(Instigator);
			}
			Timer();
			PickupClass = none;
			DropFrom(Location);
			return true;
		}
		return true;
	}
	return false;
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x39
	if(Anim == FireMode[0].FireAnim)
	{
		CheckNoGrenades();		
	}
	else
	{
		// End:0x51
		if(Anim == SelectAnim)
		{
			PlayIdle();			
		}
		else
		{
			super.AnimEnd(Channel);
		}
	}
	//return;	
}

simulated function CheckNoGrenades()
{
	local BCGhostWeapon GW;
	local Inventory Inv;

	// End:0x1EF
	if((Ammo[0] != none) && (Ammo[0].AmmoAmount < 1) || (Ammo[0].AmmoAmount == 1) && (bFireMode[0].ConsumedLoad > 0) || bFireMode[1].ConsumedLoad > 0)
	{
		AIRating = -999.0000000;
		Priority = byte(-999);
		// End:0xA9
		if(Instigator.Weapon == self)
		{
			Instigator.Weapon = none;
		}
		// End:0x10A
		if(int(Role) == int(ROLE_Authority))
		{
			GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
			// End:0x10A
			if(GW != none)
			{
				GW.MyWeaponClass = Class;
				GW.GiveTo(Instigator);
			}
		}
		// End:0x1E9
		if(Instigator != none)
		{
			// End:0x131
			if(PlayerController(Instigator.Controller) != none)
			{				
			}
			else
			{
				// End:0x1E9
				if(AIController(Instigator.Controller) != none)
				{
					Inv = Instigator.Inventory;
					J0x15E:

					// End:0x1E9 [Loop If]
					if(Inv != none)
					{
						// End:0x1D2
						if((Weapon(Inv) != none) && Weapon(Inv) != self)
						{
							// End:0x1A7
							if(!Weapon(Inv).HasAmmo())
							{								
							}
							else
							{
								Instigator.PendingWeapon = Weapon(Inv);
								Instigator.ChangedWeapon();
								// [Explicit Break]
								goto J0x1E9;
							}
						}
						Inv = Inv.Inventory;
						// [Loop Continue]
						goto J0x15E;
					}
				}
			}
		}
		J0x1E9:

		Destroy();		
	}
	else
	{
		PlayAnim(SelectAnim, SelectAnimRate, 0.0000000);
	}
	//return;	
}

simulated function RemoteKill()
{
	local BCGhostWeapon GW;

	AIRating = -999.0000000;
	Priority = byte(-999);
	// End:0x79
	if(int(Role) == int(ROLE_Authority))
	{
		GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
		// End:0x79
		if(GW != none)
		{
			GW.MyWeaponClass = Class;
			GW.GiveTo(Instigator);
		}
	}
	Destroy();
	//return;	
}

function bool CanAttack(Actor Other)
{
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

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x70
	if((float(Instigator.Health) < (Instigator.HealthMax * 0.5000000)) && B.Enemy == none)
	{
		return 1.0000000;
	}
	return 0.0000000;
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

function float SuggestAttackStyle()
{
	return -1.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 1.0000000;
	//return;	
}

defaultproperties
{
	HealSound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-Heal'
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;-999.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.ICISWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.ICISWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.ICISWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.ICISWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.Stim.BigIcon_Stim'
	BigIconCoords=(X1=0,Y1=24,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifePullOut',Volume=0.1120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifePutaway',Volume=0.1120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bUseSights=false
	bNoMag=true
	bNonCocking=true
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.X3OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.X3InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=129,G=0,B=0,A=192),Color2=(R=0,G=196,B=0,A=192),StartSize1=99,StartSize2=107)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	ManualLines[0]="Injects self with the stimpack, granting 80 health over 10 seconds."
	ManualLines[1]="Melee attack. Damage improves over hold time, with max bonus reached after 1.5 seconds. Deals increased damage from behind."
	ManualLines[2]="Attacking allies with the stimpack will apply its effect to them."
	SightingTime=0.0000000
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.ICISPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.ICISSecondaryFire'
	SelectAnimRate=2.5000000
	PutDownAnimRate=1.5000000
	PutDownTime=0.2000000
	BringUpTime=0.2000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.2000000
	CurrentRating=0.2000000
	bMeleeWeapon=true
	Description="Chemical Formula KFBR382, serum #25 is one in a long line of exerimental military stimulants, and is one of the more successful prototypes. It is supplied alongside the heavy-duty Intravenous Chemical Injection System for troop use in dangerous situations, and while previous serums were never able to breach the 50% mortality mark, No. 25 is showing serious potential and is being fielded to select testing groups. Studies show that #25 increases aggression, suppresses pain receptors, and allows troops to continue fighting past fatigue points that were previously thought impossible. Unfortunately, some #25-injected troops are already showing signs of severe psychosis and a few others have already died of unforeseen cardiac explosions."
	Priority=13
	HudColor=(R=75,G=210,B=210,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	PickupClass=Class'BWBP_SKC_Pro.ICISPickup'
	PlayerViewOffset=(X=20.0000000,Y=0.0000000,Z=-10.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.ICISAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.Stim.SmallIcon_Stim'
	IconCoords=(X1=0,Y1=0,X2=128,Y2=32)
	ItemName="FMD ICIS-25 Stimpack"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.Stimpack_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BWBP_SKC_Tex.Stim.Stim-Main'
	Skins[2]=Texture'ONSstructureTextures.CoreGroup.Invisible'
	Skins[3]=Shader'XEffectMat.goop.GoopShader'
}
