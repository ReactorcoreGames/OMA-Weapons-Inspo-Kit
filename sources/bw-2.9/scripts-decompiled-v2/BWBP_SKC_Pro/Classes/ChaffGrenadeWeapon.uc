class ChaffGrenadeWeapon extends BallisticHandGrenade
	config(BallisticProV55);

var bool bPrimed;
var() name PutdownAltAnim;
var() name ClipReleaseAltAnim;
var() name GrenadeBone2;

simulated function ExplodeInHand()
{
	ClipReleaseTime = 666.0000000;
	KillSmoke();
	HandExplodeTime = Level.TimeSeconds + 1.0000000;
	// End:0x5B
	if(IsFiring())
	{
		FireMode[0].bIsFiring = false;
		FireMode[1].bIsFiring = false;
	}
	// End:0x98
	if(int(Role) == int(ROLE_Authority))
	{
		DoExplosionEffects();
		MakeNoise(1.0000000);
		ConsumeAmmo(0, 1.0000000);
		bPrimed = false;
		IdleAnim = 'Idle';
	}
	SetTimer(0.1000000, false);
	//return;	
}

simulated function DoExplosionEffects()
{
	BallisticGrenadeAttachment(ThirdPersonActor).HandExplode();
	// End:0x33
	if(int(Level.NetMode) == int(NM_Client))
	{
		CheckNoGrenades();
	}
	//return;	
}

function DoExplosion()
{
	// End:0x3B
	if(int(Role) == int(ROLE_Authority))
	{
		SpecialHurtRadius(float(HeldDamage), float(HeldRadius), HeldDamageType, float(HeldMomentum), Location);
		CheckNoGrenades();
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x39
	if(Anim == ClipReleaseAnim)
	{
		IdleAnim = 'IdlePrimed';
		PlayIdle();		
	}
	else
	{
		// End:0x59
		if(Anim == ClipReleaseAltAnim)
		{
			IdleAnim = 'Idle';
			PlayIdle();
		}
	}
	// End:0x9E
	if(Anim == FireMode[0].FireAnim)
	{
		SetBoneScale(0, 1.0000000, GrenadeBone);
		SetBoneScale(1, 1.0000000, GrenadeBone2);
		CheckNoGrenades();		
	}
	else
	{
		// End:0xC1
		if(Anim == SelectAnim)
		{
			IdleAnim = 'Idle';
			PlayIdle();			
		}
		else
		{
			AnimEnded(Channel, Anim, frame, Rate);
		}
	}
	//return;	
}

simulated function Timer()
{
	// End:0x25
	if(ClipReleaseTime == float(666))
	{
		ClipReleaseTime = 0.0000000;
		DoExplosion();		
	}
	else
	{
		// End:0x40
		if(ClipReleaseTime < float(0))
		{
			ClipReleaseTime = 0.0000000;			
		}
		else
		{
			// End:0x56
			if(ClipReleaseTime > float(0))
			{
				ExplodeInHand();				
			}
			else
			{
				super.Timer();
			}
		}
	}
	//return;	
}

simulated function CheckNoGrenades()
{
	local BCGhostWeapon GW;

	// End:0x135
	if((Ammo[0] != none) && (Ammo[0].AmmoAmount < 1) || (Ammo[0].AmmoAmount == 1) && (bFireMode[0].ConsumedLoad > 0) || bFireMode[1].ConsumedLoad > 0)
	{
		AIRating = -999.0000000;
		Priority = byte(-999);
		Instigator.Weapon = none;
		// End:0xF6
		if(int(Role) == int(ROLE_Authority))
		{
			GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
			// End:0xF6
			if(GW != none)
			{
				GW.MyWeaponClass = Class;
				GW.GiveTo(Instigator);
			}
		}
		// End:0x12F
		if((Instigator != none) && Instigator.Controller != none)
		{
			Instigator.Controller.ClientSwitchToBestWeapon();
		}
		Destroy();		
	}
	else
	{
		PlayAnim(SelectAnim, 1.0000000, 0.0000000);
		SetBoneRotation('MOACTop', rot(0, 0, 0));
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

simulated function bool PutDown()
{
	local BCGhostWeapon GW;

	// End:0x1F
	if(bPrimed)
	{
		PutDownAnim = PutdownAltAnim;
		bPrimed = false;		
	}
	else
	{
		PutDownAnim = default.PutDownAnim;
	}
	// End:0xD0
	if(super.PutDown())
	{
		ClipReleaseTime = 0.0000000;
		// End:0xCE
		if((Ammo[0] != none) && Ammo[0].AmmoAmount < 1)
		{
			GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
			// End:0xB4
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

simulated function Notify_SilencerHide()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ClipReleaseSound);
	//return;	
}

simulated function Notify_GrenadeLeaveHand()
{
	SetBoneScale(0, 0.0000000, GrenadeBone);
	SetBoneScale(1, 0.0000000, GrenadeBone2);
	// End:0x3A
	if(ClipReleaseTime > float(0))
	{
		ClipReleaseTime = -1.0000000;
	}
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x33
	if(!bPrimed)
	{
		bPrimed = true;
		// End:0x30
		if(!IsFiring())
		{
			PlayAnim(ClipReleaseAnim, 1.0000000, 0.1000000);
		}		
	}
	else
	{
		bPrimed = false;
		// End:0x58
		if(!IsFiring())
		{
			PlayAnim(ClipReleaseAltAnim, 1.0000000, 0.1000000);
		}
	}
	//return;	
}

function ServerStartReload(optional byte i)
{
	// End:0x18
	if(Ammo[0].AmmoAmount < 1)
	{
		return;
	}
	// End:0x33
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x7D
	if((FireMode[0].NextFireTime > Level.TimeSeconds) || FireMode[1].NextFireTime > Level.TimeSeconds)
	{
		return;
	}
	ClientStartReload(i);
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x16
	if(int(ClientState) == int(4))
	{
		ServerStartReload();
	}
	//return;	
}

simulated function float ChargeBar()
{
	return FClamp(FireMode[0].HoldTime - 0.5000000, 0.0000000, 2.0000000) / float(2);
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist, Height, Result;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	Result = 0.5000000;
	// End:0xD9
	if(dist > float(500))
	{
		Result -= 0.4000000;		
	}
	else
	{
		Result += 0.4000000;
	}
	// End:0x108
	if(Abs(Height) > float(32))
	{
		Result -= (Height / dist);
	}
	// End:0x11A
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
	local float Result, dist, Height;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return AIRating;
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	Result = AIRating;
	Result += (Height / float(-500));
	// End:0x13C
	if(Height > float(-200))
	{
		// End:0x111
		if(dist > float(800))
		{
			Result -= ((dist - float(800)) / float(2000));
		}
		// End:0x13C
		if(dist < float(500))
		{
			Result -= (float(1) - (dist / float(500)));
		}
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.2000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.5000000;
	//return;	
}

defaultproperties
{
	PutdownAltAnim="PutawayClipIn"
	ClipReleaseAltAnim="ClipIn"
	GrenadeBone2="MOACTop"
	FuseDelay=14.0000000
	HeldDamage=70
	HeldRadius=350
	HeldMomentum=75000
	HeldDamageType=Class'BWBP_SKC_Pro.DTChaffGrenade_H'
	GrenadeSmokeClass=Class'BWBP_SKC_Pro.ChaffTrail'
	ClipReleaseSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOn',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.7000000,bAtten=true,bNoOverride=false)
	PinPullSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-PinOut',Volume=0.1000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	GrenadeBone="MOAC"
	SpecialInfo[0]=(Id="EvoDefs",Info="60.0;5.0;0.25;30.0;0.0;0.0;0.4")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.ChaffWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.ChaffWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.ChaffWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.ChaffWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.M4A1.BigIcon_MOAC'
	BigIconCoords=(X1=0,Y1=16,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Pullout',Volume=0.1120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Putaway',Volume=0.1110000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.NRP57InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=7,A=166),Color2=(R=12,G=26,B=255,A=229),StartSize1=112,StartSize2=210)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Grenade=true
	ManualLines[0]="Throws a chaff grenade overarm. Upon striking a surface, it explodes, producing a cloud of smoke, dealing minor damage in a wide radius and extinguishing any nearby FP7 fires."
	ManualLines[1]="Melee attack with the grenade. Damage increases over hold time, with the maximum being reached after 1.5 seconds of holding. As a blunt attack, inflicts a short-duration blind when striking."
	ManualLines[2]="Synergises with the MARS-2."
	FireModeClass[0]=Class'BWBP_SKC_Pro.ChaffPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.ChaffSecondaryFire'
	SelectAnimRate=2.0000000
	PutDownAnimRate=2.0000000
	BringUpTime=0.9000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.4000000
	CurrentRating=0.4000000
	Description="MOA-C Chaff Rifle Grenade||Manufacturer: Majestic Firearms 12|Primary: Throw Grenade|Secondary: Melee |Special: Release Clip||Majestic Firearm 12's MOA-C Chaff Grenade is designed to be barrel fired with any* type of rifle round on the market. There's no need to unload your rifle to fire a grenade; the grenade stem's primer catches the bullet to ignite the shaped charge of the stem while leaving the barrel, offering a two stage propellant system that gives the grenade a greater velocity than standard rifle grenades. The MOA-C Chaff Grenade can also be utilized by infantry not equipped with the G51 Carbine as a hand thrown grenade. The soldier simply primes the grenade by twisting the cap and throws it. Due to the shaped charge still being present at the time of impact, the grenade tends to produce a higher explosive yield when thrown rather than shot from the rifle. Majestic Firearms 12 is not responsible injuries caused by inappropriate use of the grenade in this manner."
	Priority=13
	HudColor=(R=150,G=150,B=150,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	PickupClass=Class'BWBP_SKC_Pro.ChaffPickup'
	PlayerViewOffset=(X=0.0000000,Y=3.0000000,Z=-12.0000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	AttachmentClass=Class'BWBP_SKC_Pro.ChaffAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.M4A1.SmallIcon_MOAC'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="MOA-C Chaff Grenade"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.MOAC_FPm'
	DrawScale=0.3000000
}
